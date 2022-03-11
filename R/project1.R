#' @title Project 1 function
#' @description  This is the function needed for project 1 of MATH 4753.
#'
#' @param df data frame
#' @param SPECIES the species you wish to filter
#'
#' @return plot and csv file plus data and table
#' @importFrom dplyr '%>%' filter
#' @importFrom ggplot2 aes geom_smooth ggplot geom_point ggtitle
#' @importFrom utils write.csv
#' @export
#'
#' @examples
#' \dontrun{obj <- myddt(df = ddt, SPECIES = "CCATFISH")}
myddt <- function(df,SPECIES)
{

WEIGHT <- LENGTH <- RIVER <- NULL

  newdf <- df %>% filter(SPECIES == {{SPECIES}})
  ## Create new data frame using {{SPECIES}} from function call

  g = ggplot(newdf, aes(x = WEIGHT, y= LENGTH)) + geom_point(aes(col = RIVER)) +
    geom_smooth(formula = y~x +I(x^2), method = "lm") + ggtitle("Dr Do a LOT")
  ## Scatter plot with quadratic curve of sub-set data. Points are color coded by river.

  print(g)
  ## Print plot

  write.csv(x = newdf,
            file = paste0("LvsWfor", SPECIES,".csv"),
            row.names = FALSE
  )
  ## Write a csv file for SPECIES

  listof3 = list(df = df,newdf = newdf, tab = table(df$RIVER)/length(df$RIVER))
  ## Create list of 3 required objects


  return(listof3)
  ## Return to the command line a list of 3.
}
