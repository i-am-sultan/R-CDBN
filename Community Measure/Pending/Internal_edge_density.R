library(igraph)

# Create an example graph
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))

# Use the community detection algorithm of your choice to detect communities in the graph
communities <- cluster_louvain(g)

# Extract the detected community
detected_community <- communities$membership[which.max(communities$modularity)]

# Extract the subgraph of the detected community
subgraph <- induced.subgraph(g, which(detected_community == 1))

# Extract the number of internal edges in the subgraph
internal_edges <- ecount(subgraph)

# Calculate the number of possible internal edges
possible_internal_edges <- (vcount(subgraph) * (vcount(subgraph) - 1))/2

# Calculate the internal edge density
internal_edge_density <- internal_edges / possible_internal_edges

print(internal_edge_density)
