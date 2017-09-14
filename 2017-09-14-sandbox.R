# http://r4ds.had.co.nz/data-visualisation.html

# comments

# libraries
library(tidyverse)

# ggplot2::ggplot()

# variables
x <- 12346

# vectors
y <- c(1, 4, 6, 2)
y1 <- 1:50

# data frames
df <- data_frame(x = 1:10,
                 y = 11:20)
df
plot(df$x, df$y)

mean(df$x)
median(df$y)


# functions

fancy_thing <- function(asdf) {
  asdf + 1
}

fancy_thing(5)
fancy_thing(y)


library(readxl)
data(mpg)
head(mpg)

# Basic scatterplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Not accurate, but more truthful
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class), position = "jitter")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class), alpha = 0.3)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) + 
  facet_wrap(~ drv)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) + 
  geom_smooth(aes(x = displ, y = hwy)) +
  facet_wrap(~ drv)

ggplot(mpg) + 
  geom_violin(aes(x = class, y = hwy, fill = class)) +
  geom_point(aes(x = class, y = hwy)) +
  facet_wrap(~ drv)

crimes <- read_csv("data/police-cases-2012.csv")
cr <- read_excel("data/ComicRelief_360Giving_International.xlsx")


cr1 <- cr %>%
  rename(amount = `Amount Awarded`, duration = `Planned Dates:Duration (months)`,
         program = `Grant Programme:Title`)

ggplot(cr1, aes(x = duration, y = amount)) + 
  geom_point() + 
  facet_wrap(~ program)


cr.summarized <- cr1 %>%
  group_by(program) %>%
  summarize(avg_amount = mean(amount)) %>%
  arrange()


ggplot(cr.summarized, aes(x = program, y = avg_amount)) +
  geom_bar(stat = "identity") +
  coord_flip()

library(ggstance)
ggplot(cr.summarized, aes(y = program, x = avg_amount)) +
  geom_barh(stat = "identity")


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) + 
  theme_linedraw()

# https://github.com/jrnold/ggthemes
library(ggthemes)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) + 
  theme_fivethirtyeight()

library(ggThemeAssist)
p <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

theme(plot.subtitle = element_text(vjust = 1), 
      plot.caption = element_text(vjust = 1), 
      axis.line = element_line(colour = "bisque1"), 
      axis.text.y = element_text(family = "mono"), 
      panel.background = element_rect(fill = "gray67"), 
      legend.position = "left", legend.direction = "horizontal")

# ggsave


sample(c("H", "•"), 100, replace = TRUE)
