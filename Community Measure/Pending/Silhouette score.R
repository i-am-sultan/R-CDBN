# load the cluster library
library(cluster)

# generate a toy network
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

# run a community detection algorithm, for example, the louvain method
communities <- cluster_louvain(g)

# get the adjacency matrix of the network
adj_matrix <- as_adjacency_matrix(g)

# calculate the silhouette score
silhouette_score <- silhouette(adj_matrix, communities$membership)

print(silhouette_score)
