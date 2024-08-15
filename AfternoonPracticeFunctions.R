




# Pull values from a dataframe

gw_rate <- function(site){
  if(!site%in% c("mountain", "prairie","desert","beach")){ # Create warning for invalid input values 
    warning("Your input value for site is invalid")
  }
  gw_depths <- data.frame(sitename = c("mountain", #Create vector with site names
                                       "praire",
                                       "desert",
                                       "beach"),
                          depth = c(32, 41, 63, 2), #Create vector with depth values at sites
                          slope = c(11.2, 0.4, 0.8,2.6)) #Create vector with slope values at sites
  site_select <- filter(gw_depths, sitename == site) #filter and creates a subset at the selected site
  transport_rate <- 1.4 * site_select$slope + 3.6 * site_select$depth #define what the result should be 
                                                   #this sets the transport rate to be equal to 1.4 (constant)*                                                    the slope at the selected site + constant * depth at selected                                                    site
                                                                          
  return(transport_rate)
}


gw_rate("beach")

