# load the igraph library
library(igraph)

# read the network from a file
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))


# define a list of community detection algorithms to compare
algorithms <- c( "fastgreedy","leadingeigen","louvain","walktrap","infomap","labelprop")

# initialize a list to store the conductance scores for each algorithm
conductance_scores <- list()

# iterate over each community detection algorithm
for (algorithm in algorithms) {
  if(algorithm == "labelprop"){
    communities <- cluster_label_prop(g)
  }
  if(algorithm == "leadingeigen"){
    communities <- cluster_leading_eigen(g)
  }
  if(algorithm == "louvain"){
    communities <- cluster_louvain(g)
  }
  if(algorithm == "fastgreedy"){
    communities <- cluster_fast_greedy(g)
  }
  if(algorithm == "infomap"){
    communities <- cluster_infomap(g)
  }
  if(algorithm == "walktrap"){
    communities <- cluster_walktrap(g)
  }
  
  # initialize a vector to store the conductance scores for the current algorithm
  conductance_scores[[algorithm]] <- numeric(length(communities$membership))
  
  # iterate over each community
  for (i in 1:length(communities$membership)) {
    
    # get the current community
    community <- communities$membership[[i]]
    
    # calculate the number of edges within the community
    edges_within <- ecount(induced.subgraph(g, community))
    
    # calculate the number of edges going out of the community
    edges_outside <- sum(degree(g, community)) - 2*edges_within
    
    # calculate the conductance score
    conductance_scores[[algorithm]][i] <- edges_outside / (2*edges_within + edges_outside)
  }
  # calculate the average conductance score for the current algorithm
  average_conductance <- mean(conductance_scores[[algorithm]])
  
  print(paste(algorithm, ":", average_conductance))
}
