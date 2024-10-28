# Scenario specifications

# This project specific function generates all the parameters for the scenarios
# to run in the model by adjusting the default parameters. 
# 
# These adjustments are hard coded manually by the use when setting up the 
# specific scenarios. 
# 
# For each scenario the user needs to ....

GenerateScenarios<-function(default_parameters) {

    scenarios <- list()
    
    # Default scenario - scenario 1
    scenarios[[1]] <- default_parameters
    scenarios[[1]]$name <- "withCovid"
    scenarios[[1]]$label <- "With COVID-19 impact"
    
    # Scenario 2 
    
    # Create scenario 2 parameter to change monthly data. 
    # All monthly data is set to the same values as the parameters at the initial time point.
    adjustedPara1<-default_parameters 
    adjustedPara1$alpha_t<-rep(1,times)# monthly change of sexual acts
    adjustedPara1$T_p<-rep(1,times)# monthly change of proportion of testing
    adjustedPara1$chi_t<-rep(1, times)# monthly change of condom use
    adjustedPara1$omega_p<-rep(1,times)# monthly change of PrEP use
    adjustedPara1$tau<-rep(adjustedPara1$tau0,times)# monthly change of Proportion of diagnosed on ART
    adjustedPara1$sigma<-rep(adjustedPara1$sigma0,times)# monthly change of Proportion of ART with virus suppressed
    adjustedPara1$IM<-rep(adjustedPara1$IM[1],times) #immigrants without COVID
    adjustedPara1$EM<-rep(adjustedPara1$EM[1],times) #emigrants without COVID
    adjustedPara1$Death<-rep(adjustedPara1$Death[1],times) #death rate without COVID
    
    
    scenarios[[2]]<- adjustedPara1
    
    scenarios[[2]]$name <- "withoutCovidandremain"
    # scenarios[[2]]$tag <- "withoutCovid"
    scenarios[[2]]$label <- "Without COVID-19 impact and remain"
    
    # Scenario 3 
    
    # Create scenario 3 parameter to change monthly data
    # condom use and PrEP use are set to the values from the predicted data.
    # All other monthly data is set to the same values as the parameters at the initial time point.
    
    prepScenario3File<- file.path(dataFolder,  "prep_estimate_predicted_use.csv")
    prepScenario3<-read.csv(prepScenario3File,fileEncoding = 'UTF-8-BOM')
    condomScenario3File<- file.path(dataFolder,  "condom_estimate_predicted_use.csv")
    condomScenario3<-read.csv(condomScenario3File,fileEncoding = 'UTF-8-BOM')
    adjustedPara2<-default_parameters 
    adjustedPara2$alpha_t<-rep(1,times)# monthly change of sexual acts
    adjustedPara2$T_p<-rep(1,times)# monthly change of proportion of testing
    adjustedPara2$chi_t<-condomScenario3$relativenumber # monthly change of condom use
    adjustedPara2$omega_p<-prepScenario3$relativenumber # monthly change of PrEP use
    adjustedPara2$tau<-rep(adjustedPara2$tau0,times)# monthly change of Proportion of diagnosed on ART
    adjustedPara2$sigma<-rep(adjustedPara2$sigma0,times)# monthly change of Proportion of ART with virus suppressed
    adjustedPara2$IM<-rep(adjustedPara2$IM[1],times) #immigrants without COVID
    adjustedPara2$EM<-rep(adjustedPara2$EM[1],times) #emigrants without COVID
    adjustedPara2$Death<-rep(adjustedPara2$Death[1],times) #death rate without COVID
    
    scenarios[[3]]<- adjustedPara2
    
    scenarios[[3]]$name <- "withoutCovidandprep"
    # scenarios[[3]]$tag <- "withoutCovid"
    scenarios[[3]]$label <- "Without COVID-19 impact and with prep promotion"
    
    # Template scenario
    
    
    return(scenarios)

}