{
-- Définition du nom du module et des exports
module LexerModule (lexer, Name, Op, Token(..)) where
}
-- Le wrapper définit le type d'analyseur que Alex va générer
%wrapper "basic"

-- Macros
$digit = 0-9       -- Macro pour les chiffres. 
$alpha = [A-Za-z]  -- Macro pour les lettres

-- Règles 
-- chaque règle doit spécifier une lambda expression 
tokens :-
    $white+                   ;
    $digit+                   { \s -> TInt (read s) }
    v_[$alpha $digit \_]+     { \s -> TVar s }
    f_[$alpha $digit \_]+     { \s -> TFct s }
    \(                        { \s -> TLeftParenthesis } 
    \)                        { \s -> TRightParenthesis }
    [\=\+\-\*\/\%\^]          { \s -> TSym s }
    "&&" | "||"               { \s -> TSym s }
    "==" | "!="               { \s -> TComp s }
    "<" | "<=" | ">" | ">="   { \s -> TComp s }
    if                        { \s -> TIf }
    then                      { \s -> TThen }
    else                      { \s -> TElse }
    let                       { \s -> TLet }
    in                        { \s -> TIn }
    def                       { \s -> TDef}
    ","                       { \s -> TSym s }
 
{ 
-- Définition du type Token.
type Name = [Char]
type Op = [Char]
data Token = 
    TVar Name  | 
    TFct Name  |
    TLet | TIn |
    TDef |
    TLeftParenthesis | TRightParenthesis |
    TIf | TElse | TThen | 
    TInt Int | 
    TSym Op | TComp Op  
    deriving (Eq,Show)

-- Alias du nom de la fonction d'analyse lexicale.
lexer = alexScanTokens
}
