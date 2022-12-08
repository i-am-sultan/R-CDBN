library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\offic\\Desktop\\PROJECT CDBN\\Algorithms\\#5 LOUVAIN\\yeast_ppi.gml',format=c("gml"))

print(g)

#plot(g)

sg <- cluster_spinglass(g) #performing spinglass on g

cluster_length_sg <- length(sg) #checking the no of clusters

print(cluster_length_sg) 

clusters_size_sg <- sizes(sg) #checking no of nodes in each cluster

print(clusters_size_sg)

#membership(fg)

# plot(fg)

sg_m <- modularity(sg)

print(sg_m)
