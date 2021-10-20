df <- read.csv("D:/r programming/R_file/tata dashboard/TTM.csv")
names(df)
plot(df$Open , type = "l" , col="green" ,
              xlab = "Date" , ylab = "Open price" 
            , main = "Open price of tata motors")


plot(df$Close , type = "l" , col="red" ,
     xlab = "Date" , ylab = "close price" 
     , main = "Close price of tata motors")


plot(df$Low , type = "l" , col="blue" ,
     xlab = "Date" , ylab = "low price" 
     , main = "Low price of tata motors")

plot(df$High , type = "l" , col="yellow" ,
     xlab = "Date" , ylab = "high price" 
     , main = "High price of tata motors")


max(df$High)
df[1,2]$Open
df[1,2]
tail(df$Open , 1)
tail(df$Date , 1)

library(plotly)
library(dplyr)

p1<-plot_ly(data = df , x=df$Date , y=df$Close,
            name = "close price",type = "scatter", 
            mode = "lines", line = list(color = "green" , width=4))
p1


library(tidyquant)
library(plotly)

from <- today() - years(5)
df<- tq_get("TTM", get = "stock.prices", from = from)

fig<-plot_ly(df,mode = "lines" , type = "scatter")%>%
  add_trace(x = df$date , y = df$close,line = list(color = "#e37f82"))%>%
  layout(showlegend = F , title = "Closing Price Of Tata Motors",
         xaxis = list(rangeslider = list(visible = T)),
         plot_bgcolor = "#637880")

fig


fig2 <- plot_ly(x = df$date , type = "candlestick",
                open = df$open ,close = df$close,
                high = df$high , low = df$low)%>%
  layout(title = "candlestick chart",plot_bgcolor = "#b3ed5c",
         xaxis = list(title = "Date"),
         yaxis = list(title = "Closing Price"))
fig2





