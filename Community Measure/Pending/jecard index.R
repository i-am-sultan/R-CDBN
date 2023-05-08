library(igraph) #importing the library igraph

g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))

result_louvain <- cluster_louvain(g)
#communities_louvain <- result_louvain$membership
result_infomap <- cluster_leading_eigen(g)
#communities_infomap <- result_infomap$membership

#jaccard_similarity <- similarity(communities_louvain, communities_infomap, method="jaccard")
#print(jaccard_similarity)
jaccard_index <- (length(intersect(result_louvain, result_infomap)))/(length(union(result_louvain, result_infomap)))
print(jaccard_index)
