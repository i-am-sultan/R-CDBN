library(igraph) #importing the library igraph

#g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

print(g)

#plot(g,vertex.label=NA,vertex.color=NA)

lv <- cluster_louvain(g) #performing louvain on g

cluster_length_lv <- length(lv) #checking the no of clusters

print(cluster_length_lv) 

clusters_size_lv <- sizes(lv) #checking no of nodes in each cluster

print(clusters_size_lv)

#membership(fg)

#plot(lv,g,vertex.label=NA,vertex.color=NA)

lv_m <- modularity(lv)

print(lv_m)

