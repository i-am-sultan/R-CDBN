library(igraph)

# Load the Zachary's karate club graph as an example
karate <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))


# Apply the Louvain algorithm
louvain <- cluster_louvain(karate)

# Calculate the average distance within each community
avg_dists <- sapply(unique(membership(louvain)), function(i) {
  nodes <- which(membership(louvain) == i)
  subgraph <- induced_subgraph(karate, nodes)
  mean_distance(subgraph)
})

# Calculate the average distance to the nearest neighboring community for each node
nearest_avg_dists <- sapply(V(karate), function(v) {
  neighbors <- V(karate)[neighbors(karate, v)]
  neighbors_community <- membership(louvain)[neighbors]
  if (length(unique(neighbors_community)) == 1) {
    # Node has no neighbors in other communities
    return(0)
  } else {
    # Calculate average distance to neighbors in each community
    avg_dists <- sapply(unique(neighbors_community), function(i) {
      nodes <- neighbors[neighbors_community == i]
      subgraph <- induced_subgraph(karate, c(v, nodes))
      mean_distance(subgraph)
    })
    # Return minimum average distance to a neighboring community
    return(min(sapply(avg_dists, function(d) mean(d[, 1]))))
  }
})

# Calculate the Silhouette Score
silhouette <- mean((nearest_avg_dists - avg_dists) / pmax(avg_dists, nearest_avg_dists))

# Print the Silhouette Score
cat("Silhouette Score:", silhouette, "\n")
