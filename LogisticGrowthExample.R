rm(list = ls())

# Create equation
Nt <- K / (1+((K - N0) / N0)*exp(-r * time))

# Nest equation within a function
logistic_growth <- function(N0, K, r, time){      # Set parameters
  Nt <- K / (1+((K - N0) / N0)*exp(-r * time))    # Input the equation (copied from above)
  return(Nt)                                      # Print results
  
}

logistic_growth(100, 6000, 0.27, 40)


# Iterate over time

# Create a time vector
time_vec <- seq(from = 0, to = 50, by = 0.1)


#Over time, use the time vector
pop_1 <- logistic_growth(N0=100, K =6000, r =0.27, time = time_vec)
pop_1

pop_1_vec <-vector(mode = "numeric", length = length(time_vec)) # Create an empty vector


#Create inner part of for loop (this is for the logistic growth over sequence of time)
for(i in seq_along (time_vec)){ 
  population <- logistic_growth(N0=100, K =6000, r =0.27, time = time_vec[i]) # set population equal to equation
  pop_1_vec [i] <- population #replace empty vec with values from population
}

pop_1_vec

pop_time_1 <- data.frame(time_vec, pop_1_vec)

#Test with a plot
ggplot(data = pop_time_1, aes(x = time_vec, y= pop_1_vec))+
  geom_line(color="#0e7965") +
  labs(title="Population Growth Over Time", x = "Time", y = "Population Size") +
  theme(text = element_text(family = 'Optima-Bold'),axis.title = element_text(family = 'Optima'), legend.text = element_text(size = 10)) +
  geom_area(color="#0e7965", fill="#0e7965", alpha = .7) 

#Do the same thing for a range
#Create outer part of for loop (this is for a series of growth rates)

# Create sequence of growth rates
r_seq <- seq(from = 0.2, to = 0.4, by = 0.01)

# Create a matrix to store the outputs
out_matrix <- matrix(nrow=length(time_vec), ncol = length(r_seq))  # numb of rows as time vec, num of columns as r values

for (i in seq_along(r_seq)) { # outer loop seq of growth rates
  for (j in seq_along((time_vec))) { #inner loop of time steps
    population <- logistic_growth(N0 = 100, K = 6000, r = r_seq[i], time = time_vec[j])
   # Setting the values, where N0 and K are constants
    out_matrix[j,i] <- population #pay attention to rows vs time - formatted [rows,column] 
    }                              # we want time in row and rate in columns
}

out_matrix

out_df <- data.frame(out_matrix, time = time_vec)
colnames(out_df) <- c(paste0("growth_rate_", r_seq),"time") #update column names

#In R we don't like wide data, it's harder to plot so we are switching dataframe to be three columns with rate values
out_df_long <- out_df %>% 
    pivot_longer(cols = -time, names_to = "growth_rate",values_to= "population_size")

#Plot
ggplot(data = out_df_long, aes(x = time, y = population_size))+
  geom_line(aes(color = growth_rate), show.legend = FALSE) +
  theme_minimal () + labs(title="Population Growth Over Time", x = "Time", y = "Population Size") +
  theme(text = element_text(family = 'Optima-Bold'),axis.title = element_text(family = 'Optima'), legend.text = element_text(size = 10))
