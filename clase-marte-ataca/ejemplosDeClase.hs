---- Tuplas
-- mayorDeEdad (nombre, edad, documento) = edad > 17

-- mayorDeEdad' unaPersona = edad unaPersona > 17
-- edad (nombre, e, documento) = e

-- sumarAños (nombre, edad, documento) años = (nombre (edad +años) documento)
-- esRoberto (nombre, edad, documento) = nombre == "Roberto"

-- sumaDocumentoAños (nombre, edad, documento) = edad + documento
data Persona = UnaPersona String Int Int [String] deriving Show

personaDeEjemplo = UnaPersona "Juliana" 30 34000000 ["musica"]
personaDeEjemplo2 = UnaPersona "Roberto" 45 25000000 []
personaDeEjemplo3 = UnaPersona "Robertito" 15 40000000 ["jugar", "cantar"]

mayorDeEdad (UnaPersona nombre edad documento _) = edad > 17
mayorDeEdad' unaPersona = edad unaPersona > 17 -- este no cambia
edad (UnaPersona nombre e documento _) = e
sumarAños (UnaPersona nombre edad documento _) años = UnaPersona nombre (edad +años) documento
esRoberto (UnaPersona nombre edad documento _) = nombre == "Roberto"
sumaDocumentoAños (UnaPersona nombre edad documento _) = edad + documento

esAburrida (UnaPersona nombre edad documento gustos) = null gustos
esAburrida' (UnaPersona nombre edad documento []) = True
-- esAburrida' (UnaPersona nombre edad documento gustos) = False
esAburrida' _ = False

masGustosQueAños (UnaPersona nombre edad documento gustos) = length gustos > edad
leGustaMas (UnaPersona nombre edad documento gustos) = head gustos
-- leGustaMas (UnaPersona nombre edad documento (x:xs)) = x
leGustaMas' (UnaPersona nombre edad documento (x:_)) = x

pocoMelomana (UnaPersona nombre edad documento gustos) = elem "musica" gustos

melomana (UnaPersona nombre edad documento (x:_)) = x == "musica"
melomana persona = leGustaMas persona == "musica"


hacerlaAburrida (UnaPersona nombre edad documento gustos) = UnaPersona nombre edad documento (take 2 gustos)
-- O con pattern matching
hacerlaAburrida' (UnaPersona nombre edad documento (x:y:xs)) = UnaPersona nombre edad documento [x,y]
-- Pero ojo, si hay menos de dos elementos...
hacerlaAburrida' (UnaPersona nombre edad documento gustos) = UnaPersona nombre edad documento gustos


coeficienteDeFelicidad unaPersona | mayorDeEdad unaPersona = coeficienteMayorDeEdad unaPersona
                                  | not (mayorDeEdad unaPersona) = 100

coeficienteMayorDeEdad (UnaPersona nombre edad documento gustos) = (length gustos) * (200 - edad)

coeficienteDeFelicidad' unaPersona | mayorDeEdad unaPersona = coeficienteMayorDeEdad unaPersona
                                  | otherwise  = 100




puntos letra | letra == 'Z' = 10
             | elem letra ['J', 'Ñ', 'R', 'X'] = 8
             | letra == 'Q'                    = 5
             | elem letra ['F', 'H', 'V', 'Y'] = 4
             | elem letra ['B', 'C', 'M', 'P'] = 3
             | elem letra ['D', 'G'] = 2
             | otherwise = 1

signo numero | numero >= 0 = 1
             | otherwise = -1

modulo numero | numero >= 0 = numero
             | otherwise = (-1)*numero

mayor numero1 numero2 | numero1 > numero2 = numero1
                      | otherwise = numero2

nombre (UnaPersona nombre _ _ _) = nombre
saludarRobertos unaPersona | nombre unaPersona == "Roberto" = "Hola, Roberto!"
                           | otherwise = ""
