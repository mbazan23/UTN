% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.
esHijoDe(Hijo,Progenitor):-esProgenitor(Progenitor,Hijo).
esHermanoDe(Hermano1,Hermano2):-esProgenitor(Progenitor,Hermano1), esProgenitor(Progenitor,Hermano2).
esAbueloDe(Abuelo,Nieto):-esProgenitor(Progenitor,Nieto), esProgenitor(Abuelo,Progenitor).
esNietoDe(Nieto,Abuelo):-esAbueloDe(Abuelo,Nieto).
esTioDe(Tio,Sobrino):-esProgenitor(Progenitor,Sobrino), esHermanoDe(Progenitor,Tio).
esSobrinoDe(Sobrino,Tio):-esTioDe(Tio,Sobrino).
esProgenitor(Progenitor,Hijo):-padreDe(Progenitor,Hijo).
esProgenitor(Progenitor,Hijo):-madreDe(Progenitor,Hijo).
esPrimoDe(Primo1,Primo2):-esSobrinoDe(Primo1, TiaDePrimo1), esHijoDe(Primo2, TiaDePrimo1).


padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).
madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge,maggie).
madreDe(selma, ling).
