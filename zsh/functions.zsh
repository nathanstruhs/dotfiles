# Git
gcm() { git commit -m "$1" }
gcam() { git commit -am "$1" }
gco() { git checkout "$1" }

# Mkdir and cd into directory
mcd() { mkdir -p "$1" && cd "$1" }