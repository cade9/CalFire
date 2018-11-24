# takes a raster file name
# a reclass matrix - check raster::reclassify documentation
# appendName - the ending user wants to add for each different matrix/reclassification
severityIndex <- function(rasterFile,reclass_m,appendName){
  # input dNBR image
  dNbr <- raster(rasterFile)
  # reclassify
  fireSeverity <- reclassify(dNbr,reclass_m)
  # create output name
  # ~! This need to be updated to be more streamlined
  
  rname = paste0(file_path_sans_ext(rasterFile),"_",appendName)
  writeRaster(fireSeverity, rname, format = "GTiff", overwrite = T)
  rm(dNbr)
  rm(fireSeverity)
  removeTmpFiles(h=0)
}