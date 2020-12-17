import Data.Char

data Personne = Personne {
    prenom :: String,
    nom :: String,
    age :: Int,
    taille :: Float
} deriving (Show)

p1 = Personne {prenom = "alois", nom = "christen", age = 30, taille = 168}
p2 = Personne {prenom = "alexandre", nom = "mottier", age = 26, taille = 172}
p3 = Personne {prenom = "delphine", nom = "scherler", age = 22, taille = 186}
p4 = Personne {prenom = "", nom = "smith", age =89, taille = 143}
listP = [p1, p2, p3, p4]

initiales :: Personne -> [Char]
initiales p
   | null $ prenom p = "X." ++ initiale (nom p) 
   | null $ nom p = (initiale $ prenom p) ++ "X."
   | otherwise = initiale (prenom p) ++ ' ':initiale (nom p)
   where initiale (c:_) = toUpper c:['.']

-- filter (\p -> (initiales p) == "A. C.") listP
