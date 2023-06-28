####This script is to Generate parameters
##no need to change the content in this script
Parameters<-function(defaultpara,fixeddata, timeseries,projectspecs){  
  with(as.list(c(defaultpara,fixeddata, timeseries,projectspecs)), {
# Setting up parameters
defaultpara$value<-as.numeric(defaultpara$value)
fixeddata$value<-as.numeric(fixeddata$value)
timeseries$timestep<-as.numeric(timeseries$timestep)
timeseries$acts<-as.numeric(timeseries$acts)
timeseries$condoms<-as.numeric(timeseries$condoms)
timeseries$prep<-as.numeric(timeseries$prep)
timeseries$testing <-as.numeric(timeseries$testing )
timeseries$immigrants<-as.numeric(timeseries$immigrants)
timeseries$emigrants<-as.numeric(timeseries$emigrants)
timeseries$Deaths<-as.numeric(timeseries$Deaths)
projectspecs$betaoption<-as.character    (projectspecs$betaoption)
#summary(data2)
#summary(data1)

# Put parmaters in a list for beta
parameters_beta0<- c(S0=fixeddata$value[11],##number of susceptible people
                     N0=fixeddata$value[1], ##plhiv
                     I0=fixeddata$value[10], ##new infection
                     d0=fixeddata$value[2], ##proportion  diagnosed
                     tau0=fixeddata$value[3], ##proportion on ART
                     sigma0=fixeddata$value[4] ,##proportion suppressed
                     phi=defaultpara$value[1],  ##the reduction in transmission due to suppression 0.95?
                     omega0= fixeddata$value[5], ##PrEP coverage (FIG1 Hammoud/##FIG21 HIV Strategy 2016 ?C 2020)
                     epsilon_PrEP=defaultpara$value[2])  ###scott(0.86) efficacy of PrEP

#different functions for beta0
# beta option
# beta option 1: the number of infections caused by PLHIV
# beta option 2: the number of infections occurring in susceptible people
if (projectspecs$betaoption == "N") {
  
  beta0<- betaoption1(parameters = parameters_beta0)
} else if (projectspecs$value[5] == "S") {
  beta0<- betaoption2(parameters = parameters_beta0)
} else {beta0 <- 0}

# After obtain beta0, Put parmaters as vectors for HIVmodel
parameters<- c(beta0 =beta0,
               N0=fixeddata$value[1], ##plhiv
               I0=fixeddata$value[10], ##new infection
               d0=fixeddata$value[2], ##proportion  diagnosed
               tau0=fixeddata$value[3], ##proportion on ART
               sigma0=fixeddata$value[4] ,##proportion suppressed
               phi=defaultpara$value[1],  ##the reduction in transmission due to suppression 0.95?
               omega0= fixeddata$value[5], ##PrEP coverage (FIG1 Hammoud/##FIG21 HIV Strategy 2016 ?C 2020)
               epsilon_PrEP=defaultpara$value[2],  ###scott(0.86) efficacy of PrEP
               epsilon_condom=defaultpara$value[3],  ###scott
               chi_0=fixeddata$value[12], ##condom use FIG21 HIV Strategy 2016 ?C 2020 Quarter 4 & Annual 2020 Data Report
               alpha0=fixeddata$value[13],  ####Table1 Hammoud, total number of partners mean
               T= fixeddata$value[6])##FIG22a HIV Strategy 2016 ?C 2020 Quarter 4 & Annual 2020 Data Report
#the monthly data are extracted. (below are monthly data from Jan 2020 - Dec 2020)
temporal_data<-  as.data.frame(  cbind(alpha_t=c(timeseries$acts),###Table1 Hammoud
                                     chi_t=c(timeseries$condoms), ##FIG21 NSW HIV Strategy 2016 ?C 2020 Quarter 4 & Annual 2020 Data Report
                                     T_p= c(timeseries$testing),###testing
                                     ##FIG22a NSW HIV Strategy 2016 ?C 2020 Quarter 4 & Annual 2020 Data Report
                                     omega_p=c(timeseries$prep),###PREP
                                     IM=c(timeseries$immigrants),
                                     EM=c(timeseries$emigrants),
                                     Death=c(timeseries$Deaths),
                                     tau=c(timeseries$tau),
                                     sigma=c(timeseries$sigma))) ###migrants month 0-12


return(as.list(c(parameters, temporal_data))) 
  })
}

