library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\offic\\Desktop\\PROJECT CDBN\\Algorithms\\#5 LOUVAIN\\yeast_ppi.gml',format=c("gml"))

print(g)

#plot(g)

le <- cluster_leading_eigen(g) #performing leading eigen on g

cluster_length <- length(le) #checking the no of clusters

print(cluster_length) 

clusters_size <- sizes(le) #checking no of nodes in each cluster

print(clusters_size)

#membership(le)

# plot(gc,g)

lg_m <- modularity(le)

print(lg_m)