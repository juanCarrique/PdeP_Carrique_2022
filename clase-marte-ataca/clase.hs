data Persona = UnaPersona String Int Int [String] deriving Show
roberto = UnaPersona "Roberto" 19 12345 []
otraPer = UnaPersona "Roberto 2" 29 12345 ["musica", "arquitectura"]
otraPer2 = UnaPersona "Robertito" 15 12345 ["dfadf"]

esMayorDeEdad (UnaPersona _ edad _ _) = edad >= 18
envejecer (UnaPersona apodo edad doc gustos) años = UnaPersona apodo (edad + años) doc gustos
seLlamaRoberto (UnaPersona apodo _ _ _) = apodo == "Roberto"
sumaDocAños (UnaPersona apodo edad doc gustos) = edad + doc

funcion x _y = x + 5

seLlamaRoberto' persona = apodo persona == "Roberto"

apodo (UnaPersona apodo _ _ _) = apodo
edad (UnaPersona _ edad _ _) = edad
doc (UnaPersona _ _ doc _) = doc
gustos (UnaPersona _ _ _ gustos) = gustos

sumaDocAños' persona = edad persona + doc persona

-- esAburrida (UnaPersona _ _ _ gustos) = length gustos == 0
esAburrida' (UnaPersona _ _ _ gustos) = null gustos
esAburrida'' unaPersona = null (gustos unaPersona)
esAburrida''' (UnaPersona _ _ _ []) = True
esAburrida''' _ = False

melomano (UnaPersona _ _ _ []) = False
melomano (UnaPersona _ _ _ gustos) = head gustos == "musica"


melomano' (UnaPersona _ _ _ []) = False
melomano' (UnaPersona _ _ _ (x:xs)) = x == "musica"


-- melomano'' (UnaPersona _ _ _ []) = False
melomano'' (UnaPersona _ _ _ (elemento:_)) = elemento == "musica"


sumaPrimerosDos lista = head lista + lista!!1
sumaPrimerosDos' (x:xs) = x + head xs
sumaPrimerosDos'' (x:y:xs) = x + y
sumaPrimerosDos''' [] = 0
sumaPrimerosDos''' [x] = x
sumaPrimerosDos''' (x:y:_) = x + y

otraF (x,y,z) = x + y + z

esVocal 'a' = True
esVocal 'e' = True
esVocal 'i' = True
esVocal 'o' = True
esVocal 'u' = True
esVocal _ = False


coeficienteDeFelicidad (UnaPersona _ edad _ gustos) | edad >= 18 = (length gustos) * (200 - edad)
                                                    | gustos == ["musica"] = (150 - edad)
                                                    | edad < 18  = 1000

coeficienteDeFelicidad (UnaPersona _ edad _ gustos) | edad >= 18 = (length gustos) * (200 - edad)
                                                    | gustos == ["musica"] = (150 - edad)
                                                    | otherwise = 1000

esVocalMalHecho letra | elem letra ["aeiou"] = True
                      | otherwise = False

esVocal' letra = elem letra ["aeiou"]