import Text.Show.Functions
data Microcontrolador = Microcontrolador{
    memoriaDeDatos:: [Int],
    acumuladores::(Int, Int),
    programCounter::Int,
    etiquetaError::[Char],
    programa::[Instruccion]
}deriving (Show)
type Instruccion=Microcontrolador -> Microcontrolador


xt8088 = Microcontrolador [] (0,0) 0 "" []
fp20 = Microcontrolador [] (7,24) 0 "" []
at8086 = Microcontrolador [1..20] (0,0) 0 "" []
aumentarPc microcontrolador=microcontrolador{
    programCounter=(programCounter microcontrolador)+1
}
nop = id

suma (a,b)=(a+b,0)
add microcontrolador = microcontrolador{
    acumuladores=suma(acumuladores microcontrolador)
}
    
realizarDivision (a,b)=(a `div` b,0)
divide (Microcontrolador memoriaDeDatos (a,0) programCounter etiquetaError programa) = Microcontrolador memoriaDeDatos (a,0) programCounter "Division by zero" programa
divide microcontrolador = microcontrolador {
   acumuladores=realizarDivision(acumuladores microcontrolador)
}

swap microcontrolador = microcontrolador{
    acumuladores= (snd (acumuladores microcontrolador) ,fst (acumuladores microcontrolador)) 
}

esMayorALongitud posicion lista = (posicion > (length lista))
cargarValorEnMicrocontrolador lista posicion (_,b)=(lista!!(posicion-1),b)
lod addr (Microcontrolador [] (a,b) programCounter etiquetaError programa) = Microcontrolador [] (0,b) programCounter etiquetaError programa
lod addr (Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError programa) 
    |(esMayorALongitud addr memoriaDeDatos)=Microcontrolador memoriaDeDatos acumuladores programCounter "Tamanio mayor longitud de cadena" programa
    |otherwise=Microcontrolador memoriaDeDatos (cargarValorEnMicrocontrolador memoriaDeDatos addr acumuladores) programCounter etiquetaError programa


str addr val (Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError programa) 
    |esMayorALongitud (addr-1) memoriaDeDatos=Microcontrolador memoriaDeDatos acumuladores programCounter "Tamanio mayor longitud de cadena" programa
    |otherwise=Microcontrolador (insertarElementoEnPosicion val memoriaDeDatos addr) acumuladores programCounter etiquetaError programa

insertarElementoEnPosicion x [] 1 = x:[]
insertarElementoEnPosicion x ys 1 = x:(tail ys)
insertarElementoEnPosicion x (y:ys) n = y:insertarElementoEnPosicion x ys (n-1)

lodv val microcontrolador = microcontrolador{
    acumuladores=(val, (snd.acumuladores) microcontrolador)
}



cargarPrograma funcion microcontrolador= microcontrolador{
    programa=(programa microcontrolador)++[funcion]
}

ejecutarPrograma (Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError [])=(Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError [])
ejecutarPrograma (Microcontrolador memoriaDeDatos acumuladores programCounter "" (x:xs))= (ejecutarPrograma.x.aumentarPc) (Microcontrolador memoriaDeDatos acumuladores programCounter "" xs)
ejecutarPrograma microcontrolador=microcontrolador

ejemploDeCarga=((cargarPrograma (lodv 3)).(cargarPrograma nop)) xt8088
ejemploDeEjecucion=(ejecutarPrograma.(cargarPrograma nop).(cargarPrograma nop)) xt8088
ejemploDeDepuracionYEjecucion=(ejecutarPrograma.depurar) ejemploDeCarga

ifnz funcion (Microcontrolador memoriaDeDatos (0,b) programCounter etiquetaError programa)= Microcontrolador memoriaDeDatos (0,b) programCounter etiquetaError []
ifnz funcion microcontrolador=(aumentarPc.ejecutarPrograma.funcion) microcontrolador

ifnz2  (Microcontrolador memoriaDeDatos (0,b) programCounter etiquetaError programa)= Microcontrolador memoriaDeDatos (0,b) programCounter etiquetaError []
ifnz2  microcontrolador=(aumentarPc.ejecutarPrograma) microcontrolador

depurar microcontrolador=microcontrolador{
    programa=filter (haceAlgo microcontrolador) (programa microcontrolador)}
haceAlgo microcontrolador instruccion= (not.quedoTodoEnCero.instruccion) microcontrolador
quedoTodoEnCero (Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError programa)=acumuladores==(0,0) && all (==0) memoriaDeDatos

estaOrdenada (Microcontrolador memoriaDeDatos acumuladores programCounter etiquetaError programa)=chequearOrden memoriaDeDatos
chequearOrden []=True
chequearOrden [x]=True
chequearOrden (x:xs)=(x<= head xs) && chequearOrden xs

punto2 xt8088 = (nop.nop.nop) xt8088

punto3 xt8088 = (add.(lodv 22).swap.(lodv 10)) xt8088

punto4 xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 0).(str 1 2)) xt8088
punto4d xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 4).(str 1 12)) xt8088

-----------------------------------------------------------------------------

casoP2 xt8088 = (nop.nop.nop) xt8088

icasoP3 xt8088 = (  ejecutarPrograma.cargarPrograma add.(cargarPrograma (lodv 22)).cargarPrograma swap.(cargarPrograma (lodv 10))  ) xt8088

casoP4 xt8088 = ( ejecutarPrograma.(cargarPrograma divide).(cargarPrograma (lod 1)).cargarPrograma swap.(cargarPrograma (lod 2)).(cargarPrograma (str 2 0)).(cargarPrograma (str 1 2))  ) xt8088

casoP4d xt8088 = (divide.(lod 1).swap.(lod 2).(str 2 4).(str 1 12)) xt8088



---  casoP3 xt8088                          FUNCIONA
---  casoP4 xt8088                          FUNCIONA 

--- ifnz ((swap.(lodv 3)) fp20)             FUNCIONA
--- (ifnz ((swap. (lodv 3))) xt8088         FALLA

--- (ifnz (swap.(lodv 3))) fp20             FUNCIONA        
--- (ifnz ((swap.(lodv 3)))) xt8088         FUNCIONA

---  ifnz (swap.(lodv 3)) fp20              FUNCIONA
---  ifnz (swap.(lodv 3)) xt8088            FUNCIONA    (se modifico funcion)

