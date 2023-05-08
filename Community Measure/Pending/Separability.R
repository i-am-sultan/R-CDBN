# load the igraph library
library(igraph)

g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# run a community detection algorithm, for example, the louvain method
communities <- cluster_louvain(g)

# initialize a vector to store the separability scores
separability_scores <- numeric(length(communities$membership))

# iterate over each community
for (i in 1:length(communities$membership)) {
  
  # get the current community
  community <- communities$membership[[i]]
  
  # calculate the number of edges within the community
  edges_within <- ecount(induced.subgraph(g, community))
  
  # calculate the number of edges between the community and the rest of the network
  edges_between <- sum(degree(g, community)) - 2*edges_within
  
  # calculate the separability score
  separability_scores[i] <- edges_within / edges_between
}

# calculate the average separability score
average_separability <- mean(separability_scores)

print(average_separability)
