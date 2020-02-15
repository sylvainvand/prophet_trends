#Transformation du CSV en liste de KW exploitable
trends <- get_data_trend(list_kws, 'FR')

# Récupération des trends
produits_prophet_trends <- prophet_kws(trends)

#Prédiction des trends
produits_prophet_max <- get_max(produits_prophet_trends)

#Jointure pour import Trello
pouet <- read_csv2('data/produits_can.csv')
jointure <- produits_prophet_max %>% left_join(pouet, by = c("keyword" = "kw"))
write_csv2(jointure, 'output/produits_prophet.csv')

#Jointure pour lecture humaine
max_calendar <- list_max(produits_prophet_max)
jointure <- max_calendar %>% left_join(pouet, by = c("keyword" = "kw"))
write_csv2(jointure, 'output/calendrier_prophet.csv')
