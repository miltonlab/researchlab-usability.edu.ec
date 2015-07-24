setwd("~/researchlab-usability.edu.ec")

readHtml <- function (name, file) {
  library('XML')
  name = 'UTPL'
  file = 'data/Universidad Tecnica Particular de Loja - Robert Figueroa.htm'
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
  rownames(table)<-c(name)
  table
}


readExcel <- function(name, file) {
  
}

readCsv <- function(name, file){
  table<-read.table(file, sep = ';', skip=1)
  table[, 6] <- sapply(
    table[,6], 
    function(x) as.numeric(gsub('%', '',x))
  )
  table <- table[, c(1,6)]
  rownames(table) <- table[,1]
  table[,1] <- NULL
  table <- t(table)
  rownames(table)<-c(name)
  table  
}