
# title: make-shot-data-script
# description: prepare data for later analysis, create a csv data file shots-data.csv that contains the required variables to be usedin the visualization phase.
# input:  stephen-curry.csv,klay-thompson.csv, kevin-durant.csv, draymond-green.csv, andre-iguodala.csv
# output: shots-data.csv

# reading stephen file
curry = read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
# reading thompson file
thompson = read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
# reading durant file
durant = read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
# reading green file
green = read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
# reading iguodala file
iguodala = read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)

##add a column name
library(dplyr)

#Andre Iguodala
iguodala = iguodala %>%
  mutate(name = "Andre Iguodala")

#Graymond Green
green = green %>%
  mutate(name = "Graymond Green")

#Kevin Durant
durant = durant %>%
  mutate(name = "Kevin Durant")

#Klay Thompson
thompson = thompson %>%
  mutate(name = "Klay Thompson")

#Stephen Curry
curry = curry %>%
  mutate(name = "Stephen Curry")

##change the original values of shot_made_flag
iguodala = iguodala %>%
  mutate(shot_made_flag = ifelse(shot_made_flag == "n", "shot_no", "shot_yes"))
green = green %>%
  mutate(shot_made_flag = ifelse(shot_made_flag == "n", "shot_no", "shot_yes"))
durant = durant %>%
  mutate(shot_made_flag = ifelse(shot_made_flag == "n", "shot_no", "shot_yes"))
thompson = thompson %>%
  mutate(shot_made_flag = ifelse(shot_made_flag == "n", "shot_no", "shot_yes"))
curry = curry %>%
  mutate(shot_made_flag = ifelse(shot_made_flag == "n", "shot_no", "shot_yes"))

##add a column minite
iguodala = iguodala %>%
  mutate(minute = (period*12)- minutes_remaining)
green = green %>%
  mutate(minute = (period*12)- minutes_remaining)
durant = durant %>%
  mutate(minute = (period*12)- minutes_remaining)
thompson = thompson %>%
  mutate(minute = (period*12)- minutes_remaining)
curry = curry %>%
  mutate(minute = (period*12)- minutes_remaining)

#Use sink() to send the sumary() output
sink(file = "output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "output/stephen-curry-summary.txt")
summary(curry)
sink()

#Use the row binding function rbind()
shots_data = rbind(curry,durant,green,iguodala,thompson)

#Export the assembled table as a CSV
write.csv(shots_data, file = "data/shots-data.csv", row.names = FALSE)

#Use sink() to send the summary() oputput of the assembled data
sink(file = "output/shots-data-summary")
summary(shots_data)
sink()