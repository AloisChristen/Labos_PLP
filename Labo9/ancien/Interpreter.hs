
module InterpreterModule where
import ParserModule


type Op = Char
type Name = [Char]
data Exp = App Name [Exp] | Let Name Exp Exp | Var Name
    | Bin Op Exp Exp | Cst Int | If Exp Exp Exp | Def Name [Name] Exp
    deriving (Show)


eval (Bin "+" x y) env = (eval x env) + (eval y env)
eval (Bin "-" x y) env = (eval x env) - (eval y env)
eval (Bin "*" x y) env = (eval x env) * (eval y env)
eval (Bin "/" x y) env = (eval x env) `div` (eval y env)
eval (Bin "^" x y) env = (eval x env) ^ (eval y env)
eval (Bin "%" x y) env = (eval x env) % (eval y env)
eval (Cst n) _ = n
eval (If cond x y) env =
    if eval cond env > 0 then eval x env else eval y env
eval (Var name) env = eval' name env
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

repl =
    do 
        putStr "SPL>"
        line <- getLine
        let tokens = lexer line
        putStrLn $ show tokens
        let ast = parser tokens
        putStrLn $ show ast
        
