resultados <- read.csv('data/RESULTADOS_USABILIDAD.csv')
columns <- colnames(resultados)

em <- grep("^EM", criterios, value=T)
elementos_multimedia <- resultados[,em]
#...