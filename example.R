# ============================================================================
# SIDR Package Demo Script - SIMPLE VERSION
# ============================================================================

# Install the package from GitHub (if not already installed)
# remotes::install_github("jhusidr/sidr", dependencies = TRUE, force=TRUE)

# Load the package
library(sidr)

# ============================================================================
# 1. LOAD DATA
# ============================================================================

# Just load a dataset - everything else is handled automatically
asthma_data <- load_sidr_data("adult_asthma_by_race")

# That's it! The function automatically:
# - Sets up the data directory if needed
# - Downloads the data if not already present  
# - Loads it into R with helpful information

# View the data
head(asthma_data)

# ============================================================================
# 2. BROWSE AVAILABLE DATASETS
# ============================================================================

# See what datasets are available
list_sidr_datasets()

# Search for specific topics
list_sidr_datasets("air_pollution")
list_sidr_datasets("health")

# ============================================================================
# 3. LOAD MORE DATA
# ============================================================================

# Load health professional shortage area data
hpsa_data <- load_sidr_data("hpsa_score")

# Load food access data
food_data <- load_sidr_data("food_access_2019")

# Load without messages
landfill_data <- load_sidr_data("landfills", show_info = FALSE)

# ============================================================================
# 4. WORK WITH RACE/ETHNICITY DATA
# ============================================================================

# Many datasets include race/ethnicity breakdowns
flu_vax_data <- load_sidr_data("flu_vaccinations_preventable_hospital_days_by_race_2023")

# ============================================================================
# 5. BATCH LOADING
# ============================================================================

# Load multiple air pollution datasets
air_pollution_indicators <- c(
  "air_pollution_pm25_concentration",
  "air_pollution_o3_concentration"
)

air_data_list <- lapply(air_pollution_indicators, function(indicator) {
  load_sidr_data(indicator, show_info = FALSE)
})

# ============================================================================
# OPTIONAL: MORE CONTROL
# ============================================================================

# If you want more control, you can use these functions:

# Check your access level
check_access()

# Get detailed list of available datasets
all_datasets <- get_available_datasets()

# Download multiple datasets at once (without loading)
download_sidr_data(c("adult_asthma_by_race", "hpsa_score", "landfills"))

# Initialize with custom directory
initialize_sidr(data_dir = "~/my_custom_sidr_data")
