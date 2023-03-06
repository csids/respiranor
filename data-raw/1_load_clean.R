# death ----

death_by_time <- read.csv(system.file("rawdata", "data_covid19_death_by_time_latest.csv",
                              package = "covidnor"))

death_by_time <- data.table::setDT(death_by_time)
death_by_time
save(death_by_time, file = "data/death_by_time.rda", compress = "xz")


# demographics ----

demographics <- read.csv(system.file("rawdata", "data_covid19_demographics_latest.csv",
                                      package = "covidnor"))

demographics <- data.table::setDT(demographics)
demographics
save(demographics, file = "data/demographics.rda", compress = "xz")



# hospital_by_time ----

hospital_by_time <- read.csv(system.file("rawdata", "data_covid19_hospital_by_time_latest.csv",
                                     package = "covidnor"))

hospital_by_time <- data.table::setDT(hospital_by_time)
hospital_by_time
save(hospital_by_time, file = "data/hospital_by_time.rda", compress = "xz")


# lab_by_time ----


lab_by_time <- read.csv(system.file("rawdata", "data_covid19_lab_by_time_latest.csv",
                                     package = "covidnor"))

lab_by_time <- data.table::setDT(lab_by_time)
lab_by_time
save(lab_by_time, file = "data/lab_by_time.rda", compress = "xz")

# msis_by_location ----


msis_by_location <- read.csv(system.file("rawdata", "data_covid19_msis_by_location_latest.csv",
                                     package = "covidnor"))

msis_by_location <- data.table::setDT(msis_by_location)
msis_by_location
save(msis_by_location, file = "data/msis_by_location.rda", compress = "xz")

# msis_by_time_location -----


msis_by_time_location <- read.csv(system.file("rawdata", "data_covid19_msis_by_time_location_latest.csv",
                                     package = "covidnor"))

msis_by_time_location <- data.table::setDT(msis_by_time_location)
msis_by_time_location
save(msis_by_time_location, file = "data/msis_by_time_location.rda", compress = "xz")

# msis_by_time_location ----

msis_by_time_location <- read.csv(system.file("rawdata", "data_covid19_msis_by_time_location_latest.csv",
                                     package = "covidnor"))

msis_by_time_location <- data.table::setDT(msis_by_time_location)
msis_by_time_location
save(msis_by_time_location, file = "data/msis_by_time_location.rda", compress = "xz")


# sysvak_by_location_sex_age ----

sysvak_by_location_sex_age <- read.csv(system.file("rawdata", "data_covid19_sysvak_by_location_sex_age_latest.csv",
                                     package = "covidnor"))

sysvak_by_location_sex_age <- data.table::setDT(sysvak_by_location_sex_age)
sysvak_by_location_sex_age
save(sysvak_by_location_sex_age, file = "data/sysvak_by_location_sex_age.rda", compress = "xz")


# sysvak_by_time_location ----

sysvak_by_time_location <- read.csv(system.file("rawdata", "data_covid19_sysvak_by_time_location_latest.csv",
                                     package = "covidnor"))

sysvak_by_time_location <- data.table::setDT(sysvak_by_time_location)
sysvak_by_time_location
save(sysvak_by_time_location, file = "data/sysvak_by_time_location.rda", compress = "xz")


