# ggplot2 practice and tidyverse
library(tidyverse)
# Do cars with big engines use more fuel than cars with small engines? 
# You probably already have an answer, but try to make your answer precise. 
# What does the relationship between engine size and fuel efficiency look like? 
# Is it positive? Negative? Linear? Nonlinear?

# a dataframe found in ggplot2 
mpg

# to plot mpg, put displ (car engine size) on x axis and hwy (hwy mpg) on the y axis
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
# plot shows that cars with bigger engines use more fuel
# ggplot() is how you begin a plot. creates coordinate system you can add layers to
# geom_point() adds a layer of points to your plot. each geom function takes a mapping
# argument. the mapping argument is always paired with aes(), and the x and y
# arguments of aes() specify which variables to map to the x and y axes. looks for the
# mapped variables in the data argument (in this example, mpg)

# making a graphing template
#ggplot(data = <DATA>) +
  #<GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))
?mpg
# map the colors of the points to the class variable to reveal the class of each car
# this is mapping an aesthetic to a variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
# can map class to the size aesthetic but mapping size to an unordered variable 
# may not be a good idea
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
# can map class to alpha (transparency of the points) or to shape aesthetic (controls the 
# shape of the points)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# ggplot will only use 6 shapes at a time and additional groups go unplotted
# can set the aesthetic prperties manually, like making the color of all the points blue
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
# To set an aesthetic manually, set the aesthetic by name as an argument of
# your geom function; i.e. it goes outside of aes().
# The name of a color as a character string.
#The size of a point in mm.
# The shape of a point as a number, as shown in Figure 3.1. R has 25 built in shapes that
# are identified by numbers
?geom_point
vignette("ggplot2-specs")
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = year))
?nrow
# can split plots by a single variable, called a facet
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# can facet by 2 variables using facet_grid()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

# the . breaks the plots up by the different categories of variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
?facet_wrap

# geometric objects
# a geom is the geometrical object that a plot uses to represent the data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) # makes a scatterplot
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) # makes a smooth line graph
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv)) # makes a smooth line graph with a different line type for each unique value of the variable
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
# group makes multiple lines with the drv variable
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE # here switching to true will display the legend
  )

# multiple geoms in the same plot
# makes a line and scatterplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# makes the same graph as above
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# mapping makes it possible to display different aesthetics in different layers
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# can also specify different data for each layer
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
?geom_smooth
# se displays the confidence interval around smooth 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# will these 2 graphs look different? No, they're both saying the same thing. 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# statistical transformations
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
?diamonds
# bar charts, histograms, and frequency polygons bin your data 
# and then plot bin counts, the number of points that fall in each bin.

# can use stats and geoms interchangeably
# this works because every geom has a default stat, and every stat has a default geom.
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

# display barchart of proportion
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
?geom_bar

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
?stat_summary

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))

# can color a bar with fill or color
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

# position identity, shows each object where it falls in the context of the graph
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

# position fill makes each set of stacked bars the same height
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position dodge places bars side by side
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# jitter makes graphs more revealing at large scales
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
?geom_jitter

# template for making graphs
# ggplot(data = <DATA>) + 
  #<GEOM_FUNCTION>(
   # mapping = aes(<MAPPINGS>),
   # stat = <STAT>, 
  #  position = <POSITION>
 # ) +
  #<COORDINATE_FUNCTION> +
 # <FACET_FUNCTION>
  
# Graphics for communication--how to make effective graphics

# add labels with the lab function
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(title = "Fuel efficiency generally decreases with engine size")

# subtitle adds additional detail in a smaller font beneath the title
# caption adds text at the bottom right of the plot, often used to describe
# the source of the data. 
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov"
  )

# labs() can also be used to replace the axis and legend titles
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  labs(
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    colour = "Car type"
  )

# can also use mathematical equations instead of strings by using quote()
df <- tibble(
  x = runif(10),
  y = runif(10)
)
ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
  )

# can label individual observations or groups of observations
# geom_text() has label, making it possible to add textual data to plots
best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_text(aes(label = model), data = best_in_class)

# geom_label() draws a rectangle behind the text
# nudge_y moves labels slightly above points
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_label(aes(label = model), data = best_in_class, nudge_y = 2, alpha = 0.5)

# ggrepel adjusts labels so they don't overlap
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  ggrepel::geom_label_repel(aes(label = model), data = best_in_class)
?melt
?ggplot2
?fill
