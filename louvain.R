library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\offic\\Desktop\\PROJECT CDBN\\Algorithms\\#5 LOUVAIN\\yeast_ppi.gml',format=c("gml"))

print(g)

#plot(g)

lv <- cluster_louvain(g) #performing louvain on g

cluster_length_lv <- length(lv) #checking the no of clusters

print(cluster_length_lv) 

clusters_size_lv <- sizes(lv) #checking no of nodes in each cluster

print(clusters_size_lv)

#membership(fg)

plot(lv,g)

  lv_m <- modularity(lv)

print(lv_m)
