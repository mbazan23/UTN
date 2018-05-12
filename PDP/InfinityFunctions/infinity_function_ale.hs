import Text.Show.Functions
import Data.List

type Item = Personaje -> Personaje

--1)

data Personaje = Personaje{
   nombre :: String,
   hp :: Float,
   poder :: Float,
   habilidades :: [String],
   items :: [Item]
}deriving(Show)

thanos = Personaje{
   nombre = "Thanos",
   hp = 10000,
   poder = 1000,
   habilidades = ["Basta, Avengers", "Ser violeta", "Superfuerza"],
   items = guanteleteDelInfinito
}

guanteleteDelInfinito = [powerStone, mindStone, realityStone, timeStone]

--Es acaso esto un easter egg?

nickFury = Personaje{
   nombre = "Nick Fury",
   hp = 100,
   poder = 100,
   habilidades = ["Estar siempre preparado para todo"],
   items = [parche]
}

parche = agregarAlNombre "Motherfucker "

hulk = Personaje{
   nombre = "Hulk",
   hp = 5000,
   poder = 1000000,
   habilidades = [],
   items = []
}

ironMan = Personaje{
   nombre = "Tony Stark",
   hp = 10,
   poder = 10,
   habilidades = ["SPOILERS"],
   items = armadurasInfinitas
}

armadurasInfinitas = map armadura [1..]

armadura numeroDeSerie personaje = personaje{
   poder = (poder personaje)*numeroDeSerie
}

--2)

realityStone :: Item
realityStone = id

timeStone :: Item
timeStone personaje = agregarAlNombre "Joven " personaje

--Tambien lo podriamos hacer point-free, si se quisiera

mindStone :: Item
mindStone = agregarAlNombre "El sabio "

spaceStone :: Item
spaceStone personaje = agregarHabilidad "Teletransportacion" personaje

soulStone :: Item
soulStone personaje = personaje{
   hp = hp personaje * aumento personaje
}

powerStone :: Item
powerStone personaje = personaje{
   poder = poder personaje * infinito
}

agregarAlNombre agregado personaje = personaje{
   nombre = agregado ++ nombre personaje
}

agregarHabilidad habilidad personaje = personaje{
   habilidades = habilidad : habilidades personaje
}

aumento = product . map genericLength . habilidades

--Nota importante: ven ese fromIntegral? Olvídenselo. Lo estamos usando acá por una cuestión del lenguaje y no del paradigma,
--pero en este caso puntual, necesitamos ponerlo para que Haskell pueda compilar.

infinito = 1 / 0

--Que pasa si dfeino infinito como, por ejemplo, last [1..]? Cuentenme que pasa con thanos al intentar conquistar el universo con ese infinito ;)

--3)

tenemosUnHulk :: Personaje -> Personaje -> Personaje
tenemosUnHulk atacante atacado
   |estaVivo atacado = tenemosUnHulk atacante (golpearA atacante atacado)
   |otherwise = agregarAlNombre "Destrozado " atacado

estaVivo = (> 0) . hp

golpearA atacante atacado = (perderHP (poder atacante).dividirPoderPor2) atacado

perderHP unaCantidad personaje = personaje{
   hp = max 0 (hp personaje) - unaCantidad
}

dividirPoderPor2 personaje = personaje{
   poder = (poder personaje) / 2
}

--4)

prepararseParaLaConquista :: Personaje -> Personaje
prepararseParaLaConquista personaje = foldr usarItem personaje (items personaje)

conquistarElUniverso :: Personaje->String
conquistarElUniverso personaje
   | podriaConquistar personaje = "This does pute a smile on my face..."
   | otherwise = "I hope they'll remember you..."

usarItem item personaje = item personaje

--Se parece a una función ya vista, no? Es la función $! Bien se podría usar, pero me gusta más crear mi propia función $,
--porque así es un poco más expresivo. También se podría definir como usarItem = $, pero de esta manera la restrinjo a mi dominio.

podriaConquistar (Personaje "Nick Fury" _ _ _    _) = True
podriaConquistar personaje = tieneLaHabilidad "SPOILERS" personaje || ((suPoderEsMayorA 1000000).prepararseParaLaConquista) personaje

suPoderEsMayorA cantidad personaje = (poder personaje) > cantidad

tieneLaHabilidad habilidad personaje = (elem habilidad . habilidades) personaje

{-

Se estarán preguntando, por que le paso el Nick Fury "abierto", y por qué no uso nickFury para pattern matchear?
Para comparar datas, tiene que agregarse que sean Eq (en el deriving se pone tanto Show como Eq). Sin embargo, como sabemos
en Haskell las funciones no son Eq, por lo tanto, mi data al tener dentro una lista de funciones (los Items), no puede ser comparado,
porque ellas no son comparables.
Por otro lado, qué pasa si yo doy vuelta las condiciones del segundo caso de podriaConquistar? Podrian probarlo y me cuentan, relacionado
a lo que vimos en clase...

-}
