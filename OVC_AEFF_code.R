library(ggplot2)
library(ggimage)
library(ggpubr)
library(jpeg)
library(magick)



SEMO <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\SEMO_Logo.png"
UT_Martin <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\UT_Martin_Skyhawks_logo.png"
TTU <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\tennessee-tech-golden-eagles.png"
MSU <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\morehead_state.png"
EIU <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\EIU_Panthers.png"
TSU <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\tsu_tigers.png"
Lindenwood <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\lindenwood.png"
LRU <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\LRU.png"
USI <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\usi.png"
SIUE <- "C:\\Users\\jstin\\Documents\\SEMO_MBB\\Data\\images\\siue.png"

Offensive_Rebounds =c(9.5, 10.2, 7.9, 8.9, 8.9, 9.8, 8.1, 10.5, 13.2, 11.0)
Opponent_Turnovers = c(14.8, 11.4, 13.3, 10.7, 13.1, 12.4, 11.8, 14.1, 11.2, 12.8)
Points_Off_TO = c(15.0, 12.7, 15.1, 12.8, 14.3, 11.6, 10.9, 15.6, 12.2, 16.1)
Second_Chance_Points =c(10.6, 9.3, 7.7, 7.7, 9.3, 11.3, 9.4, 11.8, 12.6, 11.7)
Extra_Possessions <- Opponent_Turnovers + Offensive_Rebounds
PPEP <- (Points_Off_TO + Second_Chance_Points)/ Extra_Possessions 

image <- c(SEMO, UT_Martin, TTU, MSU, EIU, TSU, Lindenwood, LRU, USI, SIUE)

df <- data.frame(Extra_Possessions,PPEP,image) 

p1 <- ggplot(df, aes(Extra_Possessions,PPEP,image = image))
p1 <- p1 + geom_point()
p1 <- p1 + geom_image(size = 0.14)
p1 <- p1 + theme_minimal()
#p1 <- p1 + ylim(.9,1.3)
p1 <- p1 + geom_hline(yintercept = mean(PPEP))
p1 <- p1 + geom_vline(xintercept = mean(Extra_Possessions))
p1 <- p1 + ylab("Points Per Extra Possesion")
p1 <- p1 + xlab("Extra Possessions Per Game \n (Offensive Rebounds + Opponent Turnovers) ")
p1 <- p1 + ggtitle("OVC Extra Possessions Per Game/ Points Per Extra Possession (Conference Only) \n (Stats from Just Play)")
p1 <- p1 + theme(plot.title = element_text(hjust =0.5))
p1
