# Household Consumption and Expenditure Survey 2022-23

This repository consists of the clean data dump generated from the latest household consumption and expenditure survey (HCES), by the NSS. The raw microdata is publicly accessible and can be downloaded [here][https://microdata.gov.in/nada43/index.php/catalog/194].

## Repo Structure

The repository consists of the following files:

1. `01_docs`: This consists of all the survey documentation, including questionnaire, file structure, caveats, state codes etc
2. `02_code`: This has Stata do files which generate clean data files
3. `03_raw`: This consists of all the raw files, taken from the NSS site
4. `04_clean`: This has all the level-wise cleaned dta files

## Code

The folder `02_code` has the following files

1. `0_master.do`: Sets root directory, folder names etc
2. `1_clean.do`: Extracts all variables from raw txt files, by each level and preliminary cleaning

## Replication

To generate the files in `04_output`, do the following

1. Download and unzip the repo
2. Open the state project `hces.stpr`. From within the project, open the two files in `02_code`
3. Run both files.

## Important Note

This is just the level wise data dump. Further cleaning is still needed. For instance, certain dummy variables need to be recoded, variables need to be labelled, and categorical variables need to be encoded. I will be working on this over the next few days, so stay tuned!

