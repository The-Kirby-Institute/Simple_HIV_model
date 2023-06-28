####This script is to Generate parmaters
# Put parmaters in a list for beta
parameters_beta0<- c(S0=data1$value[14],##number of susceptible people
                     N0=data1$value[1], ##plhiv
                     I0=data1$value[10], ##new infection
                     d0=data1$value[2], ##proportion  diagnosed
                     tau0=data1$value[3], ##proportion on ART
                     sigma0=data1$value[4] ,##proportion suppressed
                     phi=data1$value[11],  ##the reduction in transmission due to suppression 0.95?
                     omega0= data1$value[5], ##PrEP coverage (FIG1 Hammoud/##FIG21 HIV Strategy 2016 ¨C 2020)
                     epsilon_PrEP=data1$value[12])  ###scott(0.86) efficacy of PrEP


