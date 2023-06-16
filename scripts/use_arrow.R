# Using arrow format for data
# From a post on r/rstats
library("duckdb")
library("arrow")
library("dplyr")
csv_file <- here::here("data", "war_required_shuffle.csv")
con <- dbConnect(duckdb(), dbdir = ":memory:")
open_csv_dataset(csv_file) |>
  to_duckdb(con, "warsim")

tbl(con, "warsim") |> summarise(N=n())
