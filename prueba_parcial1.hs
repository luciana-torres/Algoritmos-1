
--4)
--reducir :: [a] -> (a -> a -> a) -> a
--reducir [x] _ = x
--reducir (x: xs) p = p x (reducir p xs)

--TEMA B PARCIAL 1 2020

--2
{-cuentaDNI :: [Int] -> Int
cuentaDNI [] = 0
cuentaDNI x: xs
                | estaEnDni x = 1 + cuentaDNI xs
                | otherwise = cuentaDNI xs 
-}
--PARCIAL 2023 TEMA H
--a)

data Luminosidad = SuperGigante | Gigante | SecuenciaPrincipal | Enana deriving Show
data Temperatura = A | B | F | G | K | M deriving Show
data Estructura = Rocoso | Gaseoso deriving Show

type Nombre = String
type NumSat = Int
type DistEstrella = Float
data Astro = Estrella Luminosidad Temperatura Nombre | Planeta Estructura NumSat DistEstrella deriving Show


--b)
masSatelites :: [Astro] -> Int -> [Astro]
masSatelites [] _ = []
masSatelites (Estrella {} : xs) n = masSatelites xs n
masSatelites (Planeta e ns de : xs) n
                                        | n <= ns = Planeta e ns de : masSatelites xs n
                                        | otherwise = masSatelites xs n

--PARCIAL 2023 TEMA C
--Contructores para planta
data TipoPlanta = PlenoSol | MediaSombra | Floral | Frutal deriving Eq
data Ubicacion= Exterior | Interior deriving Eq
data Agua = MuyResistente | Resistente | NadaResistente

type Precio = Int
--Constructores paraa maceta
data TipoMaceta = Terracota | FibroCemento | Plastico deriving Eq
data Forma = Cuadrada | Redonda

--Constructores semillas
data TipoSemilla= Hortalizas | Aromaticas | Cesped

type Peso = Float

data ProductoDeVivero = Planta TipoPlanta Ubicacion Agua Precio | Maceta  TipoMaceta Forma Precio| Semilla TipoSemilla Peso Precio


cuantasPlantas :: [ProductoDeVivero] -> TipoPlanta -> Int
cuantasPlantas [] _ = 0
cuantasPlantas ((Planta (tp) (_) (_) (_)): pvs) tp'
                                                    | (tp == tp') = 1 + cuantasPlantas pvs tp'
                                                    | otherwise = cuantasPlantas pvs tp'

{-
*Main> cuantasPlantas [(Planta (PlenoSol) (Exterior) (Resistente) (5))] PlenoSol
1
-}

igualdad :: ProductoDeVivero -> ProductoDeVivero -> Bool
igualdad (Planta (tp) (ub) (_) (_)) (Planta (tp') (ub') (_) (_))
                                                                | (tp == tp') && (ub == ub') = True
                                                                | otherwise = False
igualdad (Maceta (tm) (_) (_)) (Maceta (tm')(_) (_))
                                                    | (tm == tm') = True
                                                    | otherwise = False
igualdad (Semilla (_) (ps) (pc)) (Semilla (_) (ps') (pc'))
                                                            | (ps == ps') && (pc == pc') = True
                                                            | otherwise = False
igualdad (_) (_) = False


--Ejercicio 3
type Altura = Int 
type TotalHojas = Int 
type HojasFlorecidas = Int 
type Meses = Int 
data EstadoHojas = MuchasQuemadas | PocasQuemadas | Saludables deriving (Show, Eq)

data RegistroPlanta = NoDato | DatoPlanta EstadoHojas Altura TotalHojas HojasFlorecidas Meses RegistroPlanta

transplantar :: RegistroPlanta -> Int -> Bool
transplantar (DatoPlanta (Saludables) alt (_) ms (_) (_)) ms'
                                                            | (alt > 40) && (ms > ms') = True
transplantar (DatoPlanta (PocasQuemadas) alt (_) ms (_) (_)) ms' 
                                                            | (alt > 40) && (ms > ms') = True
transplantar (DatoPlanta (MuchasQuemadas) (_) hj ms (_) (_)) ms'
                                                            | (hj > 10) && (ms > ms') = True
transplantar (DatoPlanta (_) (_) (_) (_) (_) rp) ms' = transplantar rp ms'
    
--EJERCICIO 3
data Nivel = Uno | Dos | Tres deriving Eq

type NotaF = Int
type NotaP = Int
type NotaS = Int

data NotasDeIngles = EvolucionDelEstudiante String Nivel NotaP NotaS NotaF NotasDeIngles | NoHayMasEstudiantes deriving Eq
pasaDeNivel :: NotasDeIngles -> String -> Bool
pasaDeNivel NoHayMasEstudiantes nmb' = False

pasaDeNivel (EvolucionDelEstudiante (nmb) (n1) (np) (ns) (nf) (ni)) nmb'
                                                                        | (nmb == nmb') && (n1 == Uno || n1==Dos) && (np> 7 || ns > 7) && (nf > 6) = True
                                                                        | otherwise = pasaDeNivel ni nmb'

pasaDeNivel (EvolucionDelEstudiante (nmb) (n1) (np) (ns) (nf) (ni)) nmb'
                                                                    | (nmb == nmb') && (n1 == Tres) && (np> 5 && ns > 5) && (nf > 6) = True
                                                                    | otherwise = pasaDeNivel ni nmb'

ejemplo1 :: NotasDeIngles
ejemplo1 = (EvolucionDelEstudiante "PEDRO" Dos 8 9 7(NoHayMasEstudiantes))

--Tema G 2023
data Categoria = Literatura | Autoayuda | Comics | Infantiles deriving Eq
data Editorial = Altea | Panini | Minotauro
data Marca = Monoblock | Papikra

type Titulo = String
type Año = Int

data ArticulosDeLibreria = Libro Categoria Editorial Titulo Precio | Agenda Marca Año Precio | Cuaderno Marca Precio

cuantosLibros :: [ArticulosDeLibreria] -> Categoria -> Int
cuantosLibros [] _ = 0
cuantosLibros ((Libro ct (_) (_) (_)) :ls ) c
                                                | (ct == c) = 1 + cuantosLibros ls c
                                                | otherwise = cuantosLibros ls c


igualdadA :: ArticulosDeLibreria -> ArticulosDeLibreria -> Bool
igualdadA (Libro (_) (Altea) (tit) (_)) (Libro (_) (Altea) (tit') (_))
                                                                        |(tit == tit') = True
                                                                        | otherwise = False
igualdadA (Libro (_) (Panini) (tit) (_)) (Libro (_) (Panini) (tit') (_))
                                                                        |(tit == tit') = True
                                                                        | otherwise = False
igualdadA (Libro (_) (Minotauro) (tit) (_)) (Libro (_) (Minotauro) (tit') (_))
                                                                                |(tit == tit') = True
                                                                                | otherwise = False
igualdadA (Agenda (Monoblock) (año) (prec)) (Agenda (Monoblock) (año') (prec'))
                                                                                | (año == año') && (prec == prec') = True
                                                                                |otherwise = False
igualdadA (Agenda (Papikra) (año) (prec)) (Agenda (Papikra) (año') (prec'))
                                                                            | (año == año') && (prec == prec') = True
                                                                            |otherwise = False
igualdadA (Cuaderno (Monoblock) (prec)) (Cuaderno (Monoblock) (prec'))
                                                                    |(prec == prec') = True
                                                                    |otherwise = False
igualdadA (Cuaderno (Papikra) (prec)) (Cuaderno (Papikra) (prec'))
                                                                    |(prec == prec') = True
                                                                    |otherwise = False
