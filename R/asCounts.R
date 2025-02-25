#' Create a Counts measure wrapper.
#'
#' Method for constructing a Continuous wrapper.
#' @param measure. Measure to wrap. Must be either Numeric or Ordinal.
#' @return Continuous variable wrapped around @param measure.
#' @export
#' asCounts()
setGeneric("asCounts", function(measure) standardGeneric("asCounts"))
setMethod("asCounts", signature("Measure"), function(measure)
{
  # Create new Counts wrapper
  counts = Counts(measure=measure)

  # Return handle to Continuous wrapper
  counts
})
setMethod("asCounts", signature("Measure"), function(measure)
{
  # Create new Counts wrapper
  counts = Counts(measure=measure)

  # Return handle to Counts wrapper
  counts
})
