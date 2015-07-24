setwd("~/researchlab-usability.edu.ec")

readHtml <- function (name='Universidad', file) {
  library('XML')
  html <- readHTMLTable(file)
  table <- na.omit(data.frame(html[2]))
  table[, 6] <- sapply(
    table[,6],
    function(x) as.numeric(gsub('%', '',x))
    )
  table <- table[, c(1,6)]
  rownames(table) <- table[,1]
  table[,1] <- NULL
  table <- t(table)
  table <- data.frame(c(data.frame(
    Universidad=name, table
  )))
  table
}


readExcel <- function(name='Universidad', file) {
  library(XLConnect)
  table <- readWorksheetFromFile(file, sheet=1)
  table[, 6] <- sapply(
    table[,6], 
    function(x) as.numeric(gsub('%', '',x))
  )
  table <- table[, c(1,6)]
  rownames(table) <- table[,1]
  table[,1] <- NULL
  table <- t(table)
  table <- data.frame(c(data.frame(
    Universidad=name, table
  )))
  data.frame(table)
}

readCsv <- function(name='Universidad', file){
  table<-read.table(file, sep = ';', skip=1)
  table[, 6] <- sapply(
    table[,6], 
    function(x) as.numeric(gsub('%', '',x))
  )
  table <- table[, c(1,6)]
  rownames(table) <- table[,1]
  table[,1] <- NULL
  table <- t(table)
  table <- data.frame(c(data.frame(
    Universidad=name, table
    )))
  table
}

main <- function(){
  # Aqui se debe cargar todos los archivos de todas las Universidades
  #data <- list()
  library(plyr)
  a <- readCsv(file = 'data/Universidad Tecnologica Israel-Katherine Villarreal.csv')
  b <- readHtml(file ='data/Universidad Tecnica Particular de Loja - Robert Figueroa.htm')  #z <- rbind.fill(a,b)
  #list.append(a,b)
  z <- rbind.fill(a,b)
}