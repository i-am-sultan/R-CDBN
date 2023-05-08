# load the igraph library
library(igraph)

# generate a toy network
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

# run a community detection algorithm, for example, the louvain method
communities <- cluster_louvain(g)

# get the number of edges within each community
edges_within_community <- sapply(communities$membership, function(x) {
  subgraph <- induced.subgraph(g, x)
  ecount(subgraph)
})

# get the number of possible edges within each community
possible_edges_within_community <- sapply(communities$membership, function(x) {
  n <- length(x)
  n*(n-1)/2
})

# calculate the internal density for each community
internal_density <- ifelse(possible_edges_within_community==0,0,edges_within_community/possible_edges_within_community)

# average internal density over all communities
average_internal_density <- mean(internal_density,na.rm=TRUE)

print(average_internal_density)
