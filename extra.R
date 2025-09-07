# Gerekli kütüphaneleri yükleme
library(tidyverse)

# Klasör yapısını belirleme
folders <- c(
        "statik",
        "statik/hastalar",
        "statik/hastalar/adenoca",
        "statik/hastalar/gist", 
        "statik/hastalar/net",
        "statik/hastalar/lenfoma",
        "statik/hastalar/diger",
        "statik/doktorlar",
        "statik/doktorlar/kilavuzlar",
        "statik/doktorlar/makaleler",
        "blog",
        "blog/posts",
        "statik/diger",
        "statik/diger/ozofagus",
        "statik/diger/gerd",
        "statik/diger/herni", 
        "statik/diger/pankreas",
        "statik/belgeler",
        "statik/about",
        "statik/iletisim",
        "assets",
        "assets/css",
        "assets/js",
        "assets/images",
        "_site"
)

# Klasörleri oluşturma ve her birine index.qmd dosyası ekleme
walk(folders, function(folder) {
        dir_create(file.path(folder))
        # index.qmd dosyasını oluşturma
        index_content <- c(
                "---",
                "title: \"", basename(folder), "\"",  # Başlık
                "---",
                "",
                "# ", basename(folder), " Sayfası",  # Sayfa başlığı
                "",
                "Bu sayfa henüz içerikle doldurulmamıştır."
        )
        
        writeLines(index_content, file.path(folder, "index.qmd"))
        cat("📁", folder, "ve index.qmd dosyası oluşturuldu.\n")
})










# Convert to webp
# library(webp)
# Function to convert images to webp format
convert_images_to_webp <- function(input_directory, output_directory) {
        # Create output directory if it doesn't exist
        if (!dir.exists(output_directory)) {
                dir.create(output_directory)
        }
        
        # List all image files in the input directory
        image_files <- list.files(input_directory, pattern = "\\.(jpg|jpeg|png)$", full.names = TRUE)
        
        # Loop through each image file and convert to WebP
        for (image_file in image_files) {
                # Get the file name without extension
                file_name <- tools::file_path_sans_ext(basename(image_file))
                
                # Define the output file path
                output_file <- file.path(output_directory, paste0(file_name, ".webp"))
                
                # Convert the image to WebP format
                webp::write_webp(image_file, output_file)
                
                cat(paste("Converted:", image_file, "to", output_file, "\n"))
        }
}


convert_images_to_webp(here::here("assets/images"), here::here("assets/images"))


library(imager)


convert_single_image_to_webp <- function(input_file, output_file) {
     
        img <- load.image(input_file)
        
        # WebP formatına kaydet
        write_webp(img, output_file)
        
        cat(paste("Converted:", input_file, "to", output_file, "\n"))
}

convert_single_image_to_webp("assets/images/ag_profile.png", "assets/images/ag_profile.webp")
