#' Likelihood of a string
#'
#' @param text A character vector of length 1.
#' @param log_scale If `TRUE` (default) log-likelihood is returned.
#' @return A numeric(1) of the total (log-)likelihood of the input text.
textLikelihood <- function(text, log_scale = TRUE) {
  checkmate::assertString(text, pattern = "^[A-Z ]+$")

  letterfrequencies <- 1 / 100 * c(
    A = 6.756, B = 1.234, C = 2.302, D = 3.518, E = 10.508, F = 1.843, G = 1.667,
    H = 5.041, I = 5.763, J = 0.127, K = 0.639, L = 3.330, M = 1.990, N = 5.583,
    O = 6.210, P = 1.596, Q = 0.079, R = 4.953, S = 5.234, T = 7.492, U = 2.282,
    V = 0.809, W = 1.952, X = 0.124, Y = 1.633, Z = 0.061, ` ` = 17.272)

   result <- sum(log(letterfrequencies[strsplit(text, "")[[1]]]))

   if (!log_scale) {
     result <- exp(result)
   }

   result
}
