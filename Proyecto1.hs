-- #ejercicio 1#
-- Ejercicio 1.1
esCero :: Int -> Bool
esCero x = x == 0

{-
 esCero 1
False

 esCero 5
False 
-}

-- Ejercicio 1.2
esPositivo :: Int -> Bool
esPositivo x = (x > 0) || (x ==0)

{- 
 esPositivo 5
True
*Main> esPositivo (-8)
False
-}

-- Ejercicio 1.3
esVocal :: Char -> Bool
esVocal x
            |(x == 'a') || (x == 'e') || (x == 'i') || (x == 'o') || (x == 'u') = True
            | otherwise = False

{-
*Main> esVocal 'i'
True
*Main> esVocal 'j'
False
-}

-- Ejercicio 1.4
valorAbsoluto :: Int -> Int
valorAbsoluto x 
                  | (x > 0) = x
                  | (x == 0) = 0
                  | (x < 0) = (-1)*x

{- 
*Main> valorAbsoluto (-3)
3
*Main> valorAbsoluto 8)
8
-}

-- # Ejercico 2
-- Ejercicio 2.a
todos :: [Bool] -> Bool
todos [] = False
todos (x: xs) 
                | (x == True) && (todos xs) = True
                | otherwise = False

{- 
*Main> todos [True,False]
False
*Main> Todos [True,True]
True
-}

-- Ejercicio 2.b
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

{-
*Main> sumatoria [7, 8, 9]
24
*Main> sumatoria [5, 3, 7]
15
-}

-- Ejercicio 2.c 
productoria :: [Int] -> Int
productoria [] = 1
productoria (x : xs) = x * productoria xs

{-
*Main> productoria [1, 2, 3]
6
*Main> productoria [4, 5]
20
-}

-- Ejercicio 2.d
factorial :: Int ->  Int
factorial 0 = 1
factorial n = n * factorial (n-1)

{-
*Main> factorial 0
1
*Main> factorial 5
120
-}

--Ejercicio 2.e
promedio :: [Int] -> Int
promedio xs = div (sumatoria xs) (length xs)



--Ejercicio 3
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x : xs) 
                    | (n == x) || (pertenece n xs) = True 
                    | otherwise = False  

{- 
*Main> pertenece 3 [5, 6, 9]
False
*Main> pertenece 5 [5, 2, 8]
True
-}

-- #Ejercico 4 
-- Ejercico 4.a

paraTodo' :: (Eq a ,Ord a) => [a] -> (a -> Bool) -> Bool
paraTodo' [] _ = False
paraTodo' (x:xs) p  
                    | p x == True = paraTodo' xs p
                    | p x /= True = False
{-
paraTodo' [2,1,3,4,5,6] esCero 
False
paraTodo' [1, 2] (<0)
False
-}

--Ejercicio 4.b
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x : xs) p = (p x) || (existe' xs p) --p predicado

{-
existe' [12, 3, 4] (<0)
False
-}

-- Ejercicio 4.c
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] _ = 0
sumatoria' (x : xs) p = p x + sumatoria' xs p

{-
*Main> sumatoria' [4,5,3] (+2)
18
*Main> sumatoria' [8, 2, 1] (*5)
55
-}

-- Ejercico 4.d
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] _ = 1
productoria' (x : xs) p = (p x) * productoria' xs p

{-
*Main> productoria' [2, 3, 4] (+4)
336
*Main> productoria' [ 2, 3] (+5)
56
-}

-- Ejercicio 5
paraTodo :: [a] -> (a -> Bool) -> Bool
paraTodo xs p = paraTodo' xs p

{-
*Main> paraTodo [5, 6, 9] (<5)
False
-}

-- Ejercicio 6 
-- Ejercicio 6.a
todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs even

{-
*Main> todosPares [2,4,6]
True
*Main> todosPares [3,4,5]
False
-}

--Ejercicio 6.b 
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (\x -> x `mod` n == 0)

{-
*Main> hayMultiplo 2 [4, 5, 6]
True
*Main> hayMultiplo 3 [2, 6, 8]
True
-}

