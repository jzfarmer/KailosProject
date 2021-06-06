# melt/reshape tutorial https://towardsdatascience.com/reshape-r-dataframes-wide-to-long-with-melt-tutorial-and-visualization-ddf130cd9299
# creating a wide data frame
df_wide <- data.table(
  student = c("Andy", "Bernie", "Cindey", "Deb"),
  school = c("Z", "Y", "Z", "Y"),
  english = c(10, 100, 1000, 10000),  # eng grades
  math = c(20, 200, 2000, 20000),  # math grades
  physics = c(30, 300, 3000, 30000)   # physics grades
)
setDT(df_wide)
class(df_wide)

df_long <- melt(data = df_wide, 
                id.vars = c("student", "school"),
                variable.name = "cLaSs", 
                value.name = "gRaDe")

