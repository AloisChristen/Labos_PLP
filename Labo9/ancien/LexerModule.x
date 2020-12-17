{
-- Définition du nom du module et des exports
module LexerModule (lexer, Identifier, Token(..)) where
}
-- Le wrapper définit le type d'analyseur que Alex va générer
%wrapper "basic"

-- Macros
$digit = 0-9       -- Macro pour les chiffres. 
$alpha = [A-Za-z]  -- Macro pour les lettres

-- Règles, chaque règle doit spécifier une lambda expression de type [Char] -> Token
tokens :-
    $white+                   ;
    $digit+                   { \s -> TInt (read s) }
    [\=\+\-\*\/\%]            { \s -> TSym s }
    "^"                       { \s -> TSym s }
    "&&" | "||"               { \s -> TSym s }
    let                       { \s -> TLet }
    def                       { \s -> TDef }
    in                        { \s -> TIn }
    if                        { \s -> TIf }
    then                      { \s -> TThen }
    else                      { \s -> TElse }
    \=\=|\!\=|\<|\<\=|\>|\>\= { \s -> TComp s }
    v_[$alpha $digit \_]+     { \s -> TVar s }
    f_[$alpha $digit \_]+     { \s -> TFct s }
    \(                        { \s -> TLeftParenthesis } 
    \)                        { \s -> TRightParenthesis }
 
{ 
-- Définition du type Token.
type Identifier = [Char]
data Token = 
    TInt Int | TSym Identifier | TLet | TDef | TIn | TIf | TElse | TThen | 
    TComp Identifier | TVar Identifier | TFct Identifier |
    TLeftParenthesis | TRightParenthesis 
    deriving (Eq,Show)

-- Alias du nom de la fonction d'analyse lexicale.
lexer = alexScanTokens
}
