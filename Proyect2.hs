--PROYECTO 2--

-- Ejercicio 1
-- a)
data Carrera = Matematica | Fisica | Computacion | Astronomia

-- b)
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

{-
*Main> titulo Fisica
"Licenciatura en Fisica"
*Main> titulo Computacion
"Licenciatura en Computacion"
-}

-- c)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si  deriving (Eq,Ord) 


--d)
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

{-
*Main> cifradoAmericano Do
'C'
*Main> cifradoAmericano La
'A'
-}

--Ejercicio 
{- 
a) Definir usando polimorfismo ad hoc la funci ́on minimoElemento que calcula (de manera
recursiva) cu ́al es el menor valor de una lista de tipo [a]. Asegurarse que s ́olo est ́e
definida para listas no vac ́ıas.
b) Definir la funci ́on minimoElemento’ de manera tal que el caso base de la recursi ́on
sea el de la lista vac ́ıa. Para ello revisar la clase Bounded.

Ayuda: Para probar esta funci ́on dentro de ghci con listas vac ́ıas, indicar el tipo concre-
to con tipos de la clase Bounded, por ejemplo: ([1,5,10]::[Int]), ([]::[Bool]),

etc.
c) Usar la funci ́on minimoElemento para determinar la nota m ́as grave de la melod ́ıa:
[Fa, La, Sol, Re, Fa]
-}
--3.a
minimoElemento :: Ord a => [a] -> a 
minimoElemento [x] = x
minimoElemento (x:y:xs) 
                        | x<y = minimoElemento (x:xs)
                        | otherwise = minimoElemento (y:xs)

{-
*Main> minimoElemento [1, 6, 18]
1
*Main> minimoElemento [66, 8, 49]
8
-}

--3.b 
minimoElemento' :: (Bounded a, Ord a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' xs = minimum xs

--Ejercicio 4
{-
a) Implement ́a el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura,
Zona, etc) tal como est ́an definidos arriba.
b) ¿Cu ́al es el tipo del constructor Ciclista?
c) Program ́a la funci ́on contar_velocistas :: [Deportista] -> Int que dada una
lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs
d) Program ́a la funci ́on contar_futbolistas :: [Deportista] -> Zona -> Int que
dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
incluidos en xs que juegan en la zona z. Programa contar_futbolistas sin usar
igualdad, utilizando pattern matching.
e) ¿La funci ́on anterior usa filter? Si no es as ́ı, reprogramala para usarla.
-}
-- Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

-- Tipos algebraicos sin parametros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

--Sinonimo
type ManoHabil = PiernaHabil


--Deportista es un tipo algebraico con constructores param ́etricos
data Deportista = Ajedrecista --Constructor sin argumentos
                | Ciclista Modalidad --Constructor con un argumento
                | Velocista Altura --Constructor con un argumento
                | Tenista TipoReves ManoHabil Altura --Constructor con tres argumentos
                | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

--4-b
{-
*Main> :t Ciclista
Ciclista :: Modalidad -> Deportista
-}

--4.c
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas (Velocista (_): xs) = 1 + contarVelocistas xs
contarVelocistas ((_): xs) = contarVelocistas xs 

{-
*Main> contarVelocistas [Velocista(3), Ajedrecista, Velocista(2)]
2
-}

--4.d
contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] z = 0
contarFutbolistas ((Futbolista (Arco)(_)(_)(_)):xs) Arco             = 1 + contarFutbolistas xs Arco
contarFutbolistas ((Futbolista (Defensa)(_)(_)(_)):xs) Defensa       = 1 + contarFutbolistas xs Defensa
contarFutbolistas ((Futbolista (Mediocampo)(_)(_)(_)):xs) Mediocampo = 1 + contarFutbolistas xs Mediocampo
contarFutbolistas ((Futbolista (Delantera)(_)(_)(_)):xs) Delantera   = 1 + contarFutbolistas xs Delantera
contarFutbolistas ((_):xs) z = contarFutbolistas xs z

--4.e
{-zonaFultbolista :: Zona -> Deportista -> Bool
zonaFultbolista z (Futbolista (zona)(_)(_)(_) ) 
                                                | (z == zona) = True
zonaFultbolista (_) (_) z = False  

contarFutbolistas' :: [Deportista] -> Zona -> Int
contarFutbolistas' xs z = length (filter (zonaFultbolista (z)) xs)
-}

--Ejercicio 5
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--5.a
{-
a) Implement ́a la funci ́on sonidoNatural como est ́a definida arriba.
b) Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural
y Sostenido.

c) Definir el tipo NotaMusical que consta de un  ́unico constructor que toma dos par ́ame-
tros. El primer par ́ametro es de tipo NotaBasica y el segundo de tipo Alteracion.

De esta manera cuando se quiera representar una nota alterada se puede usar como
segundo par ́ametro del constructor un Bemol o Sostenido y si se quiere representar
una nota sin alteraciones se usa Natural como segundo par ́ametro.
d) Defin ́ı la funci ́on sonidoCromatico :: NotaMusical -> Int que devuelve el sonido

de una nota, incrementando en uno su valor si tiene la alteraci ́on Sostenido, decre-
mentando en uno si tiene la alteraci ́on Bemol y dejando su valor intacto si la alteraci ́on

es Natural
e) Inclu ́ı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
mismo valor de sonidoCromatico se consideren iguales.
f ) Inclu ́ı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
que una nota es menor o igual a otra si y s ́olo si el valor de sonidoCromatico para la
primera es menor o igual al valor de sonidoCromatico para la segunda.
-}

