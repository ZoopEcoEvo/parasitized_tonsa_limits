# Load in required packages
library(rmarkdown)
library(knitr)
library(tidyverse)
library(dabestr)

#Determine which scripts should be run
process_all_data = F #Runs data analysis 
process_study_limits = F #Processes raw data from other studies for inclusion in the meta-analysis
make_report = F #Runs project summary
knit_manuscript = T #Compiles manuscript draft

source(file = "Scripts/01_data_processing.R")

##################################
### Read in the PROCESSED data ###
##################################
full_data = read.csv(file = "Output/Data/full_data.csv")
ramp_record = read.csv(file = "Output/Data/ramp_record.csv")
temp_record = read.csv(file = "Output/Data/temp_record.csv")
meta_data = readxl::read_excel(path = "Data/literature/limit_data.xlsx")

if(process_study_limits == T){
  source(file = "Scripts/02_study_thermal_limits.R")
}

if(make_report == T){
  render(input = "Output/Reports/report.Rmd", #Input the path to your .Rmd file here
         #output_file = "report", #Name your file here if you want it to have a different name; leave off the .html, .md, etc. - it will add the correct one automatically
         output_format = "all")
}

##################################
### Read in the PROCESSED data ###
##################################

if(knit_manuscript == T){
  render(input = "Manuscript/Sasaki_et_al_2023.Rmd", #Input the path to your .Rmd file here
         output_file = "Sasaki_etal_2023_parasitism", #Name your file here; as it is, this line will create reports named with the date
                                                                  #NOTE: Any file with the dev_ prefix in the Drafts directory will be ignored. Remove "dev_" if you want to include draft files in the GitHub repo
         output_dir = "Output/Drafts/", #Set the path to the desired output directory here
         output_format = "all",
         clean = T)
}
