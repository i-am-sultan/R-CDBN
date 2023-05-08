library(igraph)
g <- read.graph('C:\\Users\\sultan\\PycharmProjects\\pythonProject\\414.gml',format = c("gml"))
print(g)
plot(g, vertex.label=NA,vertex.color=NA)
