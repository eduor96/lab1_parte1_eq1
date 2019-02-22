### Cargas librer?as a utilizar
suppressMessages(library(Quandl)) # Descargar Precios
install.packages("data.table")
library(data.table)

options(knitr.table.format = "html") 

Quandl.api_key("PU3GsQWU2zsn6N8_eq71")

delete.na <- function(df, n=0) {
  df[rowSums(is.na(df)) <= n,]
}

funcion_pesos<-function(i){
  i<-1
  f<-paste("IBB_holdings_",i,".csv",sep="")
  data_iak<-read.csv(f,row.names = NULL,skip = 10,stringsAsFactors = FALSE)
  matriz_1<-matrix(nrow = nrow(data_iak), ncol = 4)
  matriz_1[,1] <- data_iak[,1] #Ticker
  matriz_1[,2]<-(data_iak[,4]) #Pesos
  matriz_1[,3]<-(data_iak[,6])#Shares
  matriz_1[,4]<-data_iak[,5] #Price
  return(matriz_1)
}  

Bajar_Precios<-function(c,tk,f1,f2){
  Datos<-Quandl.datatable("WIKI/PRICES",qopts.columns=c,ticker=tk,date.gte=f1,date.lte=f2,paginate = TRUE)
  return (data.frame(Datos))
}
