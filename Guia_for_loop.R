
### Jorge Gonz�lez Leyton.

listaDocumentos <- list(c("mp","Juan","Christofer"),c("of","av01","ampr"),c("of","av01","ante"),
                        c("of","av08","arme"),c("of","av02","ante"),c("of","av07","ampr"),
                        c("of","av03","dape"),c("of","av01","meca"),c("of","av02","dape"),
                        c("mp","Antonia"),c("mp","Christian","Mario"),
                        c("mp","Jose","Pedro","Antonela"),c("of","av05","meca"),
                        c("of","av04","dape"),c("of","av02","arme"))

  
## Ejercicio 1
# Las mp tienen los nombres de las personas a las cuales est�n asociadas,  
# realice una funci�n que cuente cu�ntos ni�os hay por cada una, y entregue una 
# estad�stica de cu�ntos ni�os hay por mp.


# contarNi�osPorMP: calcula la cantidad medidas de protecci�n que hay por 
# cada categoria de cantidad de ni�os.



contarNi�osPorMP<-function(lista_documentos){
  
  categoria_1ni�o<-0
  categoria_2ni�os<-0
  categoria_3ni�os<-0
  
  for(i in lista_documentos){
    if(i[1]=="mp"){
      cantidad_ni�os<-0
      cantidad_ni�os<-(length(i)-1)
      
      if(cantidad_ni�os==1){
        categoria_1ni�o<-categoria_1ni�o+1
      } else if(cantidad_ni�os==2){
        categoria_2ni�os<-categoria_2ni�os+1
      } else if (cantidad_ni�os==3){
        categoria_3ni�os<-categoria_3ni�os+1
      }
    }
  }
  print(paste("se cuentan",categoria_1ni�o,"mp de 1 ni�o"))
  print(paste("se cuentan",categoria_2ni�os,"mp de 2 ni�os"))
  print(paste("se cuentan",categoria_3ni�os,"mp de 3 ni�os"))
}


contarNi�osPorMP(listaDocumentos)


## Ejercicio 2
# Los oficios est�n compuestos por el c�digo al cual pertenecen, construya una 
# funci�n que almacene los c�digos y las tem�ticas a las que est�n asociadas.


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
# Construya una funci�n que act�e de juez y retorne aprobada o reprobada para 
# los diferentes oficios, y entregue la cantidad que hay de cada una.

# juez: retorna la cantidad de casos aprobados o reprobados de los distintos 
# casos de la categoria oficios, que se le entregan.
# Dentro de los oficios podemos encontrar tematicas como: Antecedentes (ante), 
# Datos Personales (dape), Medidas  Cautelares (meca), Audiencia de Revisi�n de 
# Medidas (arme) y Ampliaci�n Medidas de Protecci�n (ampr). 
# Para efectos practicos, solo se consideran como posibles de aprobar a los 
# casos con tipo de tematica: ampliaci�n de medidas de protecci�n (ampr).


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


