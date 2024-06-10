data Auto = SoloA | ConTrailer Ejes Altura
type Ejes = Int
type Altura = Float
type Peso = Int

data Rodado= Automovil Auto |Moto| Bus Ejes Altura| Camion Ejes Altura Peso
--funciones auxialiaressss

mismaCantEjes :: Rodado -> Ejes -> Bool
mismaCantEjes (Automovil (ConTrailer  e' al)) e = (e==e')
mismaCantEjes (Automovil (SoloA)) = (2==e)
mismaCantEjes (Bus e a) e' = (e==e')
mismaCantEjes (Moto e a) e' = (e==e')
mismaCantEjes (Camion e a) e' = (e==e')

cantidadEjes :: Rodado -> Ejes
cantidadEjes (Automovil (ConTrailer  e al))= e
cantidadEjes (Bus e a) = e
cantidadEjes (Camion e a p) = e
cantidadEjes Moto = 0

instance Eq Rodado where
    r1 == r2 = (mismaCantEjes r1 (cantidadEjes r2)) 


autosConTrailer :: [Rodado] -> Altura -> [Rodado]
autosConTrailer [] _ = []
autosConTrailer (Automovil (ConTrailer  e al):ls) alt
                                                        | (al>alt) = (Automovil (ConTrailer  e al)) : autosConTrailer ls alt
                                                        | otherwise = autosConTrailer ls alt
autosConTrailer ((_): ls) alt = autosConTrailer ls alt

dosIguales :: [Rodado] -> Bool
dosIguales [] = False
dosIguales [r] = False
dosIguales (r1:r2:rs) = (r1 == r2) || dosIguales (r2:rs)


-----ejercicio2


