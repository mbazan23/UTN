import Text.Show.Functions --AVERIGUAR QUE ES CADA UNO
import Data.List


type Item = Personaje -> Personaje  --Con esto decimos que Item es UNA FUNCION que toma un PERSONAJE y devuelve un PERSONAJE

	
data Personaje = Personaje {
	nombre :: String ,
	salud :: Double,
	poder :: Double,
	habilidades :: [String],
	items :: [Item]
}deriving(Show) 			--AVERIGUAR QUE HACE

gemaAlma personaje = personaje {
	salud = (salud personaje) * (length ( habilidades personaje ) )
}  

gemaMente personaje= personaje {
	nombre= (nombre personaje) ++" El Sabio"
}
gemaTiempo personaje= personaje {
	nombre= (nombre personaje)++" El Joven"
}


gemaRealidad personaje = personaje 

gemaEspacio personaje= personaje {
	habilidades=  "Teletransportacion": (habilidades personaje)
	
}

gemaPoder personaje= personaje {
	poder= (poder personaje)* (4/0)
	
}

thanos= Personaje {
	nombre= "Thanos",
	salud= 10000,
	poder= 1000,
	habilidades = [ "Basta Advengers", "Ser violeta", "Superfuerza"],
	items = [ powerGem, mindGem, realityGem, timeGem]     --!DEFINIR ITEMS DE OTRA MANERA ya que son FUNCIONES

}

nickFury= Personaje {
	nombre= "Nick Fury",
	salud= 100,
	poder= 100,
	habilidades = [ "Siempre Preparado"],
	items = [parche]

}
parche = agregarAlNombre "MotherFucker"

--DEFINIR : agregarAlNombre , powerGem, mindGem, realityGem, timeGem, armasInfinitas

hulk= Personaje {
	nombre= "Hulk",
	salud= 5000,
	poder= 1000000,
	habilidades = [ ],
	items = [ ]
}

ironMan= Personaje {
	nombre= "Iron Man",
	salud= 10,
	poder= 10,
	habilidades = [ "SPOILERS"],
	items = [ armasInfinitas]

}

estaVivo personaje = (salud personaje)  > 0

golpear atacante atacado  True =  atacado{
	salud = (salud atacado) - ( poder atacante),
	poder = (poder atacado) * 2
}  
golpear atacante atacado False = atacado {
	nombre= (nombre atacado) ++ " Destrozado"
}

tenemosUnHulk  atacante atacado  = golpear atacante atacado (estaVivo atacado)


prepararseParaLaConquista 


 
		

