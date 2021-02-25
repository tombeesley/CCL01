library(tidyverse)
library(janitor)

fnams <- list.files("CSV Data", "td", full.names = TRUE) # needed for reading data
subjs <- list.files("CSV Data", "td") # needed for identifying subject numbers

rawData <- NULL
for (subj in 1:length(fnams)) { 
  
  pData <- read_csv(fnams[subj], col_types = cols(), col_names = FALSE) # read the data from csv
  pData <- pData %>% 
    mutate(subj = substr(subjs[subj],1,str_length(subjs[subj])-7)) %>% 
    select(subj,everything())
  
  rawData <- rbind(rawData, pData) # combine data array with existing data
  
}

# tidy the dataframe
data <- rawData %>% 
  rename(trial = X1, patternID = X2, block = X3, 
         T_loc = X4, T_colour = X5, T_orient = X6,
         Y_colour = X7, Y_orient = X8, respKey = X9,
         accuracy = X10, RT = X11) %>%  # rename variables (add more) %>% 
  mutate(TT = round(patternID/10)%/%100, T_Y_cong = round(patternID/10)%%100) %>% 
  mutate(T_Y_cong = recode(T_Y_cong, "1" = "congruent", "2" = "incongruent", .default = "NA")) %>% 
  mutate(TT = recode(TT, "1" = "repeated", "2" = "random", "3" = "random")) %>% 
  mutate(phase = if_else(block<=48, 1, 2)) %>% 
  select(subj, phase, block, TT, T_Y_cong, Y_colour, accuracy, RT) %>% 
  filter(!subj %in% c(2,3,4,5,6,11)) # these Ps completed very few blocks

write_csv(data, "allData.csv")