main = print $ "Hello, world!"
data Micro = Micro{
    memoriaDeDatos:: [Int],
    acumuladores::(Int, Int),
    programCounter::Int,
    etiquetaError::[Char]
}deriving (Show)

xt8088 = Micro [] (0,0) 0 ""
fp20 = Micro [] (7,24) 0 ""
at8086 = Micro [1..20] (0,0) 0 ""

nop micro = incPC micro

incPC micro = micro {
	programCounter = programCounter micro + 1
}

add micro = incPC (micro {
	
    acumuladores=((fst.acumuladores) micro + (snd.acumuladores) micro,0)
})
 
divide (Micro memoriaDeDatos (a,0) programCounter etiquetaError) = Micro memoriaDeDatos (a,0) (programCounter+1) "Division by zero"
divide micro = incPC ( micro {
   acumuladores=((fst.acumuladores) micro `div` (snd.acumuladores) micro, 0)
} )

swap micro = incPC (micro {
   acumuladores = ( snd(acumuladores micro) , fst (acumuladores micro) ) 
})  

esMayorALongitud posicion lista = (posicion > (length lista))

lod addr (Micro memoriaDeDatos acumuladores programCounter etiquetaError) 
    |(esMayorALongitud addr memoriaDeDatos)=Micro memoriaDeDatos acumuladores (programCounter+1) "Tamanio mayor longitud de cadena"
    |otherwise=Micro memoriaDeDatos (memoriaDeDatos!!(addr-1), (snd acumuladores)) (programCounter+1) etiquetaError

str addr val (Micro memoriaDeDatos acumuladores programCounter etiquetaError) 
    |esMayorALongitud (addr-1) memoriaDeDatos=Micro memoriaDeDatos acumuladores (programCounter+1) "Tamanio mayor longitud de cadena"
    |otherwise=Micro (insertarElementoEnPosicion val memoriaDeDatos addr) acumuladores (programCounter+1) etiquetaError

insertarElementoEnPosicion x []     1 = x:[]
insertarElementoEnPosicion x ys     1 = x:(tail ys)
insertarElementoEnPosicion x (y:ys) n = y:insertarElementoEnPosicion x ys (n-1)

lodv val micro = incPC (micro{
	acumuladores=(val, (snd.acumuladores) micro)
})

punto2 xt8088 = (nop.nop.nop) xt8088
punto3 xt8088 = (add.(lodv 22).swap.(lodv 10)) xt8088
punto4 xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 0).(str 1 2)) xt8088
punto4d xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 4).(str 1 12)) xt8088


