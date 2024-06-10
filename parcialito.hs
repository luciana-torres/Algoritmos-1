--Ejercicio2

-- a
{-
data MarcaMicro= Intel | AMD  
data Nucleos = DualCore | QuadCore | HexaCore | OctaCore
data MarcaRam = Kingston | Markision | Patriot
data MarcaPMadre = Asus | Asrock | MSI
data Chipset = A630 | B650 | B660 | B760


type Gigas = Int
type MAxFrec = Float


data ComponentePC = Micro MarcaMicro Nucleos MAxFrec 
                    | Ram MarcaRam Gigas
                    | PlacaMadre MarcaPMadre Chipset 

cuantosMicros :: [ComponentePC] -> MarcaMicro -> Int
cuantosMicros [] _ = 0
cuantosMicros (Micro Intel _ _ :cs) Intel = 1 + cuantosMicros cs Intel
cuantosMicros (Micro AMD _ _ :cs) AMD = 1 + cuantosMicros cs AMD
cuantosMicros (c:cs) mm = cuantosMicros cs mm


ejemplo :: [ComponentePC]
ejemplo = [(Micro AMD HexaCore (7.0)),(Micro Intel DualCore 4.0),(Ram Kingston 5)]

mismoChipset :: Chipset -> Chipset -> Bool
mismoChipset A630 A630 = True
mismoChipset B650 B650 = True
mismoChipset B660 B660 = True
mismoChipset B760 B760 = True

mismoChipset _ _ = False

mismoNucleo :: Nucleos -> Nucleos -> Bool
mismoNucleo DualCore DualCore = True
mismoNucleo QuadCore QuadCore = True
mismoNucleo HexaCore HexaCore = True
mismoNucleo OctaCore OctaCore = True
mismoNucleo _ _ = False



instance Eq Chipset where
    c1==c2 = mismoChipset c1 c2

instance Eq Nucleos where
    n1 == n2 = mismoNucleo n1 n2

instance Eq ComponentePC where
    (Micro _ n _) == (Micro _ ncl _) = (n==ncl)
    (Ram _ gg) == (Ram _ ggs) = (gg==ggs)
    (PlacaMadre _ chp)==(PlacaMadre _ chpt) = (chp==chpt)                         

igualdad :: ComponentePC -> ComponentePC -> Bool
igualdad  (Micro _ n _) (Micro _ ncl _) = (n==ncl)
igualdad   (Ram _ gg) (Ram _ ggs) = (gg==ggs)
igualdad   (PlacaMadre _ chp) (PlacaMadre _ chpt) = (chp==chpt) 
igualdad _ _ = False

--ejerciio repaso laboratorio
promedio :: [Int] -> Float
promedio [] = 0
promedio xs = sum xs / length xs

existemas8 :: [Int] -> Bool
existemas8 (x:xs) = x==8 || existemas8 xs

type Nombre = String
type Edad = Int
type Calificacion = Int

data EstadosEstudiantes = EvolucionDelEstudiante Nombre Edad [Calificacion] EstadosEstudiantes | NoHayEstudiantes

avanzarDeAño :: EstadosEstudiantes -> String -> Bool
avanzarDeAño NoHayEstudiantes _ = False
avanzarDeAño (EvolucionDelEstudiante nombre ed cs ee) nbre
                                                                | promedio cs > 7 || promedio cs == 7 = True
                                                                | promedio cs > 6 && existemas8 cs = True
                                                                | otherwise = False
-}

--parcial 2024 tema A
data Categoria = Bulbosas | Rosales | Frutales | Trepadoras
data Floracion = Primavera | Verano | Invierno
data TipoSemilla = Flores | Hortalizas | Aromaticas
data Material = Plastico | Barro

type Hoja = String
type Precio = Int

mismaCategoria :: Categoria -> Categoria -> Bool
mismaCategoria Bulbosas Bulbosas = True
mismaCategoria Rosales Rosales = True
mismaCategoria Frutales Frutales = True
mismaCategoria Trepadoras Trepadoras = True
mismaCategoria _ _ = False

data ProductosVivero = Planta Categoria Floracion Hoja Precio |Semilla TipoSemilla Hoja Precio |Maceta  Material Precio
instance Eq  Categoria where 
    c1 == c2 = mismaCategoria c1 c2

cuantasPlantas :: [ProductosVivero] -> Categoria -> Int
cuantasPlantas [] _ = 0
cuantasPlantas ((Planta cat _ _ _):cs) ct
                                            | (cat == ct) = 1 + cuantasPlantas cs ct
cuantasPlantas (c: cs) ct = cuantasPlantas cs ct

--ejercicio 2

data MovieList = Movie Titulo MeGusta Estado Duracion MovieList |SinMovie

type Titulo = String
type MeGusta =Int
type Duracion = Int

data Estado = Reproducido | SinReproducir

minutosReproducidos :: MovieList -> MeGusta -> Duracion
minutosReproducidos (Movie _ mg _ dr mls) meg
                                                | (mg > meg || mg==meg) = dr + minutosReproducidos mls meg
minutosReproducidos SinMovie _ = 0