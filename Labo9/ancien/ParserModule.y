{ 
module ParserModule where 
import LexerModule 
} 

%name parser 
%tokentype { Token } 
%error { parseError }

-- Liste des terminaux de la grammaire
%token
    Integer   { TInt $$ }
    "="       { TSym "=" }
    "+"       { TSym "+" }
    "-"       { TSym "-" }
    "*"       { TSym "*" }
    "/"       { TSym "/" }
    "%"       { TSym "%" }
    "^"       { TSym "^" }
    "&&"      { TSym "&&" }
    "||"      { TSym "||" }
    let       { TLet }
    in        { TIn }
    if        { TIf }
    then      { TThen }
    else      { TElse }
    "=="      { TComp "==" }   
    "!="      { TComp "!=" }   
    "<"       { TComp "<" }   
    "<="      { TComp "<=" }
    ">"       { TComp ">" }
    ">="      { TComp ">=" }
    var       { TVar $$ }
    func      { TFct $$ }
    def       { TDef }
    "("       { TLeftParenthesis }
    ")"       { TRightParenthesis }   

-- Définition des priorités et associativité
%right in else
%left "+" "-" "||"
%left "*" "/" "%" "&&"
%left "^"
%left "==" "!=" "<" "<=" ">" ">="

%% -- Passage au règles de grammaire

-- Règles de la grammaire

Line : Def {$1} | Exp {$1}

Def : def func Vars "=" Exp   {Def $2 $3 $5}

Exp : let var "=" Exp in Exp    { Let $2 $4 $6 }
    | if Exp then Exp else Exp  { If $2 $4 $6 }
    | Exp "+" Exp               { Bin "+" $1 $3 }
    | Exp "-" Exp               { Bin "-" $1 $3 }
    | Exp "*" Exp               { Bin "*" $1 $3 }
    | Exp "/" Exp               { Bin "/" $1 $3 }
    | Exp "%" Exp               { Bin "%" $1 $3 }
    | Exp "^" Exp               { Bin "^" $1 $3 }
    | Exp "&&" Exp              { Bin "&&" $1 $3 }
    | Exp "||" Exp              { Bin "||" $1 $3 }
    | Exp "==" Exp              { Bin "==" $1 $3 }
    | Exp "!=" Exp              { Bin "!=" $1 $3 }
    | Exp "<" Exp               { Bin "<" $1 $3 }
    | Exp ">" Exp               { Bin ">" $1 $3 }
    | Exp ">=" Exp              { Bin ">=" $1 $3 }
    | Exp "<=" Exp              { Bin "<=" $1 $3 }
    | Integer                   { Cst $1 }
    | func "(" Exps ")"         { App $1 $3}
    | var                       { Var $1 }
    | "(" Exp ")"               { Par $2 }

Exps : Exp  {[$1]}
     | Exp Exps { $1:$2}

Vars : var {[$1]}
     | var Vars {$1:$2}

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

type Exps = [Exp]
data Exp =
    App Identifier Exps     |
    Let Identifier Exp Exp  |
    If  Exp Exp Exp         | 
    Bin Identifier Exp Exp  | 
    Cst Int                 |
    Par Exp                 |
    Def Identifier Exps Exp |
    Var Identifier 
    deriving Show

}
-- Définition du type Exp utilisé pour construire l"arbre syntaxique
