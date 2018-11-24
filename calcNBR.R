calcNBR <- function(img,outDir){
  # name of image
  imgName <- str_extract(img,"(?=L)(.)+(?=\\_stack)")
  # extract landsat type (is it landsat 5 or landsat 8)
  LandsatType <- str_extract(imgName,"(?=L)(.){1,4}")
  # read in imagery
  myImage <- stack(img) # i
  
  # rename bands depending on if L5 or L8
  if (LandsatType  == "LT05") {
    names(myImage) <- c("Blue","Green","Red","NIR","SWIR1","SWIR2")
  } else {
    names(myImage) <- c("CA","Blue","Green","Red","NIR","SWIR1","SWIR2")
  }
  
  # spectral indices
  # CHeck that I used the correct SWIR band
  L8nbri <- spectralIndices(myImage, nir = "NIR", swir3 ="SWIR1", indices = "NBRI")
  
  # raster name 
  outName <- paste0(outDir,"//",imgName,"_nbr")
  # write raster
  writeRaster(L8nbri,outName, format ="GTiff", overwrite = T)
  rm(myImage)
  rm(L8nbri)
  removeTmpFiles(h=0)
  
}