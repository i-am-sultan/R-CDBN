library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))

print(g)

#plot(g)

im <- cluster_infomap(g)

cluster_length_im <- length(im) #checking the no of clusters

print(cluster_length_im) 

clusters_size_im <- sizes(im) #checking no of nodes in each cluster

print(clusters_size_im)

#membership(fg)

# plot(fg)

im_m <- modularity(im)

print(im_m)
