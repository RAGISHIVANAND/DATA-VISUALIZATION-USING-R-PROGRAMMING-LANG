library(ggplot2)
library(reshape2)
library(plyr)

df_GSPC_FTSE_2000_2010 <- read.csv("G:/line_chart_data.csv",
                                 header=TRUE,
                                 sep=",")

df_GSPC_FTSE_2000_2010$Date <- as.Date(df_GSPC_FTSE_2000_2010$Date,
                                     format="%m/%d/%Y")

df_GSPC_FTSE_2000_2010_melt <- melt(df_GSPC_FTSE_2000_2010,
                                    id = "Date")

df_GSPC_FTSE_2000_2010_melt <- rename(df_GSPC_FTSE_2000_2010_melt,
                                    c("value"="Returns",
                                      "variable"="Index"))
line_chart <- ggplot(df_GSPC_FTSE_2000_2010_melt,
                     aes(x=Date,
                         y=Returns,
                         colour=Index))+
              geom_line(aes(color=Index),
                        size=1)+
              scale_color_manual(values=c("navyblue","red4"))+
              theme_minimal()+
              ggtitle("GSPC VS FTSE Returns (2000-2010)")
line_chart

min <- as.Date("2008-7-1")
max <- as.Date("2008-12-31")

line_chart_H2_2008 <- ggplot(df_GSPC_FTSE_2000_2010_melt,
                             aes(x=Date,
                                 y=Returns,
                                 colour=Index))+
                      geom_line(aes(color=Index),
                                size=1)+
                      scale_color_manual(values=c("navyblue","red4"))+
                      theme_minimal()+
                      ggtitle("GSPC VS FTSE Returns (H2 2008)")+
                      scale_x_date(limits=c(min,max))+
                      theme(legend.justification = c(0.01,1),
                            legend.position = c(0.01,1))
line_chart_H2_2008