--Ejercicio 6.c 
sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [1..x] (^2)

{-
*Main> sumaCuadrados 9
285
*Main> sumaCuadrados 3
14
-}

--Ejercicio 6.d 
existeDivisor :: Int-> [Int] -> Bool
existeDivisor n xs = existe' xs (\x -> n `mod` x == 0)

{-
*Main> existeDivisor 5 [10,20,30]
False
*Main> existeDivisor 5 [1,5]
True
-}

--Ejercicio 6.e 
--esPrimo :: Int -> Bool
--esPrimo n = not ( existe' [2..n-1] (existeDivisor n)) || n == 1

--Ejercicio 6.f 
factorial' :: Int -> Int
factorial' x = productoria' [1..x] id

{-
*Main> factorial' 5
120
*Main> factorial' 14
87178291200
-}

--Ejercicio 6.g
--multiplicaPrimos :: [Int] -> Int
--multiplicaPrimos xs = productoria' (esPrimo xs)

--Ejercicio 6.h 

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib ( n - 2)
{-
*Main> fib 5
5
*Main> fib 9
34
-}

{-
esFib :: Int -> Bool
esFib n = pertenece n (map (fib [0..(n+1)]))
-}

--Ejercicio 6.i

--Ejercicio 7
{-
:t map
map :: (a -> b) -> [a] -> [b]
-} 
{-
:t filter
filter :: (a -> Bool) -> [a] -> [a]
-}

{-
map f xs is the list obtained by applying f to each element of xs
 filter, applied to a predicate and a list, returns the list of those elements that satisfy the predicate
-}

{-
map succ [1, -4, 6, 2, -8]
[2, -3, 7, 3, -7]

filter esPositivo [1, -4, 6, 2, -8]

-}

--Ejercicio 8
--a usando recursion
duplicaL :: [Int] -> [Int]
duplicaL [] = []
duplicaL (x:xs) = ((2*x) : duplicaL xs)

{-
*Main> duplicaL [2, 4]
[4,8]
*Main> duplicaL [3, 8, 10]
[6,16,20]
-}

--b usando map
map' :: (a -> b) -> [ a] -> [b]
map' _ [] = [] -- caso base lista vacia
map' p (x : xs) = p x : map' p xs 

duplica :: Int -> Int
duplica x = x * 2

duplicaL' :: [Int] -> [ Int]
duplicaL' xs = map' duplica xs

{-
*Main> duplicaL' [5, 13, 8]
[10,26,16]
*Main> duplicaL' [20, 30, 4]
[40,60,8]
-}

{-
--Ejercicio 9
--9.a
listaPrimos :: [Int] -> [Int]
listaPrimos [] = []
listaPrimos (x : xs)
                    | (esPrimo x == True) = x : esPrimo xs
                    | (esPrimo x == False) = esPrimo xs
--9.b
listaPrimos' :: [Int] -> [Int]
listaPrimos' xs = filter esPrimo xs
-}
--9.c

--Ejercicio 10
--10.a
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x : xs)
                        | (n == x) = x : primIgualesA xs
                        | otherwise = []

{-
*Main> primIgualesA 2 [2,2,3,8]
[2,2]
*Main> primIgualesA 4 [5, 6, 9]
[]
-}

--10.b
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (== n) xs

{-
*Main> primIgualesA' 3 [3,2,7]
[7]
*Main> primIgualesA' 13 [7, 55, 67]
[]
-}
--Ejercicio 11
--11.a
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales ( x : y: xs)
                        | x == y = x : primIguales ( y: xs)
                        | otherwise = [x]

{-
*Main> primIguales [True,True,True,False,False]
[True,True,True]
*Main> primIguales [4, 4, 8, 9, 55]
[4,4]
-}

--11.b
primIguales' :: Eq a => [a] -> [a]
primIguales' (x : xs) = primIgualesA' x (x : xs)

{-
*Main> primIguales' [55, 55, 55]
[55,55,55]
*Main> primIguales' [True, False, True]
[True]
-}
