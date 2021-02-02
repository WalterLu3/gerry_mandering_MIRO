gerryOutput <- function(id, height = NULL, options = NULL, path = NULL){
  ns <- NS(id)
  
  # set default height
  if(is.null(height)){
    height <- 700
  } 
  tagList( 
    #define rendererOutput function here 
    textOutput(ns('status')),
    fluidRow(
      column(4,dataTableOutput(ns('dataT'),height=height))
    #,
    #  column(8, plotOutput(ns('plot1'),height=height))
    )
    
  )
}

renderGerry <- function(input, output, session, data, options = NULL, path = NULL, ...){ 
  #renderer 
  output$status<-renderText(names(data))
  df_assign <- cbind(c(data$nodes),c(data$district))
  output$dataT<-DT::renderDataTable(datatable(df_assign,colnames=c('County','District Assigned')))
  

  
}