library(tidyverse)
library(patchwork)

data <- read_csv("allData.csv")

basicStats <- data %>% 
  group_by(subj) %>% 
  summarise(mean_Acc = mean(accuracy), 
            mean_RT = mean(RT), 
            trial_Count = n())

# # accuracy boxplot (looks like subj 14 might be an outlier)
# accPlot <- basicStats %>% 
#   ggplot(aes(y = mean_Acc))+
#   geom_boxplot()+
#   geom_text(aes(x = 0, label = subj), hjust = 2) +
#   theme_classic()+
#   theme(axis.title.x=element_blank(),
#         axis.text.x=element_blank(),
#         axis.ticks.x=element_blank())
# 
# # rt boxplot
# rtPlot <- basicStats %>% 
#   ggplot(aes(y = mean_RT))+
#   geom_boxplot()+
#   geom_text(aes(x = 0, label = subj), hjust = 2) +
#   theme_classic()+
#   theme(axis.title.x=element_blank(),
#         axis.text.x=element_blank(),
#         axis.ticks.x=element_blank())
# 
# accPlot + rtPlot

data <- data %>% 
  mutate(TT = as_factor(TT),
         T_Y_cong = as_factor(T_Y_cong))

# output data for student
data_outlier_rem <- data %>%
  filter(accuracy == 1) %>% 
  group_by(subj) %>% 
  mutate(zRT = scale(RT)) %>% 
  filter(RT < 10000) %>% 
  filter(between(zRT, -3, 3))

# data_outlier_rem %>% 
#   group_by(subj, phase, TT, T_Y_cong) %>%
#   summarise(RT = mean(RT)) %>% 
#   pivot_wider(names_from = c(phase,TT, T_Y_cong), names_prefix = "phase", values_from = RT) %>% 
#   rename(phase1_repeated = phase1_repeated_NA, phase1_random = phase1_random_NA) %>% 
#   left_join(basicStats, by = "subj") %>% 
#   select(subj, mean_Acc, mean_RT, trial_Count, everything()) %>% 
#   write_csv("output_phase_Avgs.csv")
# 
data_outlier_rem %>%
  filter(!subj %in% c(14)) %>% # remove (potential) outliers
  filter(accuracy == 1) %>%
  group_by(block, TT) %>%
  summarise(RT = mean(RT)) %>%
  ggplot(aes(x = block, y = RT, group = TT)) +
  geom_line(aes(colour = TT)) +
  theme_classic()

data_outlier_rem %>% 
  filter(!subj %in% c(14)) %>% # remove (potential) outliers
  filter(phase == 2, accuracy == 1) %>%
  group_by(TT, T_Y_cong) %>%
  summarise(RT = mean(RT)) %>% 
  arrange(desc(TT)) %>% 
  ggplot(aes(x = TT, y = RT, fill = T_Y_cong))+
  geom_col(position = position_dodge2()) +
  theme_classic()+
  coord_cartesian(ylim = c(590,620))
  
data_outlier_rem %>% 
  filter(!subj %in% c(14)) %>% # remove (potential) outliers
  filter(phase == 2, accuracy == 1) %>%
  group_by(subj, TT) %>%
  summarise(RT = mean(RT)) %>% 
  t.test(RT~TT, data = ., paired = TRUE)

data_outlier_rem %>%
  filter(phase == 2, accuracy == 1) %>%
  group_by(subj, TT, T_Y_cong) %>%
  summarise(meanRT = mean(RT)) %>%
  pivot_wider(names_from = c(TT, T_Y_cong), values_from = meanRT) %>%
  write_csv("output_means_p2.csv")

# 
# # compare to David's output
# DL_output <- read.csv2("DL_forJASP.csv", sep = ";") %>% 
#   clean_names()
# 
# DL_output <- DL_output %>% 
#   mutate(subj = as.numeric(str_sub(participant, 12, str_length(participant)-4))) %>% 
#   select(subj, everything(), -participant) %>% 
#   as_tibble()
# 
# My_output <- data_outlier_rem %>% 
#   filter(phase == 2, accuracy == 1) %>% 
#   group_by(subj, TT, T_Y_cong) %>% 
#   summarise(meanRT = mean(RT)) %>% 
#   pivot_wider(names_from = c(TT, T_Y_cong), values_from = meanRT) %>% 
#   ungroup() %>% 
#   mutate(subj = as.numeric(subj))
# 
# allData <- left_join(DL_output, My_output, by = "subj") 
# 
# allData %>% 
#   transmute(diff_rep_c = repeated_congruent-repeated_cong, 
#             diff_rand_c = random_congruent-random_cong,
#             diff_rep_i = repeated_incongruent - repeated_inc,
#             diff_rand_i = random_incongruent - random_inc)
