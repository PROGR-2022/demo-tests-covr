test_that("distConversion produces correct results", {

  # Fixed example cases
  expect_equal(distConversion(1, from = "km", to = "miles"),  0.621)
  expect_equal(distConversion(1, from = "miles", to = "km"),  1.609)
  expect_equal(distConversion(1, from = "nautical miles", to = "miles"),  1.151)

  # Identity behavior
  expect_equal(distConversion(1, from = "km", to = "km"),  1)
  expect_equal(distConversion(1, from = "miles", to = "miles"),  1)
  expect_equal(distConversion(1, from = "nautical miles", to = "nautical miles"),  1)

  # Random example cases
  set.seed(12)
  test.km <- runif(100, max = 100)
  expected.miles <- round(test.km / 1.609344, 3)
  expected.nm <- round(test.km / 1.852, 3)

  expect_equal(distConversion(test.km, from = "km", to = "miles"),  expected.miles)
  expect_equal(distConversion(test.km, from = "km", to = "nautical miles"), expected.nm)

  test.miles <- runif(100, max = 100)
  expected.km <- round(test.miles * 1.609344, 3)
  expected.nm <- round(test.miles * 1.609344 / 1.852, 3)

  expect_equal(distConversion(test.miles, from = "miles", to = "km"),  expected.km)
  expect_equal(distConversion(test.miles, from = "miles", to = "nautical miles"), expected.nm)

  # Output type
  expect_vector(distConversion(test.km, from = "km", to = "km"))
  expect_type(distConversion(test.miles, from = "miles", to = "km"), type = "double")

})

test_that("distConversion handles error correctly", {

  expect_length(distConversion(runif(100), to = "miles"), 100)
  expect_length(distConversion(runif(100), from = "nautical miles", to = "miles"), 100)
  expect_length(distConversion(runif(100), from = "km", to = "nautical miles"), 100)

  expect_type(distConversion(1:100, from = "km", to = "km"), "double")

  expect_error(distConversion("hello", from = "km", to = "miles"))
  expect_error(distConversion(13, from = "km", to = "lightyears"))
  expect_error(distConversion())
})
