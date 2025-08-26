## Making summary tables for our serological data by cohort.
### Generating summaries for vaccine cohort serological data.

bovinen1_vaccine <- # making table with geomean and geo sd summaries for ELISA bovine N1 IgG titers. 
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine N1 IgG titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("elisa_bovineN1_0", "elisa_bovineN1_28"), 
    group_var = "age_group", 
    digits = 2),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine N1 IgG titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("elisa_bovineN1_0", "elisa_bovineN1_28"), 
      group_var = "sex", 
      digits = 2),
    by = join_by("elisa_bovineN1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "elisa_bovineN1_0_geo_mean",
                 "elisa_bovineN1_28_geo_sd",
                 "elisa_bovineN1_28_geo_mean",
                 "age_group" == "sex"))
names(bovinen1_vaccine)[names(bovinen1_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
bovinen1_vaccine <- bovinen1_vaccine |> new_table() # re-formatting for exporting!


bovineh5_vaccine <- # making table with geomean and geo sd summaries for ELISA bovine H5 IgG titers. 
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine h5 IgG titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("elisa_bovineH5_0", "elisa_bovineH5_28"), 
    group_var = "age_group", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA bovine h5 IgG titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("elisa_bovineH5_0", "elisa_bovineH5_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("elisa_bovineH5_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "elisa_bovineH5_0_geo_mean",
                 "elisa_bovineH5_28_geo_sd",
                 "elisa_bovineH5_28_geo_mean",
                 "age_group" == "sex"))
names(bovineh5_vaccine)[names(bovineh5_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
bovineh5_vaccine <- bovineh5_vaccine |> new_table() # re-formatting for exporting!


cal09n1_vaccine <- 
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA N1Cal09  IgG titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("elisa_N1Cal09_0", "elisa_N1Cal09_28"), 
    group_var = "age_group", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for ELISA N1Cal09 IgG titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("elisa_N1Cal09_0", "elisa_N1Cal09_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("elisa_N1Cal09_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "elisa_N1Cal09_0_geo_mean",
                 "elisa_N1Cal09_28_geo_sd",
                 "elisa_N1Cal09_28_geo_mean",
                 "age_group" == "sex"))
names(cal09n1_vaccine)[names(cal09n1_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
cal09n1_vaccine <- cal09n1_vaccine |> new_table() # re-formatting for exporting!

h1n1nt50_vaccine <- # calculating geometric mean and geometric standard deviation for NT50 responses to A/H1N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("NT50_h1n1_0", "NT50_h1n1_28"), 
    group_var = "age_group", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("NT50_h1n1_0", "NT50_h1n1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("NT50_h1n1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "NT50_h1n1_0_geo_mean",
                 "NT50_h1n1_28_geo_sd",
                 "NT50_h1n1_28_geo_mean",
                 "age_group" == "sex"))
names(h1n1nt50_vaccine)[names(h1n1nt50_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
h1n1nt50_vaccine <- h1n1nt50_vaccine |> new_table() # re-formatting for exporting!

h5n1nt50_vaccine <- # calculating geometric mean and geometric standard deviation for NT50 responses to A/H5N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("NT50_h5n1_0", "NT50_h5n1_28"), 
    group_var = "age_group", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NT50 titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("NT50_h5n1_0", "NT50_h5n1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("NT50_h5n1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "NT50_h5n1_0_geo_mean",
                 "NT50_h5n1_28_geo_sd",
                 "NT50_h5n1_28_geo_mean",
                 "age_group" == "sex"))
names(h5n1nt50_vaccine)[names(h5n1nt50_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
h5n1nt50_vaccine <- h5n1nt50_vaccine |> new_table() # re-formatting for exporting!

ellah1n1_vaccine <- # calculating geometric mean and geometric standard deviation for ELLA NAI responses to A/H1N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NAI titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("ella_h1n1_0", "ella_h1n1_28"), 
    group_var = "age_group", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H1N1 NAI titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("ella_h1n1_0", "ella_h1n1_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("ella_h1n1_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "ella_h1n1_0_geo_mean",
                 "ella_h1n1_28_geo_sd",
                 "ella_h1n1_28_geo_mean",
                 "age_group" == "sex"))
names(ellah1n1_vaccine)[names(ellah1n1_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
ellah1n1_vaccine <- ellah1n1_vaccine |> new_table() # re-formatting for exporting!


ellah5n1_vaccine <-# calculating geometric mean and geometric standard deviation for ELLA NAI responses to A/H5N1.
  full_join(x = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H5N1 NAI titers using the function we made above..
    data = subset(data, data$cohort == "vaccinated"), 
    numeric_vars = c("ella_h5n1laiv_0", "ella_h5n1laiv_28"), 
    group_var = "age_group", 
    digits = 3),
    y = geometric_summary_with_total( # calculating geometric mean and geometric standard deviation for H5N1 NAI titers using the function we made above..
      data = subset(data, data$cohort == "vaccinated"),
      numeric_vars = c("ella_h5n1laiv_0", "ella_h5n1laiv_28"), 
      group_var = "sex", 
      digits = 3),
    by = join_by("ella_h5n1laiv_0_geo_sd", # joining our two data tables and removing the duplicate "All" row that contains the full summary.
                 "ella_h5n1laiv_0_geo_mean",
                 "ella_h5n1laiv_28_geo_sd",
                 "ella_h5n1laiv_28_geo_mean",
                 "age_group" == "sex"))
names(ellah5n1_vaccine)[names(ellah5n1_vaccine) == 'age_group'] <- 'group' # changing name of column to group to represent both subsets.
ellah5n1_vaccine <- ellah5n1_vaccine |> new_table() # re-formatting for exporting!

vaccine_compile <- # compiling smaller dataframes to consolidate all of the above tables!
  full_join(x = bovineh5_vaccine,
            y = bovinen1_vaccine,
            by = c("group")) |>
  full_join(x = cal09n1_vaccine,
            by = c("group")) |>
  full_join(x = h1n1nt50_vaccine,
            by = c("group")) |>
  full_join(x = h5n1nt50_vaccine,
            by = c("group")) |>
  full_join(x = ellah1n1_vaccine,
            by = c("group")) |>
  full_join(x = ellah5n1_vaccine,
            by = c("group"))

write_csv(x = vaccine_compile, file = "output/vaccine_summary_data.csv") # exporting our summary table for the vaccine cohort to a .csv file.  