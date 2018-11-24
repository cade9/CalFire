stackLandsat <- function(myFolder,outSF){
  # list all bands ending in sr_band
  bands <- list.files(myFolder,  pattern = "sr_band", full.names = T)
  # read in as a stack
  myImage <- stack(bands)
  # create output name for raster #"(?=L)(.)+(?=\\_sr)"
  imgName <- str_extract(myFolder,"(?=L)(.)+")
  outName <- paste0(outSF,"//",imgName,"_stack")
  # write raster
  writeRaster(myImage,outName, format ="GTiff", overwrite = T)
  # remove temporary files
  rm(myImage)
  removeTmpFiles(h=0)
}
