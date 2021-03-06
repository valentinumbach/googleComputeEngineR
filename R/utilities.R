extract_ip <- function(ii){
  vapply(ii$items$networkInterfaces, function(x) {
    y <- x$accessConfigs[[1]]$natIP
    if(is.null(y)) y <- "No external IP"
    y
  }, character(1))
}

# Given a string, indent every line by some number of spaces.
# The exception is to not add spaces after a trailing \n.
#' @author Winston Chang \email{winston@@stdout.org}
indent <- function(str, indent = 0) {
  gsub("(^|\\n)(?!$)",
       paste0("\\1", paste(rep(" ", indent), collapse = "")),
       str,
       perl = TRUE
  )
}

#' Get auth email
#' If it includes '@' then assume the email, otherwise an environment file
#' @param source where the email comes from
#' @keywords internal
auth_email <- function(source){
  
  if(Sys.getenv(source) == ""){
    stop("No email source found")
  }
  
  if(!grepl("@", source)){
    out <- jsonlite::fromJSON(Sys.getenv(source))$client_email
  } else {
    out <- source
  }
  
  out
  
}

#' Timestamp to R date
#' @keywords internal
timestamp_to_r <- function(t){
  as.POSIXct(t, format = "%Y-%m-%dT%H:%M:%S")
}

#' if argument is NULL, no line output
#'
#' @keywords internal
cat0 <- function(prefix = "", x){
  if(!is.null(x)){
    cat(prefix, x, "\n")
  }
}

#' A helper function that tests whether an object is either NULL _or_
#' a list of NULLs
#'
#' @keywords internal
is.NullOb <- function(x) is.null(x) | all(sapply(x, is.null))

#' Recursively step down into list, removing all such objects
#'
#' @keywords internal
rmNullObs <- function(x) {
  x <- Filter(Negate(is.NullOb), x)
  lapply(x, function(x) if (is.list(x)) rmNullObs(x) else x)
}

#' Is this a try error?
#'
#' Utility to test errors
#'
#' @param test_me an object created with try()
#'
#' @return Boolean
#'
#' @keywords internal
is.error <- function(test_me){
  inherits(test_me, "try-error")
}

#' Get the error message
#'
#' @param test_me an object that has failed is.error
#'
#' @return The error message
#'
#' @keywords internal
error.message <- function(test_me){
  if(is.error(test_me)) attr(test_me, "condition")$message
}

#' Idempotency
#'
#' A random code to ensure no repeats
#'
#' @return A random 15 digit hash
#' @keywords internal
idempotency <- function(){
  paste(sample(c(LETTERS, letters, 0:9), 15, TRUE),collapse="")
}


#' Custom message log level
#' 
#' @param ... The message(s)
#' @param level The severity
#' 
#' @details 0 = everything, 1 = debug, 2=normal, 3=important
#' @keywords internal
myMessage <- function(..., level = 2){
  
  compare_level <- getOption("googleAuthR.verbose")
  
  if(level >= compare_level){
    message(Sys.time() ,"> ", ...)
  }
  
}