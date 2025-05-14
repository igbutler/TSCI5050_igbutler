library(ggplot2);
library(GGally)

head(mpg)
# basic plot
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point()

# adding several different "aesthetic mappings": color, size, and shape
ggplot(mpg, aes(x=cty, y=hwy, colour = class, size=displ, shape=drv, fill=class)) + geom_point(alpha=0.2)

# using "facet' to include even more dimensions
ggplot(mpg, aes(x=cty, y=hwy, colour = class, size=displ, shape=drv, fill=class)) + 
  geom_point(alpha=0.2) + facet_grid(row=vars(trans),cols=vars(fl))

library(ggplot2);
library(GGally);

head(mpg)
# basic plot
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point()

# adding as many different "aesthetic mappings" as possible: color, size, shape, fill, and alpha (transparency)
ggplot(mpg, aes(x=cty, y=hwy, colour = class, size=displ,shape=drv,fill=class,alpha=cyl)) + geom_point()

# using 'facet' to include even more dimensions
ggplot(mpg, aes(x=cty, y=hwy, colour = class, size=displ,shape=drv,fill=class,alpha=cyl)) + 
  geom_point() + facet_grid(rows=vars(trans),cols=vars(fl))


# adding layers
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point() + geom_smooth(forumla=y~x)

# override color
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point() + geom_smooth(aes(colour = NA),forumla=y~x)

ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point() + geom_smooth(aes(y = displ),forumla=y~x)

# assign specific color in geom smooth
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point() + 
  geom_smooth(aes(colour = NA), formula = y~x, colour="blue", fill="blue")

#add linear model to line fit
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point() + 
  geom_smooth(aes(colour = NA), formula = y~x, colour="blue", fill="blue", method = "lm")

# remove CI with se = FALSE
ggplot(mpg, aes(x=cty, y=hwy, colour = class)) + geom_point() + 
  geom_smooth(aes(colour = NA), formula = y~x, colour="blue", fill="blue", method = "lm", se = FALSE)

# boxplots
ggplot(mpg, aes(x=class, y=hwy, colour = class)) + geom_boxplot()

ggplot(mpg, aes(x=class, y=hwy, colour = class, fill = model)) + geom_boxplot()

#make discret variable with factor
ggplot(mpg, aes(x=class, y=hwy, colour = class, fill = factor(cyl))) + geom_boxplot()

# x is more specific, color is general
ggplot(mpg, aes(x=model, y=hwy, colour = manufacturer)) + geom_boxplot()

ggplot(mpg, aes(x=model, y=hwy, colour = drv)) + geom_boxplot()

ggplot(mpg, aes(x=model, y=hwy, colour = drv)) + geom_violin()

# shows the distribution instead of summary boxplot
ggplot(mpg, aes(x=drv, y=hwy)) + geom_violin()


# line plot
ggplot(mpg, aes(x=model, y=hwy, colour = drv)) + geom_boxplot() + geom_line()

ggplot(mpg, aes(x=displ, y=hwy, colour = manufacturer)) + geom_line()

ggplot(mpg, aes(x=displ, y=hwy, colour = class)) + geom_line()

#histogram
ggplot(mpg, aes(x=displ)) + geom_histogram(binwidth = 0.5)
ggplot(mpg, aes(x=displ)) + geom_histogram(binwidth = 0.5)

ggplot(mpg, aes(x=class)) + geom_histogram(binwidth = 0.5, stat= "count")

ggplot(mpg, aes(x=class, fill = class)) + geom_histogram(binwidth = 0.5, stat= "count")

# keeping the same bars, stacked histogram
ggplot(mpg, aes(x=class, fill = manufacturer)) + geom_histogram(binwidth = 0.5, stat= "count")

# making the bars side by side
ggplot(mpg, aes(x=class, fill = manufacturer)) + geom_histogram(binwidth = 0.5, stat= "count", position="dodge")

# time series comparison
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable))

ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + facet_wrap(~variable)

# might not have to transform data with scales
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + facet_wrap(~variable, scales="free_y")
# will stack them all in one column
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + facet_wrap(~variable, scales="free_y", ncol=1)
# will display side by side
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + facet_wrap(~variable, scales="free_y", nrow=1)

ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + 
  facet_wrap(~variable, scales="free_y", ncol=1) +
  scale_x_date(date_labels = "%Y-%m")

ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + 
  facet_wrap(~variable, scales="free_y", ncol=1) +
  scale_x_date(date_labels = "%Y/%m") + 
  scale_y_continuous(labels = scales::dollar_format())

# changing the scale to log base 10
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + 
  facet_wrap(~variable, scales="free_y", ncol=1) +
  scale_x_date(date_labels = "%Y/%m") + 
  scale_y_log10(labels = scales::dollar_format())

# adding labels to graph to display
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + 
  facet_wrap(~variable, scales="free_y", ncol=1) +
  scale_x_date(date_labels = "%Y/%m") + 
  scale_y_log10(labels = scales::dollar_format()) + 
  labs(title="Title", subtitle = "subtitle", caption = "caption", tag = "tag")

# adding x and y labels
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + 
  facet_wrap(~variable, scales="free_y", ncol=1) +
  scale_x_date(date_labels = "%Y/%m") + 
  scale_y_log10(labels = scales::dollar_format()) + 
  labs(title="Title", subtitle = "subtitle", caption = "caption", tag = "tag") +
  xlab("XLab") + ylab ("YLab")

# add legend titles
ggplot(economics_long, aes(x=date, y=value)) + geom_line(aes(colour = variable)) + 
  facet_wrap(~variable, scales="free_y", ncol=1) +
  scale_x_date(date_labels = "%Y/%m") + 
  scale_y_log10(labels = scales::dollar_format()) + 
  labs(title="Title", subtitle = "subtitle", caption = "caption", tag = "tag", colour="color legend") +
  xlab("XLab") + ylab ("YLab") 
  
