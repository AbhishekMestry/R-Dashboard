library(rvest)
library(dpyr)
library(readr)
#Import Tickers
setwd('E:/Drive E/shares_project')
bse_url="https://en.wikipedia.org/wiki/List_of_BSE_SENSEX_companies"
bsedata=read_html(bse_url) %>%
  html_node("table") %>%
  html_table()

bsedata=bsedata %>% select(`Exchange ticker`, Symbol, Companies, Sector)

#save(bsedata, file='bsedata.RData')

AXISBANK.BO=read_csv('https://query1.finance.yahoo.com/v7/finance/download/AXISBANK.BO?period1=1476921600&period2=1634688000&interval=1d&events=history&includeAdjustedClose=true')
HDFC.BO=read_csv('https://query1.finance.yahoo.com/v7/finance/download/HDFC.BO?period1=1476921600&period2=1634688000&interval=1d&events=history&includeAdjustedClose=true')

returns <- as.data.frame(matrix(NA, ncol = 8, nrow = 0))
names(returns) <- c("Date", "Open", "High", "Low", "Close", "Adj_Close", "Volume", "Ticker")



for(symbol in bsedata$Symbol){
  print(symbol)
  url=paste0("https://query1.finance.yahoo.com/v7/finance/download/", symbol ,"?period1=1476921600&period2=1634688000&interval=1d&events=history&includeAdjustedClose=true")
  print(url)



ret <- try(read_csv(url))

if(mode(ret) != "character"){
  ret$Ticker <- symbol
  returns <- rbind(returns, ret)
}
}


returns <- returns %>% select("Date", "Ticker", "Open", "High", "Low", "Close")
returns <- returns %>% mutate(
  Open = as.numeric(Open),
  High = as.numeric(High),
  Low = as.numeric(Low),
  Close = as.numeric(Close),
)



returns <- returns %>% mutate(
  Movement = ifelse(Close > Open, "Up", "Down")
)

save(returns, file = "returns.RData")
