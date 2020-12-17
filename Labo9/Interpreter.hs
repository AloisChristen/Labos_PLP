
module InterpreterModule where
import Data.Bool
import LexerModule
import ParserModule

bToI v x y = if v x y then 1 else 0

eval (Cst n) _ = n
eval (Par exp) env = eval exp env

eval (Bin "+"  x y) env = (eval x env) + (eval y env)
eval (Bin "-"  x y) env = (eval x env) - (eval y env)
eval (Bin "*"  x y) env = (eval x env) * (eval y env)
eval (Bin "/"  x y) env = (eval x env) `div` (eval y env)
eval (Bin "%"  x y) env = (eval x env) `mod` (eval y env)

eval (Bin "&&" x y) env = if (eval x env) >= 1 &&  (eval y env) >= 1 then 1 else 0
eval (Bin "||" x y) env = if (eval x env) >= 1 ||  (eval y env) >= 1 then 1 else 0
eval (Bin "==" x y) env = bToI (==) (eval x env) (eval y env)
eval (Bin "!=" x y) env = bToI (/=) (eval x env) (eval y env)
eval (Bin "<" x y)  env = bToI (<)  (eval x env) (eval y env)
eval (Bin "<=" x y) env = bToI (<=) (eval x env) (eval y env)
eval (Bin ">" x y)  env = bToI (>)  (eval x env) (eval y env)
eval (Bin ">=" x y) env = bToI (>=) (eval x env) (eval y env)

eval (If x y z) env = if (eval x env) > 0 then (eval y env) else (eval z env)
eval (Let name value exp) env = eval exp ((name, eval value env):(fst env), snd env) 

eval (Var name) (vars, _) = eval' name vars
    where eval' name [] = error $ "Undefined variable : " ++ name
          eval' name ((var, val):vars) =
            if var == name then val else eval' name vars
eval (App func xs) env =
    eval body $ expand env vars xs 
        where (vars, body) = extract func env

expand env [] [] = env
expand env (v:vs) (x:xs) = ((v, eval x env):vars, funcs)
    where (vars, funcs) = expand env vs xs

extract name (_, funcs) = extract' name funcs
    where
        extract' name [] = error $ "Undefined function : " ++ name
        extract' name ((func, vars, body):funcs) 
            | func == name = (vars, body)
            | otherwise = extract' name funcs

value name (vars, _) = value' name vars
    where 
        value' name [] = error $ "Undefined variable : " ++ name
        value' name ((var, val):vars)
            | var == name = val
            | otherwise = value' name vars
predecessor = ("f_pred", ["v_x"], Bin "-" (Var "v_x") (Cst 1))
factorielle = ("f_fact", ["v_x"], 
                If (Var "v_x")
                    (Bin "*" (Var "v_x") (App "f_fact" [App "f_pred" [Var "v_x"]]))
                    (Cst 1)
              )
fibonacci = ("f_fibo", ["v_x"], 
                If (Bin "<=" (Var "v_x") (Cst 1))
                   (Cst 1)
                   (Bin "+" 
                        (App "f_fibo" [App "f_pred" [Var "v_x"]]) 
                        (App "f_fibo" [App "f_pred" [App "f_pred" [Var "v_x"]]])
                   )
            )
funcs = [fibonacci, factorielle, predecessor]


evalLine (Exp exp) env = (Just (eval exp env), env)
evalLine (Def (DefVar name exp)) env = (Nothing, expand env [name] [exp])
evalLine (Def (DefFunc name params exp)) (vars, funcs) =
    (Nothing, (vars, (name, params, exp):funcs))

repl = repl' ([], funcs)
repl' env =
    do 
        putStr "SPL>"
        line <- getLine
        let tokens = lexer line
        putStrLn $ show tokens
        let ast = parser tokens
        putStrLn $ show ast
        let result = evalLine ast env
        case (fst result) of
           Just a  ->   putStrLn $ show a
           Nothing ->   putStrLn $ show "Environnement expanded"
        repl' (snd result)
        
