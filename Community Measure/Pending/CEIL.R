library(igraph)

# Create an example graph
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

# Use the community detection algorithm of your choice to detect communities in the graph
communities <- cluster_louvain(g)


# calculate internal score
internal_score <- function(community) {
  edges_in_community <- sum(E(g)[.inc(community)])
  possible_edges_in_community <- (length(community)*(length(community)-1))/2
  return(edges_in_community/possible_edges_in_community)
}

# calculate external score
external_score <- function(community) {
  edges_in_community <- sum(E(g)[.inc(community)])
  edges_incident_on_community <- sum(E(g)[.inc(V(g)-community)])
  return(edges_in_community/edges_incident_on_community)
}
# calculate CEIL score
ceil_score <- function(community) {
  return(internal_score(community)*external_score(community))
}
# detect communities using louvain algorithm
communities <- cluster_louvain(g)

# calculate CEIL score for each community
ceil_scores <- sapply(communities$membership, function(x) ceil_score(which(x == 1)))