{-
*Main> sonidoNatural Do
0
*Main> sonidoNatural Fa
5
-}

--5.b
data Alteracion = Bemol | Natural | Sostenido

--5.c
data NotaMusical = Nota NotaBasica Alteracion 

--5.d
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota  notb Bemol) = (sonidoNatural notb ) -1
sonidoCromatico (Nota notb Sostenido) = (sonidoNatural notb ) +1
sonidoCromatico (Nota notb Natural) = (sonidoNatural notb )

{-
*Main> sonidoCromatico (Nota Fa Sostenido)
6
*Main> sonidoCromatico (Nota La Bemol)
8
-}

--5.e
instance Eq NotaMusical
        where notb1==notb2=sonidoCromatico(notb1)==sonidoCromatico(notb2)

{-
*Main> Nota(Sol)(Sostenido) == Nota(La)(Bemol)
True
-}

--5.f
instance Ord NotaMusical
        where notb1 <= notb2 = sonidoCromatico(notb1) <= sonidoCromatico(notb2)

{-
*Main> Nota(Fa)(Bemol) <= Nota(Si)(Sostenido)
True
-}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
--Ejercicio 6
{-Definir la funci ́on primerElemento que devuelve el primer elemento de una lista no
vac ́ıa, o Nothing si la lista es vac ́ıa.-}
{-
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento xs = Just (head xs)
-}

--Ejercicio 7
{-En esta definici ́on, el tipo que estamos definiendo (Cola) aparece como un par ́ametro de
uno de sus constructores; por ello se dice que el tipo es recursivo. As ́ı una cola o bien est ́a
vac ́ıa, o bien contiene a una persona encolada, seguida del resto de la cola. Esto nos permite
representar colas cuya longitud no conocemos a priori y que pueden ser arbitrariamente
largas.
a) Program ́a las siguientes funciones:
1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que est ́a
en la primer posici ́on de una cola, por haber sido atendida. Si la cola est ́a vac ́ıa,
devuelve Nothing.
2) encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
de deportistas, en la  ́ultima posici ́on.
3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
par ́ametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
b) ¿A qu ́e otro tipo se parece Cola?.-}
data Cola = VaciaC | Encolada Deportista Cola deriving Show

--7.a
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada dep cola) = Just cola

ejAtender1 = Encolada (Futbolista Mediocampo 3 Derecha 8) VaciaC

{-
*Main> atender ejAtender1
Just VaciaC
-}


--7.b
encolar :: Deportista -> Cola -> Cola
encolar dep2 VaciaC = Encolada dep2 VaciaC
encolar dep2 (Encolada dep cola) = Encolada dep2 (Encolada dep cola)

--7.c


--Ejercicio 8
{-Ambos problemas se resuelven eficientemente, usando un diccionario o un padr ́on electoral.
Estos almacenan la informaci ́on asociandola a otra que se conoce; en el caso del padr ́on ser ́a
el n ́umero de documento, mientras que en el diccionario ser ́a la palabra en s ́ı.
Puesto que reconocemos la similitud entre un caso y el otro, deber ́ıamos esperar poder
representar con un  ́unico tipo de datos ambas situaciones; es decir, necesitamos un tipo
polim ́orfico que asocie a un dato bien conocido (la clave) la informaci ́on relevante (el dato).
a) ¿Como se debe instanciar el tipo ListaAsoc para representar la informaci ́on almacenada
en una gu ́ıa telef ́onica?
b) Program ́a las siguientes funciones:
1) la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una
lista.

2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que de-
vuelve la concatenaci ́on de dos listas de asociaciones.

3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
agrega un nodo a la lista de asociaciones si la clave no est ́a en la lista, o actualiza
el valor si la clave ya se encontraba.

4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asocia-
ciones en una lista de pares clave-dato.

5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
Nothing.
6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
una clave a elimina la entrada en la lista.
-}

data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving Show

--8.a
type GuiaTelefonica = ListaAsoc String Int 
--(string = Nombre de la persona, Int = numero telefonico)

--8.b
---1)
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b (lista))= 1 + la_long lista


---2)
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat lista Vacia = lista
la_concat (Nodo a b (lista')) lista = (Nodo a b ( la_concat lista' lista))

---3) 
{-la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a' b' = Nodo a' b' (Vacia)
la_agregar Nodo a b (lista) a' b'
                                        | a == a' = Nodo a b' (lista)
                                        | otherwise = Nodo a' b' (la_agregar lista)-}

--4)
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b (lista)) = (a, b) : la_pares lista

--5)
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia hola = Nothing
la_busca (Nodo a b (lista)) hola
                                | a ==hola = Just b
                                | otherwise = la_busca lista hola

--6)
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar pepe Vacia = Vacia
la_borrar pepe (Nodo a b (lista))
                                | a == pepe = la_borrar pepe lista
                                | otherwise = Nodo a b (la_borrar pepe lista)

{-
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
--PARCIAL2020
estaEnDni :: Int -> Bool
estaEnDni n = n `elem`  digitosDni
            where digitosDni = [4, 5, 6, 9, 5, 3, 6, 6, 45, 695, 366]

--2)
sumaDNI :: [Int] -> Int
sumaDNI [] = 0
sumaDNI (x:xs)
                | estaEnDni x = x + sumaDNI xs
                | otherwise = sumaDNI xs

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
transplantar (DatoPlanta (_) (_) (_) (_) (_) rp) ms' = transplantar rp ms

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
                                         
-}
