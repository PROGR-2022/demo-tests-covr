test_that("results are correct", {

  expect_equal(
    object = textLikelihood("ASHFIUAWKJANSF"),
    expected = -50.13667,
    tolerance = 1e-5
  )

  # expect_equal(
  #   object = textLikelihood("HELLO", log_scale = FALSE),
  #   expected = 0.00000036476808,
  #   tolerance = 1e-8
  # )
})
