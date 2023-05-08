# load the igraph library
library(igraph)

# read the network from a file
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# run a community detection algorithm, for example, the louvain method
communities <- cluster_infomap(g)

# initialize a vector to store the conductance scores
conductance_scores <- numeric(length(communities$membership))

# iterate over each community
for (i in 1:length(communities$membership)) {
  
  # get the current community
  community <- communities$membership[[i]]
  
  # calculate the number of edges within the community
  edges_within <- ecount(induced.subgraph(g, community))
  
  # calculate the number of edges going out of the community
  edges_outside <- sum(degree(g, community)) - 2*edges_within
  
  # calculate the conductance score
  conductance_scores[i] <- edges_outside / (2*edges_within + edges_outside)
}

# calculate the average conductance score
average_conductance <- mean(conductance_scores)

print(average_conductance)
