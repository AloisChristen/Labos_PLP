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
    "("       { TLeftParenthesis }
    ")"       { TRightParenthesis }   
    "="       { TSym "=" }
    "+"       { TSym "+" }
    "-"       { TSym "-" }
    "*"       { TSym "*" }
    "/"       { TSym "/" }
    "%"       { TSym "%" }
    "&&"      { TSym "&&" }
    "||"      { TSym "||" }
    "=="      { TComp "==" }   
    "!="      { TComp "!=" }   
    "<"       { TComp "<" }   
    "<="      { TComp "<=" }
    ">"       { TComp ">" }
    ">="      { TComp ">=" }
    if        { TIf }
    then      { TThen }
    else      { TElse }
    let       { TLet }
    in        { TIn }
    var       { TVar $$ }
    func      { TFct $$ }
    def       { TDef }

-- Définition des priorités et associativité
%right in else "="  
%left "+" "-" "||"
%left "*" "/" "%"  "&&"
%left "==" "!=" "<" "<=" ">" ">="

%% -- Passage au règles de grammaire

-- Règles de la grammaire

Line : Def                      {Def $1 } 
     | Exp                      {Exp $1 }

Def : def func "(" Params ")" "=" Exp { DefFunc $2 $4 $7 }
    | def var "=" Exp               {DefVar $2 $4}

Exp : 
      Exp "+" Exp               { Bin "+" $1 $3 }
    | Exp "-" Exp               { Bin "-" $1 $3 }
    | Exp "*" Exp               { Bin "*" $1 $3 }
    | Exp "/" Exp               { Bin "/" $1 $3 }
    | Exp "%" Exp               { Bin "%" $1 $3 }
    | Exp "&&" Exp              { Bin "&&" $1 $3 }
    | Exp "||" Exp              { Bin "||" $1 $3 }
    | Exp "==" Exp              { Bin "==" $1 $3 }
    | Exp "!=" Exp              { Bin "!=" $1 $3 }
    | Exp "<" Exp               { Bin "<" $1 $3 }
    | Exp ">" Exp               { Bin ">" $1 $3 }
    | Exp ">=" Exp              { Bin ">=" $1 $3 }
    | Exp "<=" Exp              { Bin "<=" $1 $3 }
    | Integer                   { Cst $1 }
    | if Exp then Exp else Exp  { If $2 $4 $6 }
    | let var "=" Exp in Exp    { Let $2 $4 $6 }
    | func "(" Exps ")"         { App $1 $3}
    | var                       { Var $1 }
    | "(" Exp ")"               { Par $2 }


Exps : Exp  {[$1]}
     | Exp Exps { $1:$2}
Params : var {[$1]}
       | var Params {$1:$2}

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

type Exps = [Exp]
type Params = [Name]
data Line = 
    Def Def | 
    Exp Exp 
    deriving Show
data Def = 
    DefVar Name Exp |
    DefFunc Name Params Exp
    deriving Show
data Exp =
    App Name Exps     |
    Let Name Exp Exp  |
    Par Exp           |
    Bin Op Exp Exp  | 
    If Exp Exp Exp |
    Var Name | 
    Cst Int 
    deriving Show

}
-- Définition du type Exp utilisé pour construire l"arbre syntaxique
