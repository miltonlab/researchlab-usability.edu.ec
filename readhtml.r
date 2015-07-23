setwd("~/researchlab-usability.edu.ec")
library('XML')
html = readHTMLTable('data/Universidad Tecnica Particular de Loja - Robert Figueroa.htm')
df = na.omit(data.frame(html[2]))
utpl = df[,c(1,6)]