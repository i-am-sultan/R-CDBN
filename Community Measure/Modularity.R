# Load the igraph library
library(igraph)

datasets <- c("yeast","human")
for(i in datasets){
  if( i == "yeast"){
    print("Yeast Data Set")
    g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))
  }
  if( i=="human"){
    print("Human Data Set")
    g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\Human PPI dataset.gml',format=c("gml"))
  }
  
  # define a list of community detection algorithms to compare
  algorithms <- c( "fastgreedy","leadingeigen","louvain","walktrap","infomap","labelprop")
  
  
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
    
    score <- modularity(communities)
    
    print(paste(algorithm, ":", score))
    
    
  }
}