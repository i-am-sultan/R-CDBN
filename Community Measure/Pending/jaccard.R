# Load the igraph package
library(igraph)
# Load the cluster package
library(cluster)

# Create an example network
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# Find the communities in the network using the walktrap algorithm
communities <- cluster_louvain(g)

# Create a vector of the community assignments for each node
communities_vector <- membership(communities)

# Create a vector of the reference partition of the network
#reference_partition <- c(rep(1,50),rep(2,50))

# Calculate the Jaccard Index between the two vectors
jaccard(communities_vector, reference_partition)
