library(igraph) #importing the library igraph

#g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

print(g)

#plot(g)

fg <- cluster_fast_greedy(g) #performing fast_greedy on g

cluster_length_fg <- length(fg) #checking the no of clusters

print(cluster_length_fg) 

clusters_size_fg <- sizes(fg) #checking no of nodes in each cluster

print(clusters_size_fg)

#membership(fg)

# plot(fg)

fg_m <- modularity(fg)

print(fg_m)

