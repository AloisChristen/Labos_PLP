-- :cd d:\CloudStation\Formation\HEIG-VD\Modules en cours\PLP\Laboratoires\PLP-SPL
-- :l Test.hs

module Test where

import LexerMin
import ParserMin

value v [] = error $ v ++ " not found (value)"
value v ((var, val) : env) =
  if v == var then val else value v env

eval (Cst n) _ = n
eval (Bin "+" x y) env = (eval x env) + (eval y env)
eval (Var v) env = value v env
eval (Let v x y) env = eval y ((v, eval x env) : env)

env = [("varX", 3)]

expTest = parser $ lexer "let varX=12*3+26 in varX*varX"

expTest2 = parser $ lexer "1+1"