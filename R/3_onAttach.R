#' @import data.table ggplot2
#' @importFrom magrittr %>%
.onAttach <- function(libname, pkgname) {
    version <- tryCatch(
      utils::packageDescription("covidnor", fields = "Version"),
      warning = function(w){
        1
      }
    )
  
  packageStartupMessage(paste0(
    "covidnor ",
    version,
    "\n",
    "https://docs.sykdomspulsen.no/covidnor/"
  ))
}
