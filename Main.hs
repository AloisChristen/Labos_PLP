import Control.Exception
import System.IO
import System.IO.Error
import Text.Read


-- 39. Lecture de fichier

counter file = catch (count file) handler

count file =
 do
  contents <- readFile file
  let n = countLine contents 0
  putStrLn $ "Le fichier contient " ++ (show n) ++ " lignes."


handler :: IOError -> IO ()
handler e = putStrLn "Oups, problème..."


countLine [] count = count
countLine (x:xs) count
  | x == '\n' = countLine xs (count + 1)
  | otherwise = countLine xs count


-- 40. Tokenisation

isSpecial c = elem c "=+-*<>"
isSpace c = elem c " "
isNumber c = elem c ['0'..'9']
isAlphabet c = elem c ['a'..'z'] ++ ['A'..'Z']

tokenize' [] = []
tokenize' (c:cs)
 | isSpace c = tokenize' cs
 | isNumber c = number (c:cs)
 | isSpecial c = special (c:cs)

special cs = token:tokenize' rest
 where (token,rest) = span isSpecial cs

number cs =