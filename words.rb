
#Inicializo las variables
archivo  = File.open('texto.txt', 'r+')
salida   = File.open('salida.txt','w')
palabras = []
frecuencia = {}
#Por cada linea que se lee guarda frecuencia de Palabras y reemplaza ERs
archivo.readlines.each do |linea|
	#Creo array de palabras
	palabras = linea.downcase.scan(/[a-zA-Z]{2,16}/)
	#Por cada palabra
	palabras.each do |palabra|
		#Guardo en un diccionario la cantidad de veces que se repite la palabra
		frecuencia[palabra].nil? ? frecuencia[palabra]= 1 : frecuencia[palabra]+= 1
		#Si la palabra es una expresion regular, calculo cantidad de Xs y remplazo la palabra
		if (/(abc)(x)+/ =~ palabra)
			cantidadDeEquis= palabra.length - 3
			linea=linea.gsub(palabra,"#{cantidadDeEquis}X")
		end		
	end	
	#Escribo cada linea procesada
	salida.write(linea)
end	


#Ordenar por cantidad de repeticiones (Por defecto sort_by ordena de menor a mayor, por eso se le antopone el menos)
frecuencia = frecuencia.sort_by{|k,v| -v}
#Mostrar 3 mas frecuentes
count=0
frecuencia.each do |k,v|
	puts "#{k} : #{v}"

	count+=1
	count == 3? break : nil #no le uso break if count ==3 porque no me acuerdo si era asi la sintaxis
end	

