# Household Consumption and Expenditure Survey 2022-23

This repository consists of the clean data dump generated from the latest household consumption and expenditure survey (HCES), by the NSS. The raw microdata is publicly accessible and can be downloaded [here](https://microdata.gov.in/nada43/index.php/catalog/224).

## Repo Structure

The repository consists of the following files:

1. `01_docs`: This consists of all the survey documentation, including questionnaire, file structure, caveats, state codes etc
2. `02_code`: This has Stata do files which generate clean data files
3. `03_raw`: This consists of all the raw files, taken from the NSS site. User is supposed to create this
4. `04_clean`: This has all the level-wise cleaned files, in parquet format.

## Code

The folder `02_code` has the following files

1. `0_master.do`: Sets root directory, folder names etc
2. `1_clean.do`: Extracts all variables from raw txt files, by each level and preliminary cleaning
3. `2_mpce.do`: This has code to calculate and replicate sector and fractile wise MPCE
4. `convert_csv.ipynb`: Python code to convert csv to parquet and back


## Clean files

To generate the files in `04_output`, do the following

1. Download and unzip the repo
2. Create a folder called `3_raw` and add the raw txt files from the NSS site, available [here](https://microdata.gov.in/nada43/index.php/catalog/224). You should get 15 .txt files.
3. Open the state project `hces.stpr`. From within the project, run first `0_master`, followed by `1_clean`
4. This creates Stata and csv files for each level
5. [OPTIONAL] If you want to get Parquet files, run the `convert_csv` file (change directory as needed) to do so.
6. [FOR NON-STATA USERS] To convert the Parquet files to csv, open the `convert_csv` file and run the section which converts parquet to csv.

## Replicating Monthly Per Capita Expenditure numbers

To replicate MPCE numbers by sector and fractile from report, follow steps below:

1. Open `hces.stpr`
2. Run the whole `2_mpce.do` file after running `0_master`
3. Run till line 160, to get MPCE by rural and urban sectors
4. Run till line 223, to get MPCE by rural/urban for various fractiles.

These match the report numbers upto 2 decimal places.
