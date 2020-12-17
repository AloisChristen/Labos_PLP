-- 17. Facteurs premiers
prime 1 = False
prime 2 = True
prime x = 
    let p = 2:[3,5.. round $ sqrt $ fromIntegral x]
    in null [y | y <- p, mod x y == 0]

factors 0 = []
factors 1 = []
factors n
    | prime n = [n]
    | otherwise = décompose : factors( div n (décompose))
    where décompose = head [x | x <- 2:[3,5..n-1], prime x, mod n x == 0]

-- 20 Récusivité : Nombres
--Ackermann
ack m n
    | m == 0 = n + 1
    | m > 0 && n == 0 = ack (m-1) 1
    | otherwise = ack (m-1) (ack m (n-1))

-- Quotient
quotient _ 0 = error "Division by zero"
quotient n m
    | n < m = 0
    | otherwise = 1 + quotient (n-m) m

-- Puissance 
puissance :: Num a => a -> Int -> a
puissance _ 0 = 1
puissance x 1 = x
puissance x i
    | i < 0 = error "Exponent less than zero"
    | otherwise = x * (puissance x (i-1))


-- 21 Récusivité : Listes

nieme n liste
    | n == 0 = head liste
    | otherwise = nieme (n-1) (tail liste)

duplique liste
    | liste == [] = []
    | otherwise   = x:x: duplique xs
    where 
        x = head liste 
        xs = tail liste

renverse liste
    | liste == [] = []
    | otherwise = renverse xs ++ [x]
    where
        x = head liste
        xs = tail liste

-- version triviale
-- rotation i liste = (drop i liste) ++ (take i liste)
-- version recursive
rotation i liste
   | liste == [] = []
   | i == 0 = liste
   | otherwise = rotation (i-1) (xs ++ [x])
    where
        x = head liste
        xs = tail liste

-- 22 Ensembles

insertion x ensemble
   | ensemble == [] = [x]
   | h == x = ensemble
   | otherwise = h:(insertion x t)
   where
       h = head ensemble
       t = tail ensemble

suppression x ensemble
    | ensemble == [] = []
    | h == x = (suppression x t)
    | otherwise = h:(suppression x t)
   where
       h = head ensemble
       t = tail ensemble

union ensemble1 ensemble2
    | ensemble1 == [] = ensemble2
    | otherwise = union t1 (insertion h1 ensemble2)
    where
       h1 = head ensemble1
       t1 = tail ensemble1

intersection ensemble1 ensemble2
    | ensemble1 == [] || ensemble2 ==[] = []
    | h1 == h2 = h1:(intersection t1 ensemble2)
    | otherwise = intersection ensemble1 t2
    where
        h1 = head ensemble1
        t1 = tail ensemble1
        h2 = head ensemble2
        t2 = tail ensemble2

-- 23 Tri par insertion

triInsertion liste = fst (tri ([], liste))
    where
        tri (trié, init)
            | init == [] = (trié, [])
            | otherwise = tri (insert hi trié, ti)
            where
                hi = head init
                ti = tail init
                insert x liste
                    | liste == [] = [x]
                    | x < h = x:liste
                    |otherwise = h:(insert x liste)
                    where h = head liste


-- 24 Elements pairs et impairs

pairs [] = []
pairs [x] = []
pairs (x1:x2:xs) = x2:(pairs xs)

-- 25 Tri fusion

-- version passe double
--partage liste = (pairs ((head liste):liste), pairs liste)

-- version passe unique
partage [] = ([], [])
partage [x] = ([x], [])
partage (x1:x2:xs) = (x1:(fst p), x2:(snd p)) where p = partage xs

fusion liste1 liste2
    | liste1 == [] = liste2
    | liste2 == [] = liste1
    | h1 <= h2 = h1:(fusion t1 liste2)
    | otherwise = h2:(fusion liste1 t2)
    where
        h1 = head liste1
        t1 = tail liste1
        h2 = head liste2
        t2 = tail liste2

triFusion liste
    | liste == [] = []
    | tail liste == [] = liste
    | otherwise = fusion (triFusion (fst p)) (triFusion (snd p))
    where
        p = partage liste
