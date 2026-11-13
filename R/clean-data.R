library(tidyverse)

wildlife <- read_csv("data/wildlife_impacts.csv")

wildlife_clean <- wildlife %>%
  filter(!is.na(damage)) %>%
  mutate(
    damaged = if_else(damage == "N", "No", "Yes"),
    damaged = factor(damaged, levels = c("No", "Yes")),
    phase = str_to_lower(phase_of_flt),
    phase = case_when(
      phase == "take-off run" ~ "Take-off run",
      phase == "climb" ~ "Climb",
      phase == "descent" ~ "Descent",
      phase == "approach" ~ "Approach",
      phase == "landing roll" ~ "Landing roll"
    ),
    phase = factor(phase, levels = c("Take-off run", "Climb", "Descent", "Approach", "Landing roll")),
    height_bin = cut(
      height,
      breaks = c(-Inf, 0, 500, 1000, 3000, Inf),
      labels = c("0 ft", "1-500 ft", "501-1,000 ft", "1,001-3,000 ft", "Over 3,000 ft")
    ),
    bird_size = case_when(
      str_detect(species, "- small") ~ "Small",
      str_detect(species, "- medium") ~ "Medium",
      str_detect(species, "- large") ~ "Large"
    ),
    bird_size = factor(bird_size, levels = c("Small", "Medium", "Large")),
    time_of_day = factor(time_of_day, levels = c("Dawn", "Day", "Dusk", "Night")),
    operator = str_to_title(operator)
  )

write_rds(wildlife_clean, "data/wildlife_clean.rds")
