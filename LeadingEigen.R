library(igraph) #importing the library igraph

#g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


#print(g)

#plot(g,vertex.label="")

le <- cluster_leading_eigen(g) #performing leading eigen on g

cluster_length <- length(le) #checking the no of clusters

print(cluster_length) 

clusters_size <- sizes(le) #checking no of nodes in each cluster

print(clusters_size)

#membership(le)

#plot(le,g,vertex.label="")

lg_m <- modularity(le)

print(lg_m)

