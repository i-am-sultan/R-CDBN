library(igraph)
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format = c("gml"))
print(g)
plot(g,vertex.label=NA,vertex.color=NA)
