# defining functions used to generate summary tables that indicate the geometric mean and geometric standard deviation of each data subset.

# function to generate summary tables.
geometric_summary_with_total <- function(data, 
                                         numeric_vars, 
                                         group_var = NULL,
                                         total_label = "All",
                                         digits = 1) {
  
  # Helper functions
  geo_mean <- function(x) exp(mean(log(x[x > 0]), na.rm = TRUE))
  geo_sd <- function(x) exp(sd(log(x[x > 0]), na.rm = TRUE))
  
  # Validate numeric variables
  numeric_vars <- numeric_vars[numeric_vars %in% names(data)]
  if (length(numeric_vars) == 0) {
    stop("No valid numeric variables provided.")
  }
  
  # Computing the summary
  compute_summary <- function(df) {
    summarise(df,
              across(all_of(numeric_vars),
                     list(geo_mean = ~geo_mean(.x),
                          geo_sd = ~geo_sd(.x)),
                     .names = "{.col}_{.fn}"))
  }
  
  # Compute group-level summary
  if (!is.null(group_var)) {
    if (!group_var %in% names(data)) {
      stop("The group_var must match a column name present in the data.")
    }
    
    grouped_summary <- data %>%
      group_by(.data[[group_var]]) %>%
      compute_summary() %>%
      ungroup()
    
    # Compute overall summary
    total_summary <- compute_summary(data)
    total_summary[[group_var]] <- total_label
    
    # Bind together
    summary_table <- bind_rows(grouped_summary, total_summary)
    
    # Reorder to put the total row at the bottom
    summary_table <- summary_table %>%
      arrange(match(.data[[group_var]], c(setdiff(unique(data[[group_var]]), NA), total_label)))
    
  } else {
    # If no group_var, just return overall summary
    summary_table <- compute_summary(data)
  }
  
  # Round numeric columns to the specified number of digits.
  numeric_cols <- names(summary_table)[sapply(summary_table, is.numeric)]
  summary_table[numeric_cols] <- lapply(summary_table[numeric_cols], round, digits = digits)
  
  return(summary_table)
}

# function to re-format the summary table into the final output format shown in Werner et al., 2025.
new_table<-function(summary_table) {
  
  # determine which column names we will use for making our re-formatted table, based on string pattern in column headers.
  group <- names(summary_table)[str_detect(names(summary_table), "group")]
  geomean_col_0 <- names(summary_table)[str_detect(names(summary_table), "0_geo_mean")]
  geosd_col_0 <- names(summary_table)[str_detect(names(summary_table), "0_geo_sd")]
  
  geomean_col_28 <- names(summary_table)[str_detect(names(summary_table), "28_geo_mean")]
  geosd_col_28 <- names(summary_table)[str_detect(names(summary_table), "28_geo_sd")]
  
  # capturing relevant column names (as symbols)
  geomean_col_0 <- ensym(geomean_col_0)
  geosd_col_0 <- ensym(geosd_col_0)
  
  geomean_col_28 <- ensym(geomean_col_28)
  geosd_col_28 <- ensym(geosd_col_28)
  
  geomean_0_name <- as_string(geomean_col_0)
  geosd_0_name <- as_string(geosd_col_0)
  
  geomean_28_name <- as_string(geomean_col_28)
  geosd_28_name <- as_string(geosd_col_28)
  
  # Keep "assay_" prefix (i.e., the readout type from indicated assay), and remove "_geo_mean" suffix for conciseness.
  new_col_0_name <- str_remove(geomean_0_name,"_geo_mean$")
  new_col_28_name <- str_remove(geomean_28_name,"_geo_mean$")
  
  summary_table |>
    mutate(
      !!new_col_0_name := paste0(
        sprintf("%.2f", .data[[geomean_0_name]]),
        " (",
        sprintf("%.2f", .data[[geosd_0_name]]),
        ")"
      )
    ) |>
    mutate(
      !!new_col_28_name := paste0(
        sprintf("%.2f", .data[[geomean_28_name]]),
        " (",
        sprintf("%.2f", .data[[geosd_28_name]]),
        ")"
      )
    ) |>
    select(any_of(c(group,
                    new_col_0_name, 
                    new_col_28_name)))
}