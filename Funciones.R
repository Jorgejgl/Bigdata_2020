# Asignacion un texto a una variable

textoEscrito <- "holamundo"

textoEscrito2 <- "como estas?"

textoEscrito + textoEscrito2

# Calculo de mod o resto

7 %% 3 

8 %% 2

## Crear función promedio

# promedioNotas: double double double->double
# promedioNotas: obtiene el promedio de las notas que le ingresan
# Ejemplo: (3,4,5)->4

promedioNotas <- function(nota1,nota2,nota3){
  
  notafinal<-(nota1+nota2+nota3)/3
  return(notafinal)
  
}

promedioNotas(3,4,5)


## ejercicio 1: quiero una función que multiplique mis calificaciones

# multiplicadorNotas: double double double->double
# multiplicadorNotas: obtiene el valor que se origina al multiplicar las notas que le ingresan
# Ejemplo: (3,4,5)->4

multiplicadorNotas <- function(nota1,nota2,nota3){
  
  notamultiplicada<-(nota1*nota2*nota3)
  return(notamultiplicada)
  
}

multiplicadorNotas(3,4,5)

## quiero que obtengan la diferencia de las areas de dos cuadrados

# diferenciadeareadecuadrados: double double->double
# diferenciadeareadecuadrados: obtiene el valor que se origina al restar el area que tienen 2 cuadrados
# ejemplo: (4,3)->1

diferenciadeareadecuadrados <- function(area1,area2){
  
  diferenciacuadrada<-(area1-area2)
  return(diferenciacuadrada)
  
}

diferenciadeareadecuadrados(4,3)


## quiero que obtengan la diferencia del area de dos rectangulos ocupando dos lados

# diferenciadeareadecuadrados: double double double double->double
# diferenciadeareadecuadrados: obtiene el valor que se origina al calcular la diferencia de dos rectangulos ocupando los lados
# ejemplo: (3,4,6,8)-> 36

diferenciadeareaderectangulos<-function(lado1rectangulo1,lado2rectangulo1,lado1rectangulo2,lado2rectangulo2){
  
  diferenciarectangular<-abs((lado1rectangulo1*lado2rectangulo1)-(lado1rectangulo2*lado2rectangulo2))
  return(diferenciarectangular)
  
}

diferenciadeareaderectangulos(3,4,6,8)
