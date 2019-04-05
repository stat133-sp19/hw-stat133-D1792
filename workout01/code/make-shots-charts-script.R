
# title: make-shot-charts-script
# description: make shot charts for each player and output it as a facetted shot chart in PDF and PNG format
# input:  stephen-curry.csv,klay-thompson.csv, kevin-durant.csv, draymond-green.csv, andre-iguodala.csv, shots-data.csv
# output: andre_iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, kevin-durant-shot-chart.pdf, klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf, gsw-shot-charts.pdf, gsw-shot-charts.png. 

## 4) Shot Charts
# scatterplot
klay = read.csv("data/klay-thompson.csv")

library(ggplot2)
klay_scatterplot <- ggplot(data = klay) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

library(jpeg)
library(grid)

# court image (to ba used as background of plot)
court_file = "images/nba-court.jpg"

# create raste object
court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot chart with court background
klay_shot_chart = ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chat: Klay Thompson (2016 season)") +
  theme_minimal()

## 4.1) Shot charts for each player 

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

#iguodala_pdf

iguodala_pdf = ggplot(data=iguodala)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Andre Iguodala (2016 season)')+
  theme_minimal()

pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5) 
iguodala_pdf
dev.off()

#green_pdf

green_pdf = ggplot(data=green)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Draymond Green (2016 season)')+
  theme_minimal()

pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5) 
green_pdf
dev.off()

#durant_pdf
durant_pdf = ggplot(data=durant)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Kevin Durant (2016 season)')+
  theme_minimal()

pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5) 
durant_pdf
dev.off()

#thompson_pdf

thompson_pdf = ggplot(data=thompson)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Klay Thompson (2016 season)')+
  theme_minimal()

pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5) 
thompson_pdf
dev.off()

#curry_pdf

curry_pdf = ggplot(data=curry)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry (2016 season)')+
  theme_minimal()

pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5) 
curry_pdf
dev.off()

## 4.2) Facetted Shot Chart

#read facetted data
facetted_data = read.csv(file = "data/shots-data.csv")


facetted_shot_chart <- ggplot(data=facetted_data)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Charts: GSW (2016 season)")+
  facet_wrap(~name)+
  theme_minimal()

pdf(file = "images/gsw-shot-charts.pdf", width = 8, height = 7) 
facetted_shot_chart
dev.off()

png(file = "images/gsw-shot-charts.png", width = 8, height = 7) 
facetted_shot_chart
dev.off()


