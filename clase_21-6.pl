meses([enero,febrero,marzo],feos).

estacion(invierno,172,252).
estacion(otonio,81,171).
estacion(primavera,253,342).
estacion(verano,1,80).
estacion(verano,343,365).

acontecimiento(diaDelPadre,familiar,171).
acontecimiento(diaDelaMadre,familiar,266).
acontecimiento(navidad,religioso,359).
acontecimiento(pascua,religioso,112).
acontecimiento(reyes,religioso,6).
acontecimiento(anioNuevo,internacional,1).
acontecimiento(finDeAnio,internacional,365).
acontecimiento(diaBandera,civico,172).
%%acontecimiento(diaGuemes,civico,169).
acontecimiento(diaSanMartin,civico,222).


%% estaEn(DiaDelAnio,EstacionALaQuePertence)
estacionPara(Dia,Estacion):-
    estacion(Estacion,Empieza,Termina),
    between(Empieza,Termina,Dia).


acontecimientoEstacion(Acontecimiento,Categoria,Estacion):-
acontecimiento(Acontecimiento,Categoria,Dia),
    estacionPara(Dia,Estacion).


estacionSinAcontecimientos(Estacion):-
    estacion(Estacion,_,_),
    not(acontecimientoEstacion(_,_,Estacion)).

estacionConSoloAcontecimientosCivicos(Estacion):-
    acontecimientoCivicoEn(Estacion),
    not(acontecimientoQueNoEsCivico(Estacion)).  

acontecimientoCivicoEn(Estacion):-
    acontecimientoEstacion(_,civico,Estacion).

acontecimientoQueNoEsCivico(Estacion):-
    acontecimientoEstacion(_,Categoria,Estacion),
    Categoria \= civico.

estacionConTodosAcontecimientosCivicos(Estacion):-
    acontecimientoCivicoEn(Estacion),
    forall(acontecimientoEstacion(_,Categoria,Estacion), Categoria = civico ).  

categoriaEnEstacion(Categoria,Estacion):-
    acontecimientoEstacion(_,Categoria,Estacion),
    forall(acontecimientoEstacion(_,Categoria,AlgunaEstacion), 
           AlgunaEstacion = Estacion).


tiene(diaDelPadre,regalos).
tiene(diaDelaMadre,regalos).
tiene(navidad,regalos).
tiene(navidad,arbolito).
tiene(navidad,brindis).
tiene(anioNuevo,brindis).
tiene(finDeAnio,brindis).


todosLosAcontecimientosInternacionesTienenBrindis:-forall(acontecimiento(A,internacional,_),tiene(A,brindis)).

todosLosAcontecimientosInternacionesTienen(Algo):-
    tiene(_,Algo),
    forall(acontecimiento(A,internacional,_),tiene(A,Algo)).

todosLosAcontecimientosTienen(Categoria,UnaCosa):-
    tiene(_,UnaCosa),
    acontecimiento(_,Categoria,_),
    forall(acontecimiento(A,Categoria,_),tiene(A,UnaCosa)).s
