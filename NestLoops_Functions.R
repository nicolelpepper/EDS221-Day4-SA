# Nested Loops



# Create files
file_prefix <- c("temp","ph","salinity")
file_suffix <- c(1,2,3,4)


# Nested loops example
for (i in 1:length(file_prefix)) {  # iterate for the whole length in file_prefix (range 1-full length)
  for(j in 1:length(file_suffix)) { # iterate for the whole length in file_suffix (range 1-full length)
print(paste0(file_prefix[i],"_", file_suffix[j])) # use the paste function to print results
}
}

# Create a function
birddog_sum <- function(bird,dog) { #name function based and set data inputs to use
  pets <- bird + dog #operation that you want to be performed
  return(pets)
}

# Use the function
x <- birddog_sum( bird = 2, dog = 5) # create a variable, using function, set the data inputs
x

# Create another function
double_it <- function(x) {
  print(2*x)
}

# Use function 2 on value
double_it(4)

# Use function 2 on vector
double_it(1:4)


# Function to exclaim age
exclaim_age <- function(age){
  print(paste("I am", age, "years old!"))
}

# Exclaim age
exclaim_age(age = 10)


# Print vs return
find_max <- function(val1, val2) {
  if(val1>val2){
    return(val1)
  } else if (val2 > val1) {return(val2)}
}

find_max(val1 = 1, val2 = 5)


# Create vector
quarter_splits <- c(1.0, 1.1, 1.2, 1.1, 1.4, 1.5, 1.6, 1.4)


#Basic expression for iterator 
quarter_splits[i]+ quarter_splits[i+1] # says to the next one

# Create for loop
for (i in 1:length(quarter_splits)){
  print(quarter_splits[i]+ quarter_splits[i+1])
  }



# Create function with conditional
animal_ag_fun <- function(animal,age){ #set function parameters
  if (animal == "dog"){ # Conditional expression
    print(age*7)
  } else if (animal == "goat"){
    print(age*4.7)
  }
}

animal_ag_fun(animal = "dog", age = 8)
animal_ag_fun(animal = "cat", age = 7) # nothing comes back


# Example pulling info from a dataframe
# Load libraries
library(tidyverse)

dog_choice <- data.frame(dog_name = c("Khora", "Teddy","Waffle", "Banjo"), #create a data frame with multiple columns
                         food = c("everything", "salmon","pancakes","chicken")) 

my_sub <- dog_choice %>%
  filter(dog_name == "Khora") #You don't have to load dplyr dplyr::filter()

print(paste("My name is", my_sub$dog_name, "and I like to eat", my_sub$food))



dog_menu <- function(name){ # Name function and 
  my_sub <- dog_choice %>% # Create a variable to filter dog_choice
    filter(dog_name == name) # Subset/filter by name == (input) You don't have to load dplyr dplyr::filter()
                            # You could also do this with type R lingo dog_choice[dog_choice$dogname == name]
  
  print(paste("My name is", my_sub$dog_name, "and I like to eat", my_sub$food))
  
}
  
  

dog_menu("Khora")
dog_menu("Teddy")

  
# Create function with conditional + ERROR MESSAGES
animal_ag_fun <- function(animal,age){ 
  if (!animal %in% c("dog","goat")){
    stop("OOOOOPS that is not a valid input for animal")}
  if(is.numeric(age)== FALSE){
    stop("The age must be a number greater than 0")
  }
  if(age <= 0){
    stop("The age must be a number greater than 0")
  }
  if (animal == "dog"){ 
    print(age*7)
  } else if (animal == "goat"){
    print(age*4.7)
  }
}
  
  animal_ag_fun("cat",10)
  animal_ag_fun("dog",-1)
  
  
  # Create a function for calculating power at wind turbine w/ Warning Message
  calc_wind_power <- function(rho, radius, windspeed){
   if (windspeed > 130){
     warning("wow, that's fast! are you sure?")
   }
    if (rho > 1.225){
      warning("that air density is suspicious, are you sure?")
    }
    if(radius < 0){
      stop("rotor radius must be a positive value")
    }
     print(0.3*rho*pi*(radius^2)*(windspeed^3))
  }
  
  
calc_wind_power(2, 10, 50)
calc_wind_power(100, -10,100)  
  
  
  
  