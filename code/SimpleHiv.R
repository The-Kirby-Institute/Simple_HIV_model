####This script is for the SIMPLEHIV model.
#'The model aims to describe the effect of monthly changes in sexual 
#'partnerships, condom use, HIV testing, PrEP use on HIV transmission. 
#'It captures the key stages of the HIV cascade


######Basic equation##########
#'Estimate number of new infections due to transmission from PWHIV to susceptible sexual partners:
#'I=N汕(1-d而考??)(1-肋??_p),
#'were N is the number of PWHIV in the population, 汕 is the transmission 
#'probability for an unsuppressed PWHIV to a susceptible partner not on PrEP, 
#'d is the proportion of PWHIV diagnosed, 而(tau) is the proportion diagnosed on ART, 
#'考(sigma) is the proportion on ART with suppressed virus (< 200 copies per ml), 
#'??(phi) is the reduction in transmission due to suppression (??＞0.95), 
#'肋(omega) is the proportion of susceptible GBMSM on PrEP, 
#'and ??_p(epsilon_PrEP) is the efficacy of PrEP in preventing infection.

######Basic equation with timesteps##########
#'This equation can be turned into a time varying equation and solved use the 
#'following recurrence equation for each time-step t:
#' N(t+1)= N(t)+I(t)+M(t), 
#' #'M(t)=IM(t)-EM(t) the number of immigrate - the number of emigrate
#' IM(t) is the number of GBMSM who enter Australia already
#' infected with HIV (which will essentially stop due to border closures)
#' EM(t) is the number of GBMSM who leave Australia already
#' infected with HIV (which will essentially stop due to border closures)
  
######The change of Beta(t)#######
#'Effect of changing condom use and sexual partners
#'Relative change in incidence if condom use changes to c_t(chi_t) 
#'compared to a basic level of c_0(chi_0)
#' (1-??c_t)/(1-??c_0 ). ??(epsilon_condom) is the efficacy of condom use in preventing infection
#' Relative change in incidence if the number of sexual acts in a time-step changes
#' to a_t(alpha_t) compared to a basic level of a_0(alpha0): a_t/a_0.
#'The number of acts is given by number of partnerships multiplied by the number of acts per partnership. 
#'Combining these relative changes means we can write:
#'  汕(t)= 汕(0)*(alpha_t/alpha0)((1-epsilon_condom*chi_t*chi_0)/(1-epsilon_condom*chi_0)).

######The change in testing rates######
#'The proportion diagnosed is affected over time by the change in testing rates 
#'(which are affected by external factors such as COVID restrictions) if the proportion of GBMSM testing 
#'during time-step t is T(t) the number of PWHIV diagnosed at the next time step is: 
#'  N(t+1) *d(t+1) = N(t)* d(t)+I(t) *T(t)+(1-d(t) ) *N(t)* T(t),
#'or 
#'d(t+1 )=  (N(t)* d(t)+[I(t)+(1-d(t) )* N(t) ] *T(t))/(N(t)+I(t)+M(t) ).
#'T(t) =T*T_p 
#'T is the basic testing rates and T_p is the relative changes of testing rates with timesteps

SimpleHIV<-function(times,state, parameters){  
  with(as.list(c(state, parameters)), {
       for(i in 1:times)
  {# The equations
    I[i]=N[i]*beta0*
      (alpha_t[i]/alpha0)*
      ((1-epsilon_condom*chi_t[i]*chi_0)/(1-epsilon_condom*chi_0))*
      ((1-d[i]*tau[i]*sigma[i]*phi)*(1-omega0*omega_p[i]*epsilon_PrEP))
    N[i+1]=(N[i]+I[i]+IM[i]-EM[i])*(1-Death[i])
    d[i+1]=(N[i]*d[i]+(I[i] +(1-d[i])*N[i])*T*T_p[i])/((N[i]+I[i]+IM[i]-EM[i])*(1-Death[i]))}
    returnedList<-list(I, N)
    names(returnedList) <- c("I", "N")
    return(returnedList) 
    })
}