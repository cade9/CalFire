## takes landsat data in file format 
#LT050400372001050501T1-SC20181029140955.tar.gz
# untars and creates a new directory before the -
# For example the above file would result in a folder called 
# LT050400372001050501T1 with all the information contained in the .tar.gz file inside
landUntar <- function(x){
  .exdir = unlist(strsplit(x,"[-]"))[1]
  dir.create(.exdir)
  untar(x, exdir = path.expand(.exdir))
}
