# Development .Rprofile for testing sidr package
# This loads the local development version of sidr from jh-sidr-tools

# Auto-load devtools if available
if (interactive()) {
  suppressMessages(require(devtools))
  cat("✓ devtools loaded for development\n")
}

# Path to the local sidr package
.sidr_dev_path <- "~/code/jh-sidr-tools"

# Override library() to auto-load the local package during development
.sidr_development_mode <- TRUE

# Store the original library function
.original_library <- base::library

# Create custom library function for development
library <- function(package, ...) {
  pkg_name <- as.character(substitute(package))
  
  # If loading sidr/sidrtools and in development mode, use load_all instead
  if (pkg_name %in% c("sidr", "sidrtools") && exists(".sidr_development_mode") && .sidr_development_mode) {
    if (requireNamespace("devtools", quietly = TRUE)) {
      sidr_path <- path.expand(.sidr_dev_path)
      if (dir.exists(sidr_path)) {
        cat("📦 Loading local development version of", pkg_name, "from", sidr_path, "\n")
        devtools::load_all(sidr_path, quiet = FALSE)
        cat("✓ Local", pkg_name, "package loaded\n")
      } else {
        warning("Local sidr package not found at ", sidr_path, ". Using installed version.")
        .original_library(package = package, ...)
      }
    } else {
      warning("devtools not installed. Install it for development mode.")
      .original_library(package = package, ...)
    }
  } else {
    # Use original library function for all other packages
    .original_library(package = package, ...)
  }
}

# Helpful development shortcuts
reload_sidr <- function() {
  sidr_path <- path.expand(.sidr_dev_path)
  devtools::load_all(sidr_path)
  cat("✓ sidr package reloaded from", sidr_path, "\n")
}

document_sidr <- function() {
  sidr_path <- path.expand(.sidr_dev_path)
  devtools::document(sidr_path)
  cat("✓ sidr documentation updated\n")
}

test_sidr <- function() {
  sidr_path <- path.expand(.sidr_dev_path)
  devtools::test(sidr_path)
}

check_sidr <- function() {
  sidr_path <- path.expand(.sidr_dev_path)
  devtools::check(sidr_path)
}

install_sidr <- function() {
  sidr_path <- path.expand(.sidr_dev_path)
  devtools::install(sidr_path)
  cat("✓ sidr package installed from local development version\n")
}

# Print development environment message
if (interactive()) {
  cat("\n")
  cat("🚀 SIDR Example Project - Development Mode\n")
  cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
  cat("• library(sidr) or library(sidrtools) → loads from ~/code/jh-sidr-tools\n")
  cat("• reload_sidr()    → reload the sidr package\n")
  cat("• document_sidr()  → update sidr documentation\n")
  cat("• test_sidr()      → run sidr tests\n")
  cat("• check_sidr()     → run R CMD check on sidr\n")
  cat("• install_sidr()   → install sidr locally\n")
  cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
}