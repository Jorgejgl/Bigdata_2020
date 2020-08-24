
## Trabajo gráficos

## Autor: Jorge González.
## Electivo de Big data. 

# Investigación realizada a la página "Yapo.cl", en su funcionamiento dentro de la Región 
# Metropolitana, la cual ha decretado cuarentena para las diversas comunas que la componen, 
# debido a la presencia del COVID-19.


## Librerias utilizadas.

install.packages("rvest")
install.packages("tidyverse")
library(xml2)
library(rvest)
library(ggplot2)
library(tidyverse)
library(datasets)
library(dplyr)
source('libreriasYapo.R')


## Procedencia de los datos a trabajar.


sacandoPrecio <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, ".offer")
  if(length(nodoBread)>0){
    precio <- html_text(nodoBread)
    precio <- gsub("\\t","",precio)
    precio <- gsub("\\n","",precio)
    precio <- gsub("\\$","",precio)
    precio <- gsub("[.]","",precio)
    precio <- as.numeric(precio)
  }else{
    precio = NA
  }
  return(precio)
}

obtenerCategoria <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, ".breadcrumbs")
  nodoBread <- html_nodes(nodoBread, "strong")
  return(html_text(nodoBread))
}

obtenerComuna <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, "seller-info")
  comuna <- html_attr(nodoBread,"region")
  return(gsub("RegiÃ³n Metropolitana, ","",comuna))
}

obtenerTipoNegocio <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, ".details")
  nodoBread <- html_nodes(nodoBread, "table")
  tabla <- html_table(nodoBread)[[1]]
  subsettn <- unlist(subset(tabla, X1 == 'Tipo')[2])
  if(length(subsettn)>0){
    return(subsettn)
  }else{
    return(NA)
  }
}

obtenerAnioUsuarioYapo <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, "seller-info")
  seniority <- html_attr(nodoBread,"seniority")
  seniority <- gsub("En Yapo desde ","",seniority)
  return(strsplit(seniority," ")[[1]][2])
}

obtenerPublicacionesActivasUsuarioYapo <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, "seller-info")
  actives <- html_attr(nodoBread,"actives")
  return(gsub("[.]","",actives))
}

obtenerPublicacionesTotalesUsuarioYapo <- function(htmlSeg){
  nodoBread <- html_nodes(htmlSeg, "seller-info")
  historical <- html_attr(nodoBread,"historical")
  return(gsub("[.]","",historical))
}


fullDatos <- data.frame()
for(numeroPagina in 1:5){
  readHtml <- read_html(paste("https://www.yapo.cl/region_metropolitana?ca=15_s&o=",numeroPagina,sep = ""))
  print(paste("Descargando pagina nro:",numeroPagina))
  nodeTabla <- html_nodes(readHtml, ".listing_thumbs")
  nodeTabla <- html_nodes(nodeTabla, ".title")
  linksProductos <- html_attr(nodeTabla,"href")
  
  for (urlYapo in linksProductos) {
    htmlSeg <- read_html(urlYapo)
    
    print(paste("Descargando URL ==> ",urlYapo))
    
    textoTipoAviso <- obtenerCategoria(htmlSeg)
    precio <- sacandoPrecio(htmlSeg)
    comuna <- obtenerComuna(htmlSeg)
    tipoNegocio <- obtenerTipoNegocio(htmlSeg)
    anioUsuarioyapo <- obtenerAnioUsuarioYapo(htmlSeg)
    publicacionesactivasusuarioyapo <- obtenerPublicacionesActivasUsuarioYapo(htmlSeg)
    publicacionestotalesusuarioyapo <- obtenerPublicacionesTotalesUsuarioYapo(htmlSeg)
    
    fullDatos <- rbind(fullDatos,data.frame(comuna = comuna, categoria = textoTipoAviso, precio = precio,
                                            tiponegocio = tipoNegocio, aniousuarioyapo = anioUsuarioyapo,
                                            urlyapo = urlYapo ))
  }
}

View(fullDatos)


# Al clonar el repositorio enlazado y ejecutar los codigos de los archivos .R adjuntos, se   
# se obtiene un dataframe denominado "fullDatos". "fullDatos" expone una tabla de datos,  
# integrada por 6 variables y con 150 observaciones extraídas en tiempo real de las 3 primeras 
# páginas de la web: www.yapo.cl/region_metropolitana/.
# Para efectos prácticos de este trabajo, se realizó una modificación en el código que crea el   
# dataframe, lo que permite obtener 250 observaciones extraidas de las primeras 5 páginas de 
# la web, de manera de ampliar la muestra y realizar un mejor análisis de los datos.



## Ejercicio 1: Genere un filtro en las variables que le llamen la atención para realizar un 
## estudio con los siguientes puntos.


# Analisis de la variable "comuna". 
# ¿En que comuna se realizan más publicaciones en el sitio web de Yapo.cl?


ggplot(fullDatos, aes(x=comuna))+
  geom_bar()+
  scale_x_discrete(name = "Comunas de la Región Metropolitana")+
  scale_y_continuous(name = "Cantidad de avisos publicados", breaks = seq(0,70,5), limits = c(0,70))+
  geom_text(stat = 'count', hjust = 0, vjust = 0, position = position_dodge(0.9), aes(x = comuna, label=stat(count)))+
  ggtitle(label = "Cantidad de avisos publicados, agrupados por comuna de la R.M.")+
  theme_bw()+
  coord_flip()

