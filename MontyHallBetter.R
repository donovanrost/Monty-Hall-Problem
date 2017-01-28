doors <- c("1","2","3")
set_size <- 5 #The number of time this model runs the trials
trials  <-  c(1, 10, 100, 500, 1000) #Vector with predefined values for number of trials
trials_index <- 1 #Used to indicate position for trials vector


#series of objects for storing results for each size of trials
trial_results_1 <- c() 
trial_results_10 <- c()
trial_results_100 <- c()
trial_results_500 <- c()
trial_results_1000 <- c()


for (i in 1:set_size){

  while(trials_index <= length(trials)){
    for(k in 1:trials[trials_index]){
      
      #assigns the winning door
      win <-sample(doors)[1]
      
      #contestant chooses a random door
      contestant <- sample(doors)[1] 
      
      #contestant is "shown" a door which is not the winning door...
      #...and not the door chosen by the conestant...
      #...This door is removed as an option if/when the contestant chooses
      #...to change doors.
      show <- sample(doors[which(doors != win & doors != contestant)])[1]
      
      #Contestant changes doors
      change <- doors[which(doors !=contestant & doors != show)]
    
  #sends the results to appropriate data objects
      if(contestant==win){
        switch(trials_index,
          {trial_results_1 <- c(trial_results_1, "staywin")},
          {trial_results_10 <- c(trial_results_10, "staywin")},
          {trial_results_100 <- c(trial_results_100, "staywin")},
          {trial_results_500 <- c(trial_results_500, "staywin")},
          {trial_results_1000 <- c(trial_results_1000, "staywin")})
      }     
    
      if(change==win){
        switch(trials_index, 
          {trial_results_1 <- c(trial_results_1, "changewin")},
          {trial_results_10 <- c(trial_results_10, "changewin")},
          {trial_results_100 <- c(trial_results_100, "changewin")},
          {trial_results_500 <- c(trial_results_500, "changewin")},
          {trial_results_1000 <- c(trial_results_1000, "changewin")})
      }
    }
    trials_index <- trials_index + 1  
  }
  trials_index <- 1
  #when the loop finishes, adds one to the trials_index variable
  #to move to the next number of trials
  cat("\n Running set number ", i)
} 

length(which(trial_results_1 == "changewin"))
length(which(trial_results_1 == "staywin"))

length(which(trial_results_10 == "changewin"))
length(which(trial_results_10 == "staywin"))

length(which(trial_results_100 == "changewin"))
length(which(trial_results_100 == "staywin"))

length(which(trial_results_500 == "changewin"))
length(which(trial_results_500 == "staywin"))

length(which(trial_results_1000 == "changewin"))
length(which(trial_results_1000 == "staywin"))

----------------------------------------------------------------------

