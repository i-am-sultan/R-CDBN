# load the igraph library
library(igraph)

# generate a toy network
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# run a community detection algorithm, for example, the louvain method
communities <- cluster_louvain(g)

# calculate the number of nodes in the detected communities
nodes_in_communities <- sapply(communities$membership, function(x) {
  length(x)
})

# calculate coverage
coverage <- sum(nodes_in_communities) / vcount(g)

print(coverage)
