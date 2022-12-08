library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\offic\\Desktop\\PROJECT CDBN\\Algorithms\\#5 LOUVAIN\\yeast_ppi.gml',format=c("gml"))

print(g)

#plot(g)

ld <- cluster_leiden(g) #performing leiden on g

cluster_length_ld <- length(ld) #checking the no of clusters

print(cluster_length_ld) 

clusters_size_ld <- sizes(ld) #checking no of nodes in each cluster

print(clusters_size_ld)

#membership(fg)

# plot(fg)

ld_m <- modularity(fg)
print(ld_m)
