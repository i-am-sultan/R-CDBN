# load the igraph library
library(igraph)

# generate a toy network
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

jaccard <- function(a,b){
  intersection <- length(intersect(a,b))
  union <- length(a)+length(b)-intersection
  return(intersection/union)
}

# Run community detection algorithm 1
communities1 <- cluster_leading_eigen(g)

#communities1 <- order(- communities1$membership)

# Run community detection algorithm 2
communities2 <- cluster_louvain(g)

#communities2 <- order(- communities2$membership)

# Calculate the Jaccard index for the two sets of communities
# iterate over each community

if(length(communities1$membership)<length(communities2$membership)){
  len <- length(communities1$membership)
}else{
  len <- length(communities2$membership)
}

len

for (i in 1:len) {
jaccard_index <- jaccard(communities1$membership[[i]], communities2$membership[[i]])
}

print(mean(jaccard_index))

