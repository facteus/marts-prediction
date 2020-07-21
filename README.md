# MARTS prediction

## Signal panel

We predict the US Census Bureau Monthly Retail Trade Survey using
Signal data.

### Predictions

The most current and performant methodology can be found in the
`marts-prediction-zipcode-weighted` notebook. Run `marts-fetch-data`
first to update historical MARTS report, then follow the notebook to
make the latest predictions.

### Performance tracking

For a quick overview of how well our forecasts performed, look at
`marts-predictions-track-record` notebook. This notebook depends on
`marts-prediction-track-record.xlsx` Excel file where I recorded
historical forecasts.

### Other files

The notebook `marts-prediction-old-school` contains a previous version
of the forecasting methodology which doesn't rely on geographic
reweighting.  It's included because it has nicer charts and more
background on how everything works.

Current methodology doesn't play with seasonal adjustments because it
works from year-over-year data. Despite that,
`marts-fetch-seasonal-adjustments` is included because it is a pain to
parse the seasonal data from Census website and I wouldn't want to
write that from scratch again.

## Alpha panel

The `alpha` notebook contains code examining the least noisy subsets
of Alpha data by correlating them with MARTS. If you want to skip
straight to the conclusions, go directly to the very bottom of the
notebook.
