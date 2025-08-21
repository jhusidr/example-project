# JH SIDR Example Project

This repository contains examples demonstrating how to use the `sidr` R package for accessing Johns Hopkins Social Interventions and Determinants of Health Research (SIDR) data.

## Overview

The SIDR package provides easy access to public health datasets from the Johns Hopkins SIDR project. This example project shows you how to:
- Load datasets with a single function call
- Browse available data
- Work with race/ethnicity stratified data
- Perform batch operations
- And more!

## Installation

First, install the SIDR package from GitHub:

```r
# Install remotes package if you don't have it
if (!require("remotes")) {
  install.packages("remotes")
}

# Install the sidr package with dependencies
remotes::install_github("jhusidr/sidr", dependencies = TRUE)
```

## Quick Start

```r
library(sidr)

# Load a dataset - it's this simple!
asthma_data <- load_sidr_data("adult_asthma_by_race")

# Browse available datasets
list_sidr_datasets()

# Search for specific topics
list_sidr_datasets("health")
```

## Example Script

The `example.R` file in this repository contains comprehensive examples showing all package functionality:

1. **Simple data loading** - Just one function call
2. **Browsing datasets** - Pretty-printed lists with search
3. **Loading multiple datasets** - Various health and environmental data
4. **Race/ethnicity data** - Working with stratified datasets
5. **Batch operations** - Loading multiple related datasets
6. **Advanced options** - Custom directories and manual control

## Running the Examples

To run the examples:

1. Clone this repository:
```bash
git clone https://github.com/yourusername/jh-sidr-example-project.git
cd jh-sidr-example-project
```

2. Open R in the project directory

3. Run the example script:
```r
source("example.R")
```

Or run sections interactively in RStudio.

## Key Functions Demonstrated

### `load_sidr_data()`
The main function that handles everything automatically:
- Creates data directory if needed
- Downloads data if not present
- Loads into R with helpful messages

### `list_sidr_datasets()`
Browse available datasets with:
- Pretty formatting
- Search capability
- Clear usage instructions

### `get_available_datasets()`
Get detailed information about all datasets as a data frame for programmatic use.

### `download_sidr_data()`
Download multiple datasets at once without loading them.

## Available Data Topics

The SIDR data includes indicators related to:
- **Health outcomes** - Asthma, flu vaccinations, cancer risk
- **Healthcare access** - Distance to hospitals, health professional shortage areas
- **Environmental factors** - Air pollution (PM2.5, O3), landfills
- **Food access** - Food deserts and access to groceries
- **Social determinants** - Historic school data, healthcare disparities

Many datasets include race/ethnicity breakdowns for:
- Hispanic/Latino
- White
- Black
- American Indian/Alaska Native
- Native Hawaiian/Pacific Islander
- Asian

## Data Directory

By default, data is stored in `~/.sidr_data`. You can customize this:

```r
# Use a custom directory
initialize_sidr(data_dir = "~/my_sidr_data")

# Or specify when loading
load_sidr_data("adult_asthma_by_race", data_dir = "~/my_sidr_data")
```

## Development Setup

If you're developing with the SIDR package locally, this project includes an `.Rprofile` that:
- Loads the development version from `~/code/jh-sidr-tools`
- Provides helper functions like `reload_sidr()` and `document_sidr()`
- Makes testing and development easier

## Resources

- [SIDR Package Repository](https://github.com/jhusidr/sidr)
- [SIDR Public Data](https://github.com/jhusidr/data)
- [Johns Hopkins Biostatistics Center](https://publichealth.jhu.edu/johns-hopkins-biostatistics-center)

## License

This example project is provided as-is for educational purposes.

## Authors

Example project created by Erik Westlund of the [Johns Hopkins Biostatistics Center](https://publichealth.jhu.edu/johns-hopkins-biostatistics-center) at the [Johns Hopkins School of Public Health](https://publichealth.jhu.edu).