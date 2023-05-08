# Load the igraph library
library(igraph)

datasets <- c("yeast","human")
for(i in datasets){
  if( i == "yeast"){
    print("Yeast Data Set")
    g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\yeast_ppi.gml',format=c("gml"))
  }
  if( i=="human"){
    print("\nHuman Data Set")
    g <- read.graph('C:\\Users\\sultan\\Desktop\\PROJECT CDBN\\R Codes\\Human PPI dataset.gml',format=c("gml"))
  }

  # define a list of community detection algorithms to compare
  algorithms <- c( "fastgreedy","leadingeigen","louvain","walktrap","infomap","labelprop")
  
  # initialize a list to store the cut ratio scores for each algorithm
  cut_ratio <- list()
  
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
    
    # Calculate the number of edges that connect different communities
    cut_edges <- sum(!(communities$membership[get.edgelist(g)[,1]] == communities$membership[get.edgelist(g)[,2]]))
    
    # Calculate the total number of edges in the graph
    total_edges <- ecount(g)
    
    # Calculate the cut ratio
    cut_ratio <- cut_edges / total_edges
    
    print(paste(algorithm, ":", cut_ratio))
  
  }
}
