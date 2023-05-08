library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))

fg <- cluster_fast_greedy(g)
le <- cluster_leading_eigen(g)
lo <- cluster_louvain(g)
#wt <- cluster_walktrap(g)
#im <- cluster_infomap(g)
#lp <- cluster_label_prop(g)

algos <- list(fg,le,lo)
rand_index <- list()

for (i in 1:length(algos)) {
  for (j in i+1:length(algos)) {
    algorithm1 <- algos[[i]]
    algorithm2 <- algos[[j]]
    rand_index <- compare(algorithm1, algorithm2, method = "rand")
  }
}

print(rand_index)