# SECO: Sample dominant species across plots for traits
# John L. Godlee (john.godlee@ed.ac.uk)
# 2022-04-27

# Import example data (kilwa_fil.csv)
# This dataset includes plot id, tree id, species, and a value for basal area (ba)
dat <- read.csv("./kilwa_fil.csv")

# Define function to sample dominant species within a single plot 
domSpecies <- function(x, species_name, abundance, per) {

  x_split <- split(x, x[[species_name]])

  ab_total <- sum(x[[abundance]])

  ab_per <- ab_total * per

  ab_cum <- cumsum(
    sort(
      sapply(x_split, function(y) {
        sum(y[[abundance]])
      }), 
      decreasing = TRUE)
    )
    
  if (length(ab_cum) > 1) {
    out <- names(ab_cum)[ab_cum <= ab_per]
  } else {
    out <- names(ab_cum)
  }
  

  return(out)
}

# Define function to calculate rolling means
rollmean <- function(x, win) {
  n <- length(x)
  y <- x[win:n] - x[c(1, 1:(n-win))]
  y[1] <- sum(x[1:win])
  return(cumsum(y) / win)
}

# Define function to sample individuals across a range of tree sizes for one plot
rangeSample <- function(x, abundance, n) {
  # Find quantiles 
  qu <- as.vector((quantile(range(x[[abundance]], na.rm = TRUE), 
    seq(0,1,1/n))))
  
  # Get midpoint between quantiles
  qu_mid <- rev(rollmean(qu, 2))
  
  # For each quantile midpoint, find closest individual not already sampled
  ind <- vector()
  x <- as.data.frame(x)
  x_fil <- x
  
  for (i in seq_along(qu_mid)) {
    if (nrow(x_fil) > 0) {
      ind[length(ind)+1] <- rownames(x_fil)[which(abs(x_fil[[abundance]]-qu_mid[i]) == 
          min(abs(x_fil[[abundance]]-qu_mid[i])))[1]]
      x_fil <- x_fil[!rownames(x_fil) %in% ind,]
    }
  }
 
  return(x[ind,])
}

# Define wrapper function to sample individuals from dominant species across all plots
traitSample <- function(x, plot_id, species_name, abundance, per, n) {
  x_split <- split(x, x[[plot_id]])
  
  samples <- do.call(rbind, lapply(x_split, function(y) {
    dom_sp <- domSpecies(y, species_name, abundance, per)
    
    y_split <- split(y, y[[species_name]])[dom_sp]
    
    do.call(rbind, lapply(y_split, function(z) {
      rangeSample(z, abundance, n)
    }))
  }))
  
  rownames(samples) <- NULL
  
  return(samples)
}

# Run wrapper function with example data
traitSample(dat, "plot_id", "species", "ba", 0.8, 5)
