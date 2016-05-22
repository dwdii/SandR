
#
# Answer to StackOverflow question
#
# http://stackoverflow.com/questions/37375946/add-column-detailing-which-year-data-is-from-in-r/37376208#37376208
#

df <- structure(list(region = structure(1:8, .Label = c("a", "b", "c", 
                                                        "d", "e", "f", "g", "h"), class = "factor"), y.2012 = c(5.5, 
                                                                                                                NA, 4.7, 3.6, NA, NA, 4.6, NA), y.2013 = c(5.7, NA, NA, 3.8, 
                                                                                                                                                           NA, 6.2, NA, NA), y.2014 = c(NA, 6.3, NA, 4.1, 5.1, NA, NA, NA
                                                                                                                                                           )), .Names = c("region", "y.2012", "y.2013", "y.2014"), class = "data.frame", row.names = c(NA, 
                                                                                                                                                                                                                                                 -8L))

df

library(reshape2)
df2 <- reshape2::melt(df, 
                      id.vars="region", 
                      variable.name="yearStr")
df2

df2$year <- as.numeric(stringr::str_replace(df2$yearStr, "y.", ""))

df2

library(dplyr)
regions <- group_by(df2, region)
df3 <- filter(regions[!is.na(regions$value),], min_rank(desc(year)) <= 1)
as.data.frame(df3)