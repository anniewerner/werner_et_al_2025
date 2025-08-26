# making function that will generate three pivot tables, one for each assay type.

pivot_data <- function(data) {
  
  pivot_elisa <- # pivot table with only ELISA data.
    data %>%
    select(!(contains("_0")|contains("_28")), # selecting only relevant columns from the mastersheet.
           starts_with("elisa_")) %>% 
    pivot_longer(
      cols = starts_with("elisa_"),
      names_to = c("DISCARD", "antigen", "timepoint"),
      names_sep = "_",
      values_to = "endpoint_titer"
    ) %>%
    mutate(
      antigen = recode(antigen,
                       "bovineH5" = "H5BovineTx24", # re-naming all three antigens just for neatness!
                       "bovineN1" = "N1BovineTx24",
                       "N1Cal09" = "N1Cal09"),
      log10_endpoint = log10(endpoint_titer) # calculating log10-transformed endpoint titers.
    ) %>%
    select(!DISCARD) # removing irrelevant column generated during pivoting.
  
  pivot_ella <- # pivot table with only ELLA data.
    data %>%
    select(!(contains("_0")|contains("_28")), # selecting only relevant columns from the mastersheet.
           starts_with("ella_")) %>%
    pivot_longer(
      cols = starts_with("ella_"),
      names_to = c("DISCARD", "virus", "timepoint"),
      names_sep = "_",
      values_to = "nai50"
    ) %>%
    mutate(
      virus = recode(virus,
                     "h5n1laiv" = "h5n1"), # re-naming only the h5n1laiv readouts for concistency with NT50 readouts.
      log10_nai50 = log10(nai50) # calculating log10-transformed NAI50 titers.
    ) %>%
    select(!DISCARD) # removing irrelevant column generated during pivoting.
  
  pivot_nt50 <-
    data %>%
    select(!(contains("_0")|contains("_28")),
           starts_with("NT50_")) %>%
    pivot_longer(
      cols = starts_with("NT50_"),
      names_to = c("DISCARD", "virus", "timepoint"),
      names_sep = "_",
      values_to = "nt50"
    ) %>%
    mutate(
      log2_nt50 = log2(nt50) # calculating log2-transformed NT50 titers
    ) %>%
    select(!DISCARD) # removing irrelevant column generated during pivoting.
  
  listed_dfs <- list(
    elisa = pivot_elisa,
    ella = pivot_ella,
    nt50 = pivot_nt50) 
  
  return(list2env(listed_dfs, envir = .GlobalEnv)) 
  
}