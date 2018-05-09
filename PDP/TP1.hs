main = print $ "Hello, world!"
data micro = micro{
    memoriaDeDatos:: [Int],
    acumuladores::(Int, Int),
    programCounter::Int,
    etiquetaError::[Char]
}deriving (Show)

xt8088 = micro [] (0,0) 0 ""
fp20 = micro [] (7,24) 0 ""
at8086 = micro [1..20] (0,0) 0 ""

nop micro = micro {
	programCounter= (programCounter micro)+1
}

add micro = micro {
	programCounter= (programCounter micro)+1,
    acumuladores=((fst.acumuladores) micro + (snd.acumuladores) micro,0)
}
 
divide (micro memoriaDeDatos (a,0) programCounter etiquetaError) = micro memoriaDeDatos (a,0) (programCounter+1) "Division by zero"
divide micro = micro {
   acumuladores=((fst.acumuladores) micro `div` (snd.acumuladores) micro, 0),
   programCounter = (programCounter micro ) + 1
}

swap micro = micro (memoriaDeDatos micro) (snd (acumuladores micro),fst(acumuladores micro)) (programCounter micro+1) (etiquetaError micro)

esMayorALongitud posicion lista = (posicion > (length lista))

lod addr (micro [] (a,b) programCounter etiquetaError) = micro [] (0,b) (programCounter+1) etiquetaError
lod addr (micro memoriaDeDatos acumuladores programCounter etiquetaError) 
    |(esMayorALongitud addr memoriaDeDatos)=micro memoriaDeDatos acumuladores (programCounter+1) "Tamanio mayor longitud de cadena"
    |otherwise=micro memoriaDeDatos (memoriaDeDatos!!(addr-1), (snd acumuladores)) (programCounter+1) etiquetaError

str addr val (micro memoriaDeDatos acumuladores programCounter etiquetaError) 
    |esMayorALongitud (addr-1) memoriaDeDatos=micro memoriaDeDatos acumuladores (programCounter+1) "Tamanio mayor longitud de cadena"
    |otherwise=micro (insertarElementoEnPosicion val memoriaDeDatos addr) acumuladores (programCounter+1) etiquetaError

insertarElementoEnPosicion x []     1 = x:[]
insertarElementoEnPosicion x ys     1 = x:(tail ys)
insertarElementoEnPosicion x (y:ys) n = y:insertarElementoEnPosicion x ys (n-1)

lodv val micro = micro{
	acumuladores=(val, (snd.acumuladores) micro), 
	programCounter = (programCounter micro) + 1
}

punto2 xt8088 = (nop.nop.nop) xt8088

punto3 xt8088 = (add.(lodv 22).swap.(lodv 10)) xt8088

punto4 xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 0).(str 1 2)) xt8088
punto4d xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 4).(str 1 12)) xt8088


