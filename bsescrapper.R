library(rvest)
library(dpylr)
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

for(symbol in bsedata$Symbol){
  print(symbol)
  url=paste0("https://query1.finance.yahoo.com/v7/finance/download/", symbol ,"?period1=1476921600&period2=1634688000&interval=1d&events=history&includeAdjustedClose=true")
  print(url)
}
