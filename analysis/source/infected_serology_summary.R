## Making summary tables for our serological data by cohort.
### Generating summaries for infection cohort serological data.

bovinen1_infection <- # making table with geomean and geo sd summaries for ELISA bovine N1 IgG titers. 
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine N1 IgG titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("elisa_bovineN1_0", "elisa_bovineN1_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine N1 IgG titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("elisa_bovineN1_0", "elisa_bovineN1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("elisa_bovineN1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "elisa_bovineN1_0_geo_mean",
                 "elisa_bovineN1_28_geo_sd",
                 "elisa_bovineN1_28_geo_mean",
                 "infected_subtype" == "sex"))
names(bovinen1_infection)[names(bovinen1_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
bovinen1_infection <- bovinen1_infection |> new_table() # re-formatting for exporting!


bovineh5_infection <- # making table with geomean and geo sd summaries for ELISA bovine H5 IgG titers. 
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine h5 IgG titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("elisa_bovineH5_0", "elisa_bovineH5_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine h5 IgG titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("elisa_bovineH5_0", "elisa_bovineH5_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("elisa_bovineH5_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "elisa_bovineH5_0_geo_mean",
                 "elisa_bovineH5_28_geo_sd",
                 "elisa_bovineH5_28_geo_mean",
                 "infected_subtype" == "sex"))
names(bovineh5_infection)[names(bovineh5_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
bovineh5_infection <- bovineh5_infection |> new_table() # re-formatting for exporting!




cal09n1_infection <- 
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA N1Cal09  IgG titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("elisa_N1Cal09_0", "elisa_N1Cal09_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA N1Cal09 IgG titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("elisa_N1Cal09_0", "elisa_N1Cal09_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("elisa_N1Cal09_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "elisa_N1Cal09_0_geo_mean",
                 "elisa_N1Cal09_28_geo_sd",
                 "elisa_N1Cal09_28_geo_mean",
                 "infected_subtype" == "sex"))
names(cal09n1_infection)[names(cal09n1_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
cal09n1_infection <- cal09n1_infection |> new_table() # re-formatting for exporting!



h1n1nt50_infection <- # calculating geometric mean and geometric standard deviation for NT50 responses to A/H1N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("NT50_h1n1_0", "NT50_h1n1_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("NT50_h1n1_0", "NT50_h1n1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("NT50_h1n1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "NT50_h1n1_0_geo_mean",
                 "NT50_h1n1_28_geo_sd",
                 "NT50_h1n1_28_geo_mean",
                 "infected_subtype" == "sex"))
names(h1n1nt50_infection)[names(h1n1nt50_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
h1n1nt50_infection <- h1n1nt50_infection |> new_table() # re-formatting for exporting!



h5n1nt50_infection <- # calculating geometric mean and geometric standard deviation for NT50 responses to A/H5N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("NT50_h5n1_0", "NT50_h5n1_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("NT50_h5n1_0", "NT50_h5n1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("NT50_h5n1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "NT50_h5n1_0_geo_mean",
                 "NT50_h5n1_28_geo_sd",
                 "NT50_h5n1_28_geo_mean",
                 "infected_subtype" == "sex"))
names(h5n1nt50_infection)[names(h5n1nt50_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
h5n1nt50_infection <- h5n1nt50_infection |> new_table() # re-formatting for exporting!


ellah1n1_infection <- # calculating geometric mean and geometric standard deviation for ELLA NAI responses to A/H1N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NAI titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("ella_h1n1_0", "ella_h1n1_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NAI titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("ella_h1n1_0", "ella_h1n1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("ella_h1n1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "ella_h1n1_0_geo_mean",
                 "ella_h1n1_28_geo_sd",
                 "ella_h1n1_28_geo_mean",
                 "infected_subtype" == "sex"))
names(ellah1n1_infection)[names(ellah1n1_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
ellah1n1_infection <- ellah1n1_infection |> new_table() # re-formatting for exporting!


ellah5n1_infection <-# calculating geometric mean and geometric standard deviation for ELLA NAI responses to A/H5N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H5N1 NAI titers using the function we made above..
    data = subset(data, data$cohort == "infected"), 
    numeric_vars = c("ella_h5n1laiv_0", "ella_h5n1laiv_28"), 
    group_var = "infected_subtype", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H5N1 NAI titers using the function we made above..
      data = subset(data, data$cohort == "infected"),
      numeric_vars = c("ella_h5n1laiv_0", "ella_h5n1laiv_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("ella_h5n1laiv_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "ella_h5n1laiv_0_geo_mean",
                 "ella_h5n1laiv_28_geo_sd",
                 "ella_h5n1laiv_28_geo_mean",
                 "infected_subtype" == "sex"))
names(ellah5n1_infection)[names(ellah5n1_infection) == 'infected_subtype'] <- 'group' # changing name of column to group to represent both subsets.
ellah5n1_infection <- ellah5n1_infection |> new_table() # re-formatting for exporting!

infection_compile <- # compiling smaller dataframes to consolidate all of the above tables!
  full_join(x = bovineh5_infection,
            y = bovinen1_infection,
            by = c("group")) |>
  full_join(x = cal09n1_infection,
            by = c("group")) |>
  full_join(x = h1n1nt50_infection,
            by = c("group")) |>
  full_join(x = h5n1nt50_infection,
            by = c("group")) |>
  full_join(x = ellah1n1_infection,
            by = c("group")) |>
  full_join(x = ellah5n1_infection,
            by = c("group"))

write_csv(x = infection_compile, file = "output/infection_summary_data.csv") # exporting our summary table for the infection cohort to a .csv file.