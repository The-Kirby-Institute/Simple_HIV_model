####This script is for the betaoption1 function.

# beta option 1: beta0 is calculated based on the number of PWHIV (the number of infections caused by PLHIV)
betaoption1<-function(parameters){ 
  with(as.list(c(parameters)), {
  beta0<- I0/(N0*(1-d0*tau0*sigma0*phi)*(1-omega0*epsilon_PrEP))
  return(beta0) 
  })
}

# beta option 2: beta0 is calculated based on the number of susceptible people (the number of infections occurring in susceptible people)
betaoption2<-function(parameters){ 
  with(as.list(c(parameters)), {
    beta0<- I0/(S0*(1-d0*tau0*sigma0*phi)*(1-omega0*epsilon_PrEP))
    return(beta0) 
  })
}