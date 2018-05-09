data Personaje = Personaje {
	nombre :: String ,
	puntosSalud :: Double,
	puntosPoder :: Double,
	habilidades :: [String],
	items :: [String]
}deriving Show

gemaAlma personaje = personaje {
	puntosSalud = (puntosSalud personaje) * (length ( habilidades personaje ) )
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
	puntosPoder= (puntosPoder personaje)* (4/0)
	
}

thanos= Personaje {
	nombre= "Thanos",
	puntosSalud= 10000,
	puntosPoder= 1000,
	habilidades = [ "Basta Advengers", "Ser violeta", "Superfuerza"],
	items = [ "GemaPoder", "GemaMente", "GemaRealidad", "GemaTiempo"]

}

nickFury= Personaje {
	nombre= "Nick Fury",
	puntosSalud= 100,
	puntosPoder= 100,
	habilidades = [ "Siempre Preparado"],
	items = [ "Parche"]

}

hulk= Personaje {
	nombre= "Hulk",
	puntosSalud= 5000,
	puntosPoder= 1000000,
	habilidades = [ ],
	items = [ ]
}

ironMan= Personaje {
	nombre= "Iron Man",
	puntosSalud= 10,
	puntosPoder= 10,
	habilidades = [ "SPOILERS"],
	items = [ "INFINITOS"]

}

estaVivo personaje = (puntosSalud personaje)  > 0

golpear atacante atacado  True =  atacado{
	puntosSalud = (puntosSalud atacado) - ( puntosPoder atacante),
	puntosPoder = (puntosPoder atacado) * 2
}  
golpear atacante atacado False = atacado {
	nombre= (nombre atacado) ++ " Destrozado"
}

tenemosUnHulk  atacante atacado  = golpear atacante atacado (estaVivo atacado)


prepararseParaLaConquista 


 
		

