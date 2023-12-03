#' @import data.table
.onAttach <- function(libname, pkgname) {
    version <- tryCatch(
      utils::packageDescription("respiranor", fields = "Version"),
      warning = function(w){
        1
      }
    )

  packageStartupMessage(paste0(
    "respiranor ",
    version,
    "\n",
    "https://www.csids.no/respiranor/"
  ))
}
