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


## `0_Setupmodel.Rmd`:This script is designed to create a new project for the Simple HIV model.
The example used is project investigating the impact of COVID-19 (COVID-19impact).
The script creates a project directory in the "projects" directory and relevant sub-directories and copies csv files in "templates" directory to data folder (sub-folder).

3 csv files included in this sub-folder. 
      *    `project_specs.csv`: For specifying project name, starting year, number of time-step, step size, and beta option.
      *    `hiv_time_series_data.csv`: For specifying time series parameters.
      *    `hiv_fixed_data.csv`: For specifying fixed parameters.


## `1_input and run model.Rmd`: This script is designed to input project-specific data and run the SIMPLE HIV model. The script allows users to configure the model for different scenarios and generate relevant outputs such as infection results, cumulative infections, diagnoses, and more. The example used here is for the "COVID-19impact" project.

### How to Use:

#### 1. Initialization:
- Set the working directory and ensure all required libraries and functions are loaded. This step also clears the workspace to prevent any conflicts.
- The working directory should contain project folders, data files, and R code files required for the simulation.

#### 2. User Inputs:
- Modify the `selectedproject` variable to select the project for which you want to run the model.
- Ensure that the project folder, data folder, and output folder paths are correctly set.

#### 3. Project Data:
The script will load the following .csv files from the project's `data` sub-folder:
- `project_specs.csv`: Defines project specifications such as start year, number of time-steps, and beta options.
- `hiv_time_series_data.csv`: Contains time-series data for parameters like condom use, testing rates, and more.
- `hiv_fixed_data.csv`: Holds fixed parameter values for the model.
- `prep_estimate_predicted_use.csv` and `condom_estimate_predicted_use.csv`: Scenario-specific data for PrEP use and condom use.

#### 4. Scenarios:
The following scenarios are generated and simulated:
- **With COVID-19 impact**: It was shown as "COVID-19 scenario" in the paper, where all changes in monthly parameter values occur and reflect the impact of COVID-19.
- **Without COVID-19 impact**: It was shown as "no COVID-19 scenario" in the paper, a counterfactual scenario where the input parameters remained at their value in December 2019 and corresponded to pre-COVID-19 values.
- **Without COVID-19 impact and with PrEP promotion**: It was shown as "no COVID-19 plus PrEP scenario" in the paper, an alternative counterfactual no COVID-19 scenario where PrEP scale-up and the corresponding decrease in condom use continued during 2020-2020 following the pre-2019 trends, with the other parameters remaining at their December 2019 value. 

#### 5. Running the Model:
- The script sets up multiple scenarios based on user-defined parameter sets. Each scenario represents a different possible outcome, for example, with or without the impact of COVID-19 or with PrEP promotion.
- For each scenario, the model simulates the transmission of HIV over the specified time period and outputs results such as the number of new infections, the total number of people living with HIV (PLHIV), and the number of new diagnoses.

#### 6. Simulation with Uncertainty:
The script allows for 1000 simulations using sampled parameter sets to assess uncertainty. Percentile Intervals (PIs) are calculated based on these simulations.

#### 7. Saving Results:
The final output results are saved in the project’s `output` folder as .csv files. The script checks if a file already exists before saving to prevent overwriting previous results.

#### 8. Output Data:
The script generates several output datasets, which are saved in CSV format in the project’s `output` folder. Key outputs include:
- **Infection Results**: The dataset contains comprehensive results of the project for each time-step and scenario, including the number of new HIV infections, the total number of PLHIV, the proportion of diagnosed, the number of new diagnoses, cumulative numbers of new HIV infections, cumulative numbers of new diagnoses, and cumulative numbers of new HIV infections and new diagnoses for each year.
- **Infection Results with 1000 simulations**: The dataset contains results across 1000 simulations for each time-step and scenario. It includes the number of new HIV infections, the total number of PLHIV, the proportion of diagnosed, the number of new diagnoses, cumulative numbers of new HIV infections, cumulative numbers of new diagnoses, and cumulative numbers of new HIV infections and new diagnoses for each year.
- **Monthly Results with 95% PIs**: The dataset provides monthly results for new HIV infections along with 95% PIs to illustrate the uncertainty in the estimates.
- **Summarised Results with 95% PIs**: The dataset summarizes key outcomes for each scenario, including the cumulative numbers of new HIV infections and diagnoses, as well as the total number of PLHIV at the end of the simulation period, all presented with 95% PIs.
- **Yearly Cumulative Results with 95% PIs**: The dataset shows yearly cumulative numbers of new HIV infections and diagnoses, with 95% PIs provided for each scenario at the end of the simulation period.


## `2_Generate_figures.Rmd`: This script is to generate figures for Simple HIV model.

This script is designed to generate figures based on the results from the Simple HIV model. It creates visualizations that help illustrate key outputs such as the number of new HIV infections and annual diagnoses. The script leverages the ggplot2 package and related libraries to create these figures.

### How to Use:

#### 1. Prerequisites:
Before running this script, ensure the following steps are complete:
- You have successfully run the script `1_input and run model.Rmd` to generate the necessary results.
- All required data files are available in the correct folders, including `infectionresults`, `Monthly Results with 95% PIs`, and `Yearly Cumulative Results with 95% PIs`.

#### 2. Generating Figures:
The script generates several figures based on the simulation results:

##### a. **New HIV Infections Over Time**:
- This section generates a figure showing the number of new HIV infections over time for different scenarios (e.g., with and without COVID-19 impact, and with PrEP promotion).
- **Figure Characteristics**:
  - Smooth lines with shaded confidence intervals (bands) represent 95% percentile intervals (PIs).
  - Scenarios are color-coded for clarity.
- The figure is saved as `newinfectionfig_sim_band_date.png`. "date" here is the date we saved the figure.

##### b. **Annual Diagnoses with Model Estimates vs. Surveillance Data**:
- This figure compares the annual number of diagnoses from the model with real-world HIV diagnoses from surveillance reports.
- **Figure Characteristics**:
  - Bar plots show the modeled diagnoses and actual surveillance data for 2020, 2021, and 2022.
  - Error bars represent the 95% PIs for the model predictions.
- The figure is saved as `diagnosis_peryear_figdate.png`. "date" here is the date we saved the figure.

#### 3. Saving Figures:
The script includes a `SaveFigure` function that ensures figures are saved in the designated folder with the correct file name. If the file already exists, it will not be overwritten.


# Disclaimer
The model has been made publicly available for transparency and replication purposes and in the hope it will be useful. We take no responsibility for results generated with the model and their interpretation but are happy to assist with its use and application."



