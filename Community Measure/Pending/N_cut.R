# load the igraph library
library(igraph)

# generate a toy network
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))


# run a community detection algorithm, for example, the louvain method
communities <- cluster_louvain(g)

# initialize the Ncut score
Ncut_score <- 0

# iterate over each community
for (i in 1:length(communities$membership)) {
  # get the current community
  community <- communities$membership[[i]]
  # calculate the cut of the current community
  cut_value <- cut(g, community)
  # calculate the volume of the current community
  volume_value <- sum(degree(g, community))
  # update the Ncut score
  Ncut_score <- Ncut_score + (cut_value / volume_value)
}

# normalize the Ncut score
Ncut_score <- Ncut_score / length(communities$membership)

print(Ncut_score)
