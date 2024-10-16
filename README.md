# Simple_HIV_model

This project contains the code for a model of HIV transmission that can be used to investigate the effect of monthly changes in sexual partners, condom use, HIV testing, PrEP use, and migration on HIV transmission while also capturing the key stages of the HIV cascade. 

Model developer, coder and maintainer of this repository: [Rongxing Weng](https://github.com/RongxingW)

ORCiD ID: [0000-0003-1792-2186](https://orcid.org/0000-0003-1792-2186) 

Affiliation: The Kirby Institute, UNSW Sydney, NSW, Australia


# Installation
You need the following software & associated packages to run this model:

* R, a free statistical program to run and analyze the model results using the provided scripts.
* (Optional) RStudio, a useful user interface for the R program.
* R packages associated with the Simple HIV model: 

    `dplyr_1.1.4`, `ggplot2_3.4.4`, `gridExtra_2.3`, `RColorBrewer_1.1.3`, `stringr_1.5.1`, `tidyverse_2.0.0`,
 
    `cowplot_1.1.3` 
    
* Clone or download the code from this repository into a convenient location on your computer.

# Project structure 
```bash

├── projects/              
│   ├── COVID-19impact/  # specific project name         
│       ├── data         # model input data
│           ├── project_specs.csv
│           ├── hiv_time_series_data.csv
│           ├── hiv_fixed_data.csv
│           ├── prep_estimate_predicted_use.csv
│           ├── condom_estimate_predicted_use.csv
│           └── scenario3_IM_EM_DEATH.csv
│       ├── figures      # model outputs: figures
│       ├── output       # model outputs: data   
│       └── GenerateScenarios.R 
├── code/
│   ├── BetaOption.R     # function for beta selection in the model
│   ├── Parameters.R     # function for data wrangling 
│   └── SimpleHiv.R      # function for model simulation
├── templates/
│   ├── project_specs.csv
│   ├── hiv_time_series_data.csv
│   └── hiv_fixed_data.csv
├── 0_Setupmodel.Rmd
├── 1_input and run model.Rmd
└── 2_Generate_figures.Rmd

```

# Set up and run the Simple HIV model

All the project files are stored in the main directory and 4 main sub-directories. This main README file describes the overall project. 

The project code is written in `R` version 4.3.2 as R or R markdown scripts with `Rstudio` version 2024.04.2+764. 

All model inputs stored as either `.csv` and outputs stored as `.csv` files.

`0_Setupmodel.Rmd`:This script is to create a new project for the simple HIV model.
The example used is project investigating the impact of COVID-19 (COVID-19impact).
The script creates a project directory in the "projects" directory and relevant sub-directories and copies csv files in "templates" directory to data folder (sub-folder).

3 csv files included in this sub-folder. 
      *    `project_specs.csv`: For specifying project name, starting year, number of time-step, step size, and beta option.
      *    `hiv_time_series_data.csv`: For specifying time series parameters.
      *    `hiv_fixed_data.csv`: For specifying fixed parameters.

`1_input and run model.Rmd`: This script is to input all the data and run the Simple HIV model for a specified
project.

`2_Generate_figures.Rmd`: This script is to generate figures for Simple HIV model.

Note as these are scripts, not functions, care should be taken to ensure the project specifications are correct before running a script especially after updates have been pulled from the repository.

# Disclaimer
The model has been made publicly available for transparency and replication purposes and in the hope it will be useful. We take no responsibility for results generated with the model and their interpretation but are happy to assist with its use and application."



