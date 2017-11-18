library(data.table)
library(ggplot2)
library(cowplot)

data_raw <- fread("China Super League 2017 Chances.csv", na.strings = c('-', 'N/A'))



lapply(data_raw, table)


one_game <- data_raw[gsm_id == gsm_id[2]][team == team[1], `:=` (location_x = -location_x, location_y = 420-location_y), team]

ggplot() +
  geom_rect(aes(xmin = -136, xmax = 136, ymin = 0 , ymax = 420), fill = '#336633', color = 'black', alpha = 0.8) +
  geom_point(data = one_game, aes(location_x, location_y, color = icon, shape = bodyPart), size = 4) +
  geom_rect(aes(xmin = -15, xmax = 15, ymin = 0 , ymax = 2), fill = 'white', color = 'black', alpha = 0) +
  geom_rect(aes(xmin = -15, xmax = 15, ymin = 418 , ymax = 420), fill = 'white', color = 'black', alpha = 0) +
  geom_rect(aes(xmin = -37, xmax = 37, ymin = 0 , ymax = 22), fill = 'white', color = 'black', alpha = 0) + 
  geom_rect(aes(xmin = -37, xmax = 37, ymin = 398 , ymax = 420), fill = 'white', color = 'black', alpha = 0) + 
  geom_rect(aes(xmin = -81, xmax = 81, ymin = 0 , ymax = 66), fill = 'white', color = 'black', alpha = 0) +
  geom_rect(aes(xmin = -81, xmax = 81, ymin = 354 , ymax = 420), fill = 'white', color = 'black', alpha = 0) +
  geom_rect(aes(xmin = -136, xmax = 136, ymin = 210 , ymax = 210), fill = 'white', color = 'black', alpha = 0) +
  geom_point(aes(x = 0, y = 376), size=4, shape=20, color="black") +
  geom_point(aes(x = 0, y = 44), size=4, shape=20, color="black") +
  geom_point(aes(x = 0, y = 210), size=40, shape=1, color="black") +
  geom_point(aes(x = 0, y = 210), size=4, shape=20, color="black") +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())
  
