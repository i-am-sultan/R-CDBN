library(igraph) #importing the library igraph
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))

print(g)

#plot(g)

ld <- cluster_label_prop(g, weights = NULL) 

cluster_length_ld <- length(ld) #checking the no of clusters

print(cluster_length_ld) 

clusters_size_ld <- sizes(ld) #checking no of nodes in each cluster

print(clusters_size_ld)

#membership(fg)

# plot(fg)

ld_m <- modularity(ld)

print(ld_m)

