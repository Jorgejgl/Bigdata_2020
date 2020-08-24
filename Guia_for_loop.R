
### Jorge González Leyton.

listaDocumentos <- list(c("mp","Juan","Christofer"),c("of","av01","ampr"),c("of","av01","ante"),
                        c("of","av08","arme"),c("of","av02","ante"),c("of","av07","ampr"),
                        c("of","av03","dape"),c("of","av01","meca"),c("of","av02","dape"),
                        c("mp","Antonia"),c("mp","Christian","Mario"),
                        c("mp","Jose","Pedro","Antonela"),c("of","av05","meca"),
                        c("of","av04","dape"),c("of","av02","arme"))

  
## Ejercicio 1
# Las mp tienen los nombres de las personas a las cuales están asociadas,  
# realice una función que cuente cuántos niños hay por cada una, y entregue una 
# estadística de cuántos niños hay por mp.


# contarNiñosPorMP: calcula la cantidad medidas de protección que hay por 
# cada categoria de cantidad de niños.



contarNiñosPorMP<-function(lista_documentos){
  
  categoria_1niño<-0
  categoria_2niños<-0
  categoria_3niños<-0
  
  for(i in lista_documentos){
    if(i[1]=="mp"){
      cantidad_niños<-0
      cantidad_niños<-(length(i)-1)
      
      if(cantidad_niños==1){
        categoria_1niño<-categoria_1niño+1
      } else if(cantidad_niños==2){
        categoria_2niños<-categoria_2niños+1
      } else if (cantidad_niños==3){
        categoria_3niños<-categoria_3niños+1
      }
    }
  }
  print(paste("se cuentan",categoria_1niño,"mp de 1 niño"))
  print(paste("se cuentan",categoria_2niños,"mp de 2 niños"))
  print(paste("se cuentan",categoria_3niños,"mp de 3 niños"))
}


contarNiñosPorMP(listaDocumentos)


## Ejercicio 2
# Los oficios están compuestos por el código al cual pertenecen, construya una 
# función que almacene los códigos y las temáticas a las que están asociadas.


# codigosDeOficios: almacena los codigos y las tematicas a las que esta
# asociado cada oficio.


codigosDeOficios<-function(lista_documentos){
  av01<-c()
  av02<-c()
  av03<-c()
  av04<-c()
  av05<-c()
  av06<-c()
  av07<-c()
  av08<-c()
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av01"){
        av01<-c(av01,i[3])
      }
    }
  }
  print(paste("av01",av01))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av02"){
        av02<-c(av02,i[3])
      }
    }
  }
  print(paste("av02",av02))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av03"){
        av03<-c(av03,i[3])
      }
    }
  }
  print(paste("av03",av03))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av04"){
        av04<-c(av04,i[3])
      }
    }
  }
  print(paste("av04",av04))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av05"){
        av05<-c(av05,i[3])
      }
    }
  }
  print(paste("av05",av05))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av06"){
        av06<-c(av06,i[3])
      }
    }
  }
  print(paste("av06",av06))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av07"){
        av07<-c(av07,i[3])
      }
    }
  }
  print(paste("av07",av07))
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      if(i[2]=="av08"){
        av08<-c(av08,i[3])
      }
    }
  }
  print(paste("av08",av08))
  
}


codigosDeOficios(listaDocumentos)


## Ejercicio 3
# Construya una función que actúe de juez y retorne aprobada o reprobada para 
# los diferentes oficios, y entregue la cantidad que hay de cada una.

# juez: retorna la cantidad de casos aprobados o reprobados de los distintos 
# casos de la categoria oficios, que se le entregan.
# Dentro de los oficios podemos encontrar tematicas como: Antecedentes (ante), 
# Datos Personales (dape), Medidas  Cautelares (meca), Audiencia de Revisión de 
# Medidas (arme) y Ampliación Medidas de Protección (ampr). 
# Para efectos practicos, solo se consideran como posibles de aprobar a los 
# casos con tipo de tematica: ampliación de medidas de protección (ampr).


juez<-function(lista_documentos){
  cantidad_Oficios<-0
  aprobadas<-0
  reprobadas<-0
  
  for(i in lista_documentos){
    if(i[1]=="of"){
      cantidad_Oficios<-cantidad_Oficios+1
      if(i[3]=="ampr"){
        aprobadas<-aprobadas+1
      } else {
        reprobadas<-reprobadas+1
      }
    }
  }
  print(paste("Llegaron",cantidad_Oficios,"oficios de los cuales:",aprobadas,
              "son aprobadas y",reprobadas,"reprobados"))
}


juez(listaDocumentos)


