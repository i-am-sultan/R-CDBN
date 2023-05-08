library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\sultan\\PycharmProjects\\pythonProject\\414.gml',format=c("gml"))

print(g)

#plot(g)

sg <- cluster_spinglass(g, spins=2)
#sg <- cluster_spinglass(g, vertex=1)

cluster_length_sg <- length(sg) #checking the no of clusters

print(cluster_length_sg) 

clusters_size_sg <- sizes(sg) #checking no of nodes in each cluster

print(clusters_size_sg)

#membership(fg)

# plot(fg)

sg_m <- modularity(sg)

print(sg_m)