# Se observa que la comuna de "Santiago" es la que presenta la mayor cantidad de publicaciones, con un
# total de 59, presentando una diferencia notable en comparación a la que le sigue, que corresponde 
# a la comuna de "La Florida" con un total de 21 publicaciones.


## Filtro a la variables: "comuna" y "tiponegocio"
# ¿Que categoría es la mas vendida en la comuna de santiago?


categoriaLiderEnSantiago <- filter(fullDatos, comuna=="Región Metropolitana, Santiago", tiponegocio=="Vendo")


ggplot(categoriaLiderEnSantiago, aes(x=categoria))+
  geom_bar()+
  scale_x_discrete(name = "Categorias")+
  scale_y_continuous(name = "Cantidad de avisos de venta publicados")+
  geom_text(stat = 'count', hjust = 0, vjust = 0, position = position_dodge(0.9), aes(x = categoria, label=stat(count)))+
  ggtitle(label = "Cantidad de avisos de venta publicados, agrupados por categoria.")+
  theme_classic()+
  coord_flip()

# Se observa que la categoria denominada "accesorios y piezas para vehículos" es la que presenta la mayor 
# cantidad de publicaciones, con un total de 16, presentando una diferencia notable en comparación a la
# que le sigue, que corresponde a la categoria "Salud y Belleza" con un total de 5 publicaciones.
                          
  
## Ejercicio 2: Analice la información entregada y redacte un informe respecto a estos datos, a través de
## visualizaciones.


# "Yapo.cl" es un sitio web de avisos clasificados gratis con presencia en todo Chile, que
# permite vender y comprar bienes y servicios a las personas dentro de su región.
# En este caso, el estudio al sitio web se realiza utilizando datos recopilados en publicaciones 
# realizadas en la Región Metropolitana, en tiempos de cuarentena.
# El estudio a la página web fue realizado con la intención de descubrir en primer lugar, que comuna 
# presenta la mayor cantidad de publicaciones. Al realizar el analisis se descubrió que la comuna de 
# Santiago presentaba la mayor cantidad de publicaciones, lo cual se debe a su ubicación centrica
# dentro de la Región Metropolitana, que la posiciona como un área estrategica para prácticas
# industriales y comerciales. 
# Posterior a descubrir que la comuna de Santiago presentaba la mayor cantidad de publicaciones, se 
# decidió estudiar cuales son las categorias que presentaban la mayor cantidad de ventas en dicha comuna.
# El estudio entregó que la categoria denominada  "accesorios y piezas para vehículos" es la que presenta 
# la mayor cantidad de publicaciones de ventas con diferencia, en comparación a las demás categorias, 
# lo que se explica debido a la presencia de sectores como "Barrio 10 de Julio" o "Barrio Brasil", donde 
# existe una densa concentración de talleres mecanicos y locales de repuestos de automoviles, los cuales
# se encuentran cerrados debido a la cuarentena decretada en la comuna de Santiago y visualizan una 
# oportunidad de venta en sitios web como "Yapo.cl"


## EJERCICIO 3: Dentro del data frame hay valores "NA", para cada uno de estos casos describa por qué
## sucede y grafíquelo.


is.na(fullDatos) # Detecta la presencia de "NA" en el dataframe.

# Se observa que existen valores "NA", principalmente en las variables "precio" y "tiponegocio" y algunos
# en la variable "aniousuarioyapo". 

fullDatos$precio[is.na(fullDatos$precio)] <- "Sin observación"

# Se sustituyen los valores "NA" por "Sin observación" en la variable "precios" del dataframe denominado
# "fullDatos", con la intención de poder filtrarlos.

sinObservacionPrecio <- filter(fullDatos, precio=="Sin observación")

# Se filtra la información  para crear un nuevo dataframe denominado "sinObservacionPrecio", el cual
# contiene solo precios no establecidos.

ggplot(sinObservacionPrecio, aes(x=precio))+
  geom_bar(aes(fill=categoria), position = "dodge")+
  scale_x_discrete(name = "Categorias por colores")+
  scale_y_continuous(name = "Cantidad de avisos publicados sin precio establecido (NA)", breaks = seq(0,25,2), limits = c(0,25))+
  ggtitle("Cantidad de avisos publicados sin precio establecido, agrupados por categorias.")+
  theme_linedraw()

# Al graficar "sinObservacionPrecio" por categorias, se observa que los precios no establecidos se
# encuentran principalmente en categorias como: arriendos o servicios, lo cual resulta lógico
# debido a que no corresponden a un tipo de negocio de venta, sino más bien a un alquiler temporal. 
# Por otra parte, se observan algunos casos específicos en que ciertas categorías que debiesen 
# tener precio, no lo presentan.
# Se concluye que la mayor cantidad de "NA" dentro del dataframe "fullDatos", se originan debido
# a ciertas categorías que no necesitan un precio y que son de un tipo de negocio distinto
# a los que la página web de Yapo.cl tiene establecidos por defecto.


## EJERCICIO 4: Busque la forma de guardar y cargar los datos obtenidos en un CSV.


setwd("C:/Users/Jorge/Documents/CLASES 2020/BIG DATA/Datos_exportados")

write.table(fullDatos, file = "fullDatos_excel.csv", sep = ";", row.names = F)
