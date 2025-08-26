# Calculating summary values for serological assay readouts by cohort
This tutorial will allow you to generate the geometric means and geometric standard deviations that are reported in tables 1 and 2 in Werner et al., 2025 (DOI: XXXXXX)

### Running in terminal
This code can be run in either R or directly from the terminal. This tutorial will walk through running the code and associated data files directly from terminal, but the same can be translated into R or RStudio.
#### Downloading files
First, we will clone this repo locally so you can run it on your own device without issue. To do this, open a terminal window and run the following:

```zsh
git clone https://github.com/anniewerner/werner_et_al_2025
```

Running this will download the analysis directory, which contains source and output sub-directories to populate with the tables we generate. You can confirm that everything has been installed properly by changing your working directory and opening it to see if all expected files are present.

```zsh
cd analysis
ls
ls source
```

The corresponding output should be:

```zsh
output source
data.csv  infected_serology_summary.R  loading_packages.R  summary_tabs.R  vaccinated_serology_summary.R
```

In the source folder, we have the data mastersheet, `data.csv`, and our three R scripts that will generate our serology summaries.
Since everything we need is downloaded, we can finally run the code!

#### Running R scripts
To run these scripts from CLI, we will need to start an R shell. To do this, directly into your CLI/terminal window, simply enter `R`.

Disclaimer: this README does not go into detail about how each R script works, as each script is annotated individually. Please refer to each individual scripts for documentation.

```r
source("source/loading_packages.R")
```
if you already have all packages downloaded, the only output you should expect to see is that confirming that the ```data.csv``` file has been properly read.
  
```r
Rows: 73 Columns: 28                                                          
── Column specification ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (6): study_id, cohort, age_group, sex, infected_subtype, infected_clade
dbl (22): age, birth_year, NT50_h1n1_0, auc_h1n1_0, NT50_h1n1_28, auc_h1n1_2...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

Then, we can define our functions needed to make these tables.
```r
source("source/summary_tabs.R")
```

Now that everything is configured for us to make our tables, all we have to do is enter the following two lines into the R shell in terminal
```r
source("source/vaccinated_serology_summary.R")
source("source/infected_serology_summary.R")
q() # this is to quit out of R since we have finished running the required code!
```

Back in our terminal window, we can confirm that our scripts have successfully generated our tables by opening up the `analysis/output` directory. It should now have two files.
```zsh
ls output
```
If the code worked, we expect to see the following output:
```zsh
infection_summary_data.csv vaccine_summary_data.csv
```
