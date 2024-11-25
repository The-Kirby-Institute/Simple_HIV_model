# Simple HIV Model

This project contains the code for a simple model of HIV transmission that can be used to investigate the effect of dynamic changes in sexual partners, condom use, HIV testing, PrEP use, and migration on HIV transmission while also capturing the key stages of the HIV cascade.

*DOI*:

This mode builds on previously developed models described in the following papers:

- SL Kelly, DP Wilson. HIV Cascade Monitoring and Simple Modeling Reveal Potential for Reductions in HIV Incidence. JAIDS 2015; 69: 257–63.
- N Scott, M Stoové, SL Kelly, DP Wilson, ME Hellard. Achieving 90-90-90 HIV Targets Will Not Be Enough to Achieve the HIV Incidence Reduction Target in Australia. CID 2018; 66: 1019–23.
- RT Gray, J Watson, AJ Cogle, DE Smith, JF Hoy, LA Bastian, R Finlayson, et al. Funding Antiretroviral Treatment for HIV-Positive Temporary Residents in Australia Prevents Transmission and Is Inexpensive. Sexual Health 2017: 15; 10.1071/SH16237.
  - Code available at: [ART_For_Temporary_Residents](https://github.com/leftygray/ART_For_Temporary_Residents).
- RT Gray. Impact of Increased Antiretroviral Therapy Use during the Treatment as Prevention Era in Australia. Sexual Health 2023: 23; 10.1071/SH23088.
  - Codes available at: [Impact_TasP_Australia](https://github.com/The-Kirby-Institute/Impact_TasP_Australia).

## Aims

The aim of the Simple HIV model is to estimate the number of new HIV infections and diagnoses, as well as the total number of people living with HIV in each timestep. The model can estimate the impact of time-varying factors on the HIV epidemic, particularly in response to large-scale public health policies or interventions.

## Maintainers and developers

1. [Rongxing Weng](https://github.com/RongxingW); ORCiD ID: [0000-0003-1792-2186](https://orcid.org/0000-0003-1792-2186)
2. [Richard Gray](https://github.com/leftygray); ORCiD ID: [0000-0002-2885-0483](https://orcid.org/0000-0002-2885-0483)

Affiliation: The Kirby Institute, UNSW Sydney, NSW, Australia

For any inquiries, please contact Rweng@kirby.unsw.edu.au or Rgray@kirby.unsw.edu.au or flag an issue. The Simple HIV Model will be updated as required to correct issues or to improve or add features. Please check for updated versions periodically.

## Project structure

The Simple HIV Model is designed to be flexible and able to be used on multiple projects. The structure of the overall project is shown below with an example project looking at the impact of COVID-19 on teh HIV epidemic in Australia.

```bash

├── projects/          
│   ├── COVID-19impact/  # specific project name     
│       ├── data         # model input data
│           ├── project_specs.csv
│           ├── hiv_time_series_data.csv
│           ├── hiv_fixed_data.csv
│           ├── prep_estimate_predicted_use.csv
│           └── condom_estimate_predicted_use.csv
│       ├── figures      # model outputs: figures
│       ├── output       # model outputs: data   
│       ├── README.md
│       └── GenerateScenarios.R 
├── code/
│   ├── BetaOption.R     # function for beta selection in the model
│   ├── Parameters.R     # function for data wrangling 
│   └── SimpleHiv.R      # function for model simulation
├── templates/           # These template files are pre-filled with example data from the `COVID-19impact` project.
│   ├── project_specs.csv
│   ├── hiv_time_series_data.csv
│   ├── hiv_fixed_data.csv
│   └── GenerateScenarios.R 
├── 0_Setupmodel.Rmd
├── 1_input and run model.Rmd
├── 2_Generate_figures.Rmd
├── Project_Scripts_Guide.docx
├── LICENSE
└── README.md

```

The model code is primarily contained in three Rmarkdown scripts `0_Setupmodel.Rmd`, `1_input and run model.Rmd`, and `2_Generate_figures.Rmd`.
Individual applications are stored in the `projects/` folder. The `code/` folder contains the functions and scripts used by the three main Rmarkdown scripts.
The `templates/` folder provides template input .csv files that need to be filled out for a specific project for the model to run and `GenerateScenarios.R` function that needs to be customized for each specific project. These template files are pre-filled with example data from the `COVID-19impact` project.
Code, documents, and other materials for each individual project using the Simple HIV Model are stored in specific folders within the `projects/` folder.
Each project has its own `README.Rmd` file and data for scenarios. For example, `prep_estimate_predicted_use.csv` and `condom_estimate_predicted_use.csv` are used to generate results for "no COVID-19 plus PrEP scenario".

## Using the model

To use the model clone or download the code from this repository into a convenient location on your computer. You will need the following software & associated packages to run this model:

1. R, a free statistical program to run and analyze the model results using the provided scripts. (Optional) RStudio, a useful user interface for the R program.
2. R packages associated with the Simple HIV model:

   `dplyr_1.1.4`, `ggplot2_3.4.4`, `gridExtra_2.3`, `RColorBrewer_1.1.3`, `stringr_1.5.1`, `tidyverse_2.0.0`, `cowplot_1.1.3`

Documentation is provided in `Project_Scripts_Guide.docx. `This file provides detailed instructions on how to use every script for the overall project.

## Publication

The following publication is associated with this project and used code in this repository to generate the results and figures.

* R. Weng, J. A. Kwon, M. Hammoud, N. Scott, S. McGregor, R. T. Gray. Evaluating the impact of COVID-19 on the HIV epidemic among men who have sex with men in Australia**: A modelling study.

## Disclaimer

The model has been made publicly available for transparency and replication purposes and in the hope it will be useful. We take no responsibility for results generated with the model and their interpretation but are happy to assist with its use and application.
