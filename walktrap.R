library(igraph) #importing the library igraph
#g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))
g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\Datasets\\Human PPI dataset.gml',format=c("gml"))
#print(g)
#plot(g)
wt <- cluster_walktrap(g)
cluster_length_wt <- length(wt) #checking the no of clusters
print(cluster_length_wt) 
clusters_size_wt <- sizes(wt) #checking no of nodes in each cluster
print(clusters_size_wt)
#membership(fg)
# plot(fg)
wt_m <- modularity(wt)
print(wt_m)
