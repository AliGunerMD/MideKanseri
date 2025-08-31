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
