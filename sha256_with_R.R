# Load digest library 
library(digest)

# Get the hash from your iso file
hash <- digest(file= "/path/to/your/iso/noble-desktop-amd64.iso", 
               algo = "sha256", serialize = F)

# Get the hash from the online reference 
url <- "https://cdimage.ubuntu.com/kubuntu/daily-live/current/SHA256SUMS" # for example
# hs <- read.csv(url, stringsAsFactors = F)
# Read the hash from the url
hs <- readLines(url, warn = FALSE)

library(stringr)
# Filter the extracted to get only the first part
ash_sha256 <- str_extract(hs, "[0-9a-fA-F]{64}")

# Compare both
hash == ash_sha256
