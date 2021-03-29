allCrimes <- read.csv("persons-arrested-for-selected-major-offences-by-age-group.csv", stringsAsFactors = FALSE)
above21y_total <- subset(allCrimes, allCrimes$level_2 == "Above 21 Years Old" & startsWith(allCrimes$level_1, "Total"))
colnlist <- unique(above21y_total$level_1)
above21y_total_wide <- reshape(above21y_total, idvar="year", timevar="level_1", v.names="value", drop="level_2", direction="wide")
colnames(above21y_total_wide) <- c("year", colnlist)

under21y_total <- subset(allCrimes, allCrimes$level_2 == "21 Years Old And Below" & startsWith(allCrimes$level_1, "Total"))
under21y_total_wide <- reshape(under21y_total, idvar="year", timevar="level_1", v.names="value", drop="level_2", direction="wide")
colnames(under21y_total_wide) <- c("year", colnlist)

write.csv(above21y_total_wide, "total-persons-arrested-above21-wide.csv")
write.csv(under21y_total_wide, "total-persons-arrested-under21-wide.csv")
