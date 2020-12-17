
module InterpreterModule where
import Data.Bool
import LexerModule
import ParserModule
import Control.Monad

-- From bool to Integer
bToI b = if b then 1 else 0

eval (Cst n) _ = n
eval (Par exp) env = eval exp env
eval (Neg exp) env = - (eval exp env)

eval (Bin "+"  x y) env = (eval x env) + (eval y env)
eval (Bin "-"  x y) env = (eval x env) - (eval y env)
eval (Bin "*"  x y) env = (eval x env) * (eval y env)
eval (Bin "^"  x y) env = (eval x env) ^ (eval y env)
eval (Bin "/"  x y) env = (eval x env) `div` (eval y env)
eval (Bin "%"  x y) env = (eval x env) `mod` (eval y env)

eval (Bin "==" x y) env = bToI $ (==) (eval x env) (eval y env)
eval (Bin "!=" x y) env = bToI $ (/=) (eval x env) (eval y env)
eval (Bin "<"  x y) env = bToI $ (<)  (eval x env) (eval y env)
eval (Bin "<=" x y) env = bToI $ (<=) (eval x env) (eval y env)
eval (Bin ">"  x y) env = bToI $ (>)  (eval x env) (eval y env)
eval (Bin ">=" x y) env = bToI $ (>=) (eval x env) (eval y env)
eval (Bin "&&" x y) env = if (eval x env) >= 1 &&  (eval y env) >= 1 then 1 else 0
eval (Bin "||" x y) env = if (eval x env) >= 1 ||  (eval y env) >= 1 then 1 else 0

eval (If x y z) env = if (eval x env) > 0 then (eval y env) else (eval z env)
eval (Let name value exp) env = eval exp ((name, eval value env):(fst env), snd env) 

eval (Var name) (vars, _) = eval' name vars
    where eval' name [] = error $ "Undefined variable : " ++ name
          eval' name ((var, val):vars) =
            if var == name then val else eval' name vars

eval (App func xs) env =
    eval body $ expand env vars xs 
        where (vars, body) = extract func env

-- Ajoute une variable à l'environnement
expand env [] [] = env
expand env (v:vs) (x:xs) = ((v, eval x env):vars, funcs)
    where (vars, funcs) = expand env vs xs

-- Extrait une function de l'environnement
extract name (_, funcs) = extract' name funcs
    where
        extract' name [] = error $ "Undefined function : " ++ name
        extract' name ((func, vars, body):funcs) 
            | func == name = (vars, body)
            | otherwise = extract' name funcs

-- Extrait la valeur d'une variable de l'environnement
value name (vars, _) = value' name vars
    where 
        value' name [] = error $ "Undefined variable : " ++ name
        value' name ((var, val):vars)
            | var == name = val
            | otherwise = value' name vars

-- Fonctions déjà présente de base            
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

basicFuncs = [fibonacci, factorielle, predecessor]

-- Evaluation d'une ligne de code : 
-- expression avec valeur de retour 
evalLine (Exp exp) env = (Just (eval exp env), env)
-- ajout d'une variable dans l'environnement
evalLine (Def (DefVar name exp)) env = (Nothing, expand env [name] [exp])
-- ajout d'une fonction dans l'environnement
evalLine (Def (DefFunc name params exp)) (vars, funcs) =
    (Nothing, (vars, (name, params, exp):funcs))

repl = repl' ([], basicFuncs)
repl' env =
    do 
        putStr "SPL>"
        line <- getLine
        when ( not $ null line) $ do
            let tokens = lexer line
            putStrLn $ show tokens
            let ast = parser tokens
            putStrLn $ show ast
            let result = evalLine ast env
            case (fst result) of
                Just a  ->   putStrLn $ show a
                Nothing ->   putStrLn $ show "Environnement expanded"
            -- Rappel de repl' avec le nouvel environnement,
            -- possiblement augmenté
            repl' (snd result)
        
