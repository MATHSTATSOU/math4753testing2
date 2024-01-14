#' @title filtering data
#'
#' @param df  data frame used in dplyr function
#' @param cond  condition for filter
#' @importFrom dplyr '%>%' filter
#'
#'
#' @return filtered data frame
#' @export
#'
#' @examples
#' myfunNSE(ddt, cond = LENGTH > 40)
myfunNSE <- function(df,cond){

  df %>% filter({{cond}}) # Note the use of {{}}
}


