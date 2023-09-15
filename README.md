# Data and Code: Parasitism does not reduce thermal limits in the intermediate host of a Bopyrid isopod  

Matthew Sasaki<sup>1,2</sup>, Charles Woods<sup>2</sup>, Hans G. Dam<sup>2</sup> 	

1. Department of Biology, University of Vermont   
2. Department of Marine Sciences, University of Connecticut
   
*Corresponding author: matthew.sasaki@uvm.edu   


<a href="https://doi.org/10.1016/j.jtherbio.2023.103712"><img src="https://img.shields.io/badge/Publication%20Here-Here?style=for-the-badge&labelColor=grey&color=blue"/></a>    <a href="https://doi.org/10.1101/2023.03.31.535176"><img src="https://img.shields.io/badge/Preprint%20Here-Here?style=for-the-badge&labelColor=grey&color=red"/></a>

This study examines the effects of parasitism on critical thermal maxima of host organisms, combining empirical results with a meta-analytic examination of previous studies. Experiments examined the upper thermal limits of the copepod *Acartia tonsa* infested with larvae of a parasitic isopod in the family Bopyridae using a dynamic ramping assay. As part of this, we developed a novel, highly portable device for measuring CTmax of small organisms.    

Animals were collected from a site in Key Largo, Florida (25.283775N, -80.330165W) on February 26th 2023. Thermal limit data was collected from February 27th to March 1st 2023. The meta-analysis was performed between March 6th and March 10th 2023. Thermal limit measurements and the meta-analytic data set were collected and analyzed by Matthew Sasaki. The design and construction of the Arduino temperature logger was led by Charles Woods.  

## Directory Structure 
The root directory contains the README and Licensing files, along with a .Rproj file and four sub-directories: Data, Manuscript, Output, and Scripts.  

-   `Data/` contains the raw data used in this analysis.  

-   `Manuscript/` contains the R Markdown file, templates, and bibliography used to produce the manuscript draft. 

-   `Output/` contains the various products of the project (processed data, figures, knit reports, and a PDF copy of the manuscript. Note, the `Reports/` directory contains the R Markdown file used to generate the figures used in the manuscript.  

-   `Scripts/` contains three R scripts. 
    -   `01_data_processing.R` is used to process the raw data. The primary component of this analysis is the estimation of thermal limits from a continuous temperature record.
    -   `02_study_thermal_limits` is used to re-analyze raw data from previously published studies in order to generate the effect sizes for the meta-analytic component of this project.
    -   `03_controller.R` is use to control the project workflow. Through this script, you can choose to process the experimental and meta-analytic data, make the figures, or knit the manuscript. This script should be used rather than running isolated fragments individually. 
 

## Data Description 	

The `Data/` directory contains three sub-directories, each containing a separate type of data.   	

The `Literature/` directory contains the Web of Science search results that were screened for inclusion in the meta-analysis. Also included are the extracted thermal limits from the studies included in the meta-analysis, and the raw data from the studies that provided this resource.  

The `temperature_data/` directory contains CSV files with the continuous temperature record for each run. Files are named as follows: `Year_Month_Day_temp.CSV`. Each of these files contains five columns: the internal date and time recorded by the device, and separate temperature measurements from the three different sensors.   

The time_data directory contains the experimental observations of when each individual reached its thermal maximum. Each .xlsx file is named following the same Year_Month_Day convention as the time data, and contains ten columns:     

  -   *run_date and start_time* - When the CTmax assay was performed	  	
  -   *collection_date*	- When the copepods were originally collected
  -   *acc_time* - How long the animals had spent acclimating in lab (in generations). The number of days spent in lab can be calculated from the run_date and collection_date variables  
  -   *acc_temp* - The acclimation temperature in °C experienced directly prior to the CTmax assay  
  -   *species* - The host species thermal limits were measured for  
  -   *bopyrid* - Indicates whether the individual bore an isopod larvae (yes - present; no - absent)  	  	
  -   *tube* - Which tube the individual was placed in for the duration of the experiment	  	
  -   *minute and second* - The time during the assay at which the indiviual reached its thermal limit, broken down into minute and second components	  	
    
## Workflow

Critical Thermal Maxima (CTmax) values are estimated from the recorded time data (when the individual ceased responding to stimuli during the experiment, recorded in minutes and seconds) using the continuous temperature record. Each measurement is associated with an uncertainty window, defined as the number of tubes remaining with responsive copepods multiplied by five seconds (how long it takes to check the individual for responsiveness). CTmax is estimated as the average temperature across all three of the temperature sensors during the uncertainty window.

The workflow is operated via the 03_controller.R script in the Scripts directory. It is not recommended that you run analyses or knit documents from the files themselves as the file paths are internally set and may not be correct otherwise. At the top of this script, you are able to indicate whether: 
  1) The time and temperature data should be processed to estimate CTmax values (process_all_data; when set to F, only new sets of temperature and time data will be analyzed). 
  2) The raw data from previous studies should be analyzed to produce mean, standard deviation, and sample size values for use in the meta-analysis.
  3) The summary file (located in the Output/Reports directory) should be knit. This markdown file will generate the figures used in the manuscript, as well as an HTML and a GitHub flavored markdown document. 
  4) The manuscript file (located in the Manuscripts directory) should be knit. This markdown file will produce a formatted PDF version of the manuscript that can be posted on a preprint server along with a word document that can be sent to co-authors. 


## Versioning   
R version 4.2.2 (2022-10-31)    
Platform: x86_64-apple-darwin17.0 (64-bit)    
Running under: macOS Ventura 13.2.1   

attached base packages:
stats; graphics; grDevices; utils; datasets; methods; base 

other attached packages:
dabestr_0.3.0; magrittr_2.0.3; forcats_0.5.2; stringr_1.5.0; dplyr_1.0.10; purrr_1.0.0; readr_2.1.3;
tidyr_1.2.1; tibble_3.1.8; ggplot2_3.4.0; tidyverse_1.3.2; knitr_1.41; rmarkdown_2.20

loaded via a namespace (and not attached):
tidyselect_1.2.0xfun_0.36; haven_2.5.1; gargle_1.2.1; colorspace_2.0-3; 
vctrs_0.5.1; generics_0.1.3; htmltools_0.5.4; yaml_2.3.6; utf8_1.2.2; 
rlang_1.0.6; pillar_1.8.1; glue_1.6.2; withr_2.5.0; DBI_1.1.3;
dbplyr_2.2.1; modelr_0.1.10; readxl_1.4.1; lifecycle_1.0.3; munsell_0.5.0;
gtable_0.3.1; cellranger_1.1.0; rvest_1.0.3; evaluate_0.19; tzdb_0.3.0; 
fastmap_1.1.0; fansi_1.0.3; broom_1.0.2; scales_1.2.1; backports_1.4.1;
googlesheets4_1.0.1; jsonlite_1.8.4; fs_1.5.2; hms_1.1.2; digest_0.6.31;
stringi_1.7.8; grid_4.2.2; cli_3.5.0; tools_4.2.2; crayon_1.5.2; 
pkgconfig_2.0.3; ellipsis_0.3.2; xml2_1.3.3; reprex_2.0.2; googledrive_2.0.0;
lubridate_1.9.0; timechange_0.1.1; assertthat_0.2.1; httr_1.4.4; rstudioapi_0.14;
boot_1.3-28; R6_2.5.1; compiler_4.2.2


## Funding

Unless otherwise noted, the data provided here is available under the Creative Commons Attribution 4.0 International License, and the code is available under the MIT License.

Data collection was supported by NSF OCE1947965, NSF OCE2205848, and a University of Connecticut Postdoc Seed Award. 
