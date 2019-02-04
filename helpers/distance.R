distance <- function(x, y, z){
  #x is a df with lat, long
  #y is a df with lat, long
  #z is a df with row id of y
  library(rgeos)
  library(sp)
  set1sp <- SpatialPoints(as.matrix(x))
  set2sp <- SpatialPointsDataFrame(as.matrix(y), z, match.ID = "city")
  return(apply(gDistance(set2sp,set1sp, byid=TRUE), 1, which.min))
}