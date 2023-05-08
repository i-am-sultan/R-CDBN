# Load the required packages
library(igraph)
library(kernlab)

# Read the edgelist data from a file
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# Convert the graph to an adjacency matrix
adj <- as.matrix(as_adjacency_matrix(g, sparse = FALSE))

# Compute the similarity matrix
sigma <- 0.5
W <- exp(-dist(adj)^2 / (2 * sigma^2))

# Apply spectral clustering
k <- 2
clust <- spectralClustering(W, centers = k)

# Calculate the modularity score
mod <- modularity(g, membership = clust)

# Plot the results
#plot(g, vertex.color = clust)
