--ghc 7.10

main = print $ "Hello, world!"

data Microcontrolador = Microcontrolador{
    memoriaDeDatos:: [Int],
    acumuladores::(Int, Int),
    programCounter::Int,
    etiquetaError::[Char]
}deriving Show


xt8088 = Microcontrolador [] (6,2) 0 ""

div microcontrolador = microcontrolador {
	
	programCounter = (programCounter microcontrolador) + 1, 
	acumuladores = ( (fst.acumuladores) microcontrolador / (snd.acumuladores) microcontrolador , 0 )

}

nop microcontrolador= microcontrolador {
programCounter = (programCounter microcontrolador) + 1
}

add microcontrolador= microcontrolador {
    programCounter = (programCounter microcontrolador) +1,
    acumuladores=((fst.acumuladores) microcontrolador + (snd.acumuladores) microcontrolador, (snd.acumuladores) microcontrolador )
}

swap microcontrolador = microcontrolador {
	programCounter= (programCounter microcontrolador) +1,
	acumuladores= ( (snd.acumuladores) microcontrolador ,  (fst.acumuladores) microcontrolador ) 
}


lod addr microcontrolador = microcontrolador{
	programCounter = (programCounter microcontrolador) +1,
	acumuladores = ( (memoriaDeDatos microcontrolador)!!addr , snd(acumuladores microcontrolador) )

}

str addr val microcontrolador = microcontrolador{
	programCounter = (programCounter microcontrolador) + 1,
	memoriaDeDatos = insertElementoEnPosicion val (memoriaDeDatos microcontrolador) addr
	
}

str addr val (Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError)=
    Microcontrolador (insertElementoEnPosicion val memoriaDeDatos addr) acumuladores programCounter etiquetaError
insertElementoEnPosicion valor ys     1 = valor:(tail ys)
insertElementoEnPosicion valor (y:ys) posicion = y:insertElementoEnPosicion valor ys (posicion-1)

lodv val microcontrolador = microcontrolador{
	acumuladores = (val, (snd.acumuladores) microcontrolador)
}