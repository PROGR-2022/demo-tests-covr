#' Distance Conversion
#'
#' @param from,to Unit to convert from and to, must me "km" (default), "miles" or "nautical miles"
distConversion <- function(distance, from = "km", to = "km") {
  checkmate::assertNumeric(distance, any.missing = FALSE)

  conversion <- c(km = 1, miles = 1.609344, `nautical miles` = 1.852)
  checkmate::assertChoice(from, names(conversion))
  checkmate::assertChoice(to, names(conversion))

  round(distance * (conversion[[from]] / conversion[[to]]), 3)
}
