# Load the required libraries
library(igraph)
library(spectral)

# Read the network from a GML file
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# Compute the Laplacian matrix of the network
L <- laplacian_matrix(g)

# Perform spectral clustering with 3 clusters
clusters <- spectralClustering(L, 3)

# Plot the network with nodes colored by cluster
plot(g, vertex.color = clusters$membership)
