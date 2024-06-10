type Ciudad = String
type Distancia = Int

data Viaje = Unico Tramo | ConEscala Tramo Viaje

data Tramo = DefinicionDelViaje Ciudad Ciudad Distancia

tramoPasaPor ::  Tramo -> Ciudad -> Bool
tramoPasaPor (DefinicionDelViaje c1 c2 d) c = (c1==c || c2==c)

viajePasaPor :: Viaje -> Ciudad -> Bool
viajePasaPor (Unico t) c = tramoPasaPor t c
viajePasaPor (ConEscala t v) c = (tramoPasaPor t c || viajePasaPor v c)
