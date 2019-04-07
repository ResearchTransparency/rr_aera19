## ----setup, include = FALSE----------------------------------------------
library(tidyverse)


## ----install-gt, --------------------------------------------
remotes::install_github("rstudio/gt")


## ----flying--------------------------------------------------------------
library(fivethirtyeight)
flying


## ----flying2-------------------------------------------------------------
smry <- flying %>% 
  count(gender, age, recline_frequency) %>% 
  filter(!is.na(age),
         !is.na(recline_frequency)) %>% 
  spread(age, n) 

smry



## ----gt1-eval, ----------------------------------------------
library(gt)
smry %>% 
  gt()



## ----gt2-eval, ----------------------------------------------
smry %>% 
  group_by(gender) %>% 
  gt()



## ----gt3-eval, ----------------------------------------------
smry %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`))



## ----gt4-eval, ----------------------------------------------
smry %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`)) %>% 
  cols_label(recline_frequency = "Recline")



## ----gt4-aligned-eval, --------------------------------------
smry %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`)) %>% 
  cols_label(recline_frequency = "Recline") %>% 
  cols_align(align = "left", columns = vars(recline_frequency))


## ----gt4-title-eval, ----------------------------------------
smry %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`)) %>% 
  cols_label(recline_frequency = "Recline") %>% 
  cols_align(align = "left", columns = vars(recline_frequency)) %>% 
  tab_header(title = "Airline Passengers",
             subtitle = "Leg space is limited, what do you do?")


## ----gt5-eval, ----------------------------------------------
smry %>% 
  mutate_at(vars(`18-29`, `30-44`, `45-60`, `> 60`), ~./100) %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`)) %>% 
  fmt_percent(vars(`18-29`, `30-44`, `45-60`, `> 60`),
              decimals = 0) %>% 
  cols_label(recline_frequency = "Recline") %>% 
  cols_align(align = "left", columns = vars(recline_frequency)) %>% 
  tab_header(title = "Airline Passengers",
             subtitle = "Leg space is limited, what do you do?")


## ----gt6-eval, ----------------------------------------------
smry %>% 
  mutate_at(vars(`18-29`, `30-44`, `45-60`, `> 60`), ~./100) %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`)) %>% 
  fmt_percent(vars(`18-29`, `30-44`, `45-60`, `> 60`),
              decimals = 0) %>% 
  cols_label(recline_frequency = "Recline") %>% 
  cols_align(align = "left", columns = vars(recline_frequency)) %>% 
  tab_header(title = "Airline Passengers",
             subtitle = "Leg space is limited, what do you do?") %>% 
  tab_source_note(source_note = md("Data from [fivethirtyeight](https://fivethirtyeight.com/features/airplane-etiquette-recline-seat/)"))



## ----gt7-eval, ----------------------------------------------
smry %>% 
  mutate_at(vars(`18-29`, `30-44`, `45-60`, `> 60`), ~./100) %>% 
  group_by(gender) %>% 
  gt() %>% 
  tab_spanner(label = "Age Range",
              columns = vars(`18-29`, `30-44`, `45-60`, `> 60`)) %>% 
  fmt_percent(vars(`18-29`, `30-44`, `45-60`, `> 60`),
              decimals = 0) %>% 
  cols_label(recline_frequency = "Recline") %>% 
  data_color(vars(`18-29`, `30-44`, `45-60`, `> 60`),
             colors = scales::col_numeric(palette = c(c("#FFFFFF", "#FF0000")), domain = NULL)) %>% 
  cols_align(align = "left", columns = vars(recline_frequency)) %>% 
  tab_header(title = "Airline Passengers",
             subtitle = "Leg space is limited, what do you do?") %>% 
  tab_source_note(source_note = md("Data from [fivethirtyeight](https://fivethirtyeight.com/features/airplane-etiquette-recline-seat/)"))


## ----install, -----------------------------------------------
devtools::install_github("crsh/papaja")


## ----inTextCitesTable --------------------------------------
style <- c("@Briggs11", "[see @Baldwin2014; @Caruso2000]", "[@Linn02, p. 9]", 
          "[-@Goldhaber08]")
out <- c("Briggs and Weeks (2011)", "(see Baldwin et al. 2014; Caruso 2000)",
         "(Linn and Haug 2002, 9)", "(2008)")
knitr::kable(data.frame(style, out), 
        col.names = c("Citation Style", "Output"),
        format = "html")

