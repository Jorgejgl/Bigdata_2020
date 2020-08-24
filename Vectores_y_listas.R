
## Repaso vectores

vectorNumerico <- c(1,2,3)

# Para corrobar si es un vector

is.vector(vectorNumerico)

# Identificar que clase de vector es

class(vectorNumerico)


vectorTexto <- c("haland","sancho","hakimi")

# Identificar que clase de vector es

class(vectorTexto)

# Otros: lista de utiles

listaUtiles <- list("estuche", "corrector", "goma")

class(listaUtiles)

# Combinar vectores

vectorCombinado <- c(vectorNumerico, vectorTexto)

class(vectorCombinado)

# Longitud del vector

length(vectorCombinado)

# Posiciones dentro del vector 

vectorCombinado

vectorCombinado[3]
vectorCombinado[5]
vectorCombinado[4:6]

vectorCombinado[-4]
vectorCombinado[-6]
vectorCombinado[-4:-6]

vectorCombinado[0]
vectorCombinado[7]

vectorCombinadoNuevo <- vectorCombinado[-4:-6]

vectorCombinadoNuevo
class(vectorCombinadoNuevo)

# operaciones

vectorCombinadoNuevo * 5

vectorNumerico * 5
vectorNumerico/4
vectorNumerico[3]/3


VectorNumerico2 <- c(3450, 6780, 8000)

vectorNumerico3 <- vectorNumerico + VectorNumerico2
vectorNumerico3


# Listas

ListaNumeros <- list(45,60,90)
ListaNumeros

vectorNumero <- c(45,60,90)
vectorNumero

ListaNumeros1 <- unlist(ListaNumeros)
ListaNumeros1

class(ListaNumeros1)
class(ListaNumeros)
class(vectorNumero)

## Propiedades similares al vector
ListaNumeros[1]
ListaNumeros[3]
ListaNumeros[-3]

ListaNumeros[-2:-3]

ListaCombinada <- list(ListaNumeros,listaUtiles)
ListaCombinada

ListaCombinada[[2]][[3]]

ListaEstudio <- list("R","leer","hacer la guia")

ListaCombinada2 <- list(ListaCombinada,ListaEstudio)
ListaCombinada2

# Segundo elemento de la segunda lista de la primera lista

ListaCombinada2[[1]][[2]][[2]]


## For-Loop

# Queremos imprimir los valores del 1 al 50

for (h in 1:50) {
  print(h)
}

# Tarea: quiero que empieze de otra posición, ejemplo: posición 2.

for (y in vectorCombinado) {
  print(y)
}

for (y in vectorCombinado[2:6]) {
  print(y)
}

