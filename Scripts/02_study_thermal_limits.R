library(tidyverse)

### Fernandez-Loras et al. 2017
fernandez = readxl::read_excel(path = "Data/literature/study_datasets/Fernandez-Loras_2019.xls")

fernandez %>%  
  mutate("infected" = if_else(`Initial Bd load` > 0, "yes", "no"),
         CTmax = as.numeric(CTmax)) %>%  
  drop_na(CTmax) %>% 
  group_by(Population, `Live stage`, infected) %>%  
  summarize(mean = mean(CTmax), 
            sd = sd(CTmax),
            n = n())

### Hector et al. 2019
hector = read.csv(file = "Data/literature/study_datasets/Hector_2019.csv")

hector %>% 
  filter(ramping_rate == 0.04) %>% 
  drop_na(CTmax) %>% 
  group_by(host_gen, pathogen_gen) %>%
  summarise(mean = mean(CTmax),
            sd = sd(CTmax),
            n = n())


### Agosta et al. 2018
agosta = readxl::read_excel(path = "Data/literature/study_datasets/Agosta_2018.xlsx")

agosta %>%  
  filter(`Trophic Level/Species` == "Host/Manduca sexta") %>% 
  group_by(`Larval Instar`, `Parasitization Status`) %>%  
  summarise(mean = mean(Ctmax),
            sd = sd(Ctmax),
            n = n())


### This study 
full_data %>% 
  group_by(bopyrid) %>% 
  filter(ctmax > 36) %>% 
  summarise(mean = mean(ctmax), 
            sd = sd(ctmax), 
            n = n())





