library(leaflet)
library(leaflet.extras)
library(leaflet.extras2)

#Creamos el elemento con la Ubicaci?n por defecto
map <- leaflet() %>% setView(lng = -5.6641, lat = 40.9650, zoom = 12) 

#Modicamos el mapa base anterior
map %>% addTiles()%>%
  
  # A?adir distintos proveedores de mapas (puedes usar names(providers)  verlos todos)
  addProviderTiles(
    "OpenStreetMap", #Nombre del proveedor
    group = "OpenStreetMap" #Nombre en el selector
  ) %>%
  addProviderTiles(
    "Esri.WorldImagery",
    group = "World Imagery"
  ) %>%
  # A?ade el control
  addLayersControl(
    baseGroups = c(
      "OpenStreetMap",  "World Imagery"
    ),

    position = "topright"
    )%>%
  
  #A?ade un minimapa
  addMiniMap(toggleDisplay = TRUE) %>% 
  
  #A?ade el geocoder
  removeSearchOSM()  %>%
  addSearchOSM(options = searchOptions(autoCollapse = TRUE, minLength = 2, position = "topright"))%>% 
 
  #A?ade un editor de capas
  addDrawToolbar(targetGroup='datos',
  editOptions = editToolbarOptions(selectedPathOptions = selectedPathOptions()))%>% 
  
  #A?ade un bot?n de zoom general
   addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(5); }"), position = "topright")) %>% 
  
  #A?ade un bot?n para ubicar al usuario
  addEasyButton(easyButton(
    icon="fa-crosshairs", title="Locate Me",
    onClick=JS("function(btn, map){ map.locate({setView: true}); }"), position = "topright")) 


