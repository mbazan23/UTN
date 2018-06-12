% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer

esBuenFlan(Flan):-tieneHuevosDeOro(Flan).
esBuenFlan(Flan):-tieneBuenosIngredientes(Flan),tieneBuenaCoccion(Flan).
tieneBuenosIngredientes(Flan):-tiene(huevo,Flan), tiene(harina,Flan).

tieneHuevosDeOro(flanDeLeo).
tieneBuenaCoccion(flanDeEze).
tiene(huevo,flanDeEze).
tiene(harina,flanDeEze).



