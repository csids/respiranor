library(data.table)
library(magrittr)

# death ----

death_by_time <- fread(file.path("data-raw", "data_covid19_death_by_time_latest.csv"))
setnames(death_by_time, "n", "deaths_n")
death_by_time[, date_of_publishing := NULL]

hospital_by_time <- fread(file.path("data-raw", "data_covid19_hospital_by_time_latest.csv"))
setnames(hospital_by_time, "n_icu", "icu_admissions_n")
setnames(hospital_by_time, "n_hospital_main_cause", "hospital_admissions_main_cause_n")
hospital_by_time[, date_of_publishing := NULL]

lab_by_time <- fread(file.path("data-raw", "data_covid19_lab_by_time_latest.csv"))
setnames(lab_by_time, "n_neg", "testevents_neg_n")
setnames(lab_by_time, "n_pos", "testevents_pos_n")
setnames(lab_by_time, "pr100_pos", "testevents_pos_vs_all_pr100")
lab_by_time[, testevents_all_n := testevents_neg_n + testevents_pos_n]
lab_by_time[, date_of_publishing := NULL]

msis_by_time_location <- fread(file.path("data-raw", "data_covid19_msis_by_time_location_latest.csv"))
setnames(msis_by_time_location, "n", "cases_by_testdate_n")
setnames(msis_by_time_location, "pr100000", "cases_by_testdate_vs_pop_pr100000")


msis_by_time_location[, pop := NULL]
msis_by_time_location[, date_of_publishing := NULL]
msis_by_time_location[, location_name := NULL]

sysvak_by_time_location <- fread(file.path("data-raw", "data_covid19_sysvak_by_time_location_latest.csv"))
setnames(sysvak_by_time_location, "n_dose_1", "vax_dose_1_by_vaxdate_n")
setnames(sysvak_by_time_location, "n_dose_2", "vax_dose_2_by_vaxdate_n")
setnames(sysvak_by_time_location, "n_dose_3", "vax_dose_3_by_vaxdate_n")
setnames(sysvak_by_time_location, "n_dose_4", "vax_dose_4_by_vaxdate_n")

setnames(sysvak_by_time_location, "cum_n_dose_1", "vax_dose_1_by_vaxdate_sum0_999999_n")
setnames(sysvak_by_time_location, "cum_n_dose_2", "vax_dose_2_by_vaxdate_sum0_999999_n")
setnames(sysvak_by_time_location, "cum_n_dose_3", "vax_dose_3_by_vaxdate_sum0_999999_n")
setnames(sysvak_by_time_location, "cum_n_dose_4", "vax_dose_4_by_vaxdate_sum0_999999_n")

setnames(sysvak_by_time_location, "cum_pr100_dose_1", "vax_dose_1_by_vaxdate_sum0_999999_vs_pop_pr100")
setnames(sysvak_by_time_location, "cum_pr100_dose_2", "vax_dose_2_by_vaxdate_sum0_999999_vs_pop_pr100")
setnames(sysvak_by_time_location, "cum_pr100_dose_3", "vax_dose_3_by_vaxdate_sum0_999999_vs_pop_pr100")
setnames(sysvak_by_time_location, "cum_pr100_dose_4", "vax_dose_4_by_vaxdate_sum0_999999_vs_pop_pr100")

sysvak_by_time_location[, pop := NULL]
sysvak_by_time_location[, date_of_publishing := NULL]
sysvak_by_time_location[, location_name := NULL]

# needs to be looped (registration)
retval <- list()
for(i in fs::dir_ls(file.path("data-raw","data_covid19_sysvak_by_location"))){
  if(stringr::str_detect(i,".csv$")){
    xx <- stringr::str_extract(i,"[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]")
    if(!is.na(xx)){
      temp <- fread(i)
      if(nrow(temp)==0) print(i)
      retval[[i]] <- temp
      retval[[i]][, date_of_publishing := NULL]
      retval[[i]][, date_of_publishing := as.Date(xx)]
    }
  }
}
retval <- rbindlist(retval, use.names = T, fill=T)
setorder(retval, location_code, date_of_publishing)
retval[, vax_dose_1_by_regdate_n := n_dose_1 - shift(n_dose_1, type = "lag"), by=.(location_code)]
retval[vax_dose_1_by_regdate_n < 0, vax_dose_1_by_regdate_n := 0]
retval[, vax_dose_2_by_regdate_n := n_dose_2 - shift(n_dose_2, type = "lag"), by=.(location_code)]
retval[vax_dose_2_by_regdate_n < 0, vax_dose_2_by_regdate_n := 0]
retval[, vax_dose_3_by_regdate_n := n_dose_3 - shift(n_dose_3, type = "lag"), by=.(location_code)]
retval[vax_dose_3_by_regdate_n < 0, vax_dose_3_by_regdate_n := 0]
retval[, vax_dose_4_by_regdate_n := n_dose_4 - shift(n_dose_4, type = "lag"), by=.(location_code)]
retval[vax_dose_4_by_regdate_n < 0, vax_dose_4_by_regdate_n := 0]
retval[, date := date_of_publishing - 1]
data_covid19_sysvak_by_location <- retval[,.(
  date,
  location_code,
  vax_dose_1_by_regdate_n,
  vax_dose_2_by_regdate_n,
  vax_dose_3_by_regdate_n,
  vax_dose_4_by_regdate_n
)]

# needs to be looped (registration)
retval <- list()
for(i in fs::dir_ls(file.path("data-raw","data_covid19_msis_by_location"))){
  if(stringr::str_detect(i,".csv$")){
    xx <- stringr::str_extract(i,"[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]")
    if(!is.na(xx)){
      retval[[i]] <- fread(i)
      retval[[i]][, date_of_publishing := NULL]
      retval[[i]][, date_of_publishing := as.Date(xx)]
    }
  }
}
retval <- rbindlist(retval, use.names = T)
setorder(retval, location_code, date_of_publishing)
retval[, n_registered_on_this_date_in_msis := n - shift(n, type = "lag"), by=.(location_code)]
retval[, date := date_of_publishing - 1]
retval <- retval[,.(
  registration_date = date,
  location_code,
  n_registered_on_this_date_in_msis
)]
extra <- fread("data-raw/data_covid19_msis_by_location/data_covid19_msis_by_location__HISTORIC.csv")
extra[, registration_date := as.Date(registration_date)]
extra[,county_code := paste0("county",stringr::str_extract(location_code,"[0-9][0-9]"))]

extra_county <- extra[,.(
  n_registered_on_this_date_in_msis = sum(n_registered_on_this_date_in_msis)
), keyby=.(registration_date,county_code)]
setnames(extra_county, "county_code", "location_code")
extra_nation  <- extra[,.(
  n_registered_on_this_date_in_msis = sum(n_registered_on_this_date_in_msis)
), keyby=.(registration_date)]
extra_nation[, location_code := "norge"]

extra[, county_code := NULL]

retval <- retval[!registration_date %in% extra$registration_date]
data_covid19_msis_by_location <- rbind(extra, extra_county, extra_nation, retval)
data_covid19_msis_by_location <- data_covid19_msis_by_location[!is.na(n_registered_on_this_date_in_msis)]
setnames(data_covid19_msis_by_location, "n_registered_on_this_date_in_msis", "cases_by_regdate_n")
data_covid19_msis_by_location[cases_by_regdate_n < 0, cases_by_regdate_n := 0]

# skeleton
s_day <- expand.grid(
  date = seq(as.Date("2020-02-21"), as.Date("2022-11-13"), by = 1),
  location_code = unique(data_covid19_msis_by_location$location_code),
  stringsAsFactors = FALSE
) %>% setDT()

s_day[
  msis_by_time_location,
  on = c("date", "location_code"),
  c(
    "cases_by_testdate_n"
  ) :=
    .(
      cases_by_testdate_n
    )
]
s_day[location_code %in% msis_by_time_location$location_code & is.na(cases_by_testdate_n)]

s_day[
  data_covid19_msis_by_location,
  on = c("date==registration_date", "location_code"),
  c(
    "cases_by_regdate_n"
  ) :=
    .(
      cases_by_regdate_n
    )
]
s_day[location_code %in% data_covid19_msis_by_location$location_code & is.na(cases_by_regdate_n)]


s_day[
  hospital_by_time,
  on = c("date", "location_code"),
  c(
    "icu_admissions_n",
    "hospital_admissions_main_cause_n"
  ) :=
    .(
      icu_admissions_n,
      hospital_admissions_main_cause_n
    )
]
s_day[location_code %in% hospital_by_time$location_code & is.na(icu_admissions_n)]
s_day[location_code %in% hospital_by_time$location_code & is.na(hospital_admissions_main_cause_n)]

s_day[
  lab_by_time,
  on = c("date", "location_code"),
  c(
    "testevents_neg_n",
    "testevents_pos_n",
    "testevents_all_n"
  ) :=
    .(
      testevents_neg_n,
      testevents_pos_n,
      testevents_all_n
    )
]

s_day[
  sysvak_by_time_location,
  on = c("date", "location_code"),
  c(
    "vax_dose_1_by_vaxdate_n",
    "vax_dose_2_by_vaxdate_n",
    "vax_dose_3_by_vaxdate_n",
    "vax_dose_4_by_vaxdate_n",
    "vax_dose_1_by_vaxdate_sum0_999999_n",
    "vax_dose_2_by_vaxdate_sum0_999999_n",
    "vax_dose_3_by_vaxdate_sum0_999999_n",
    "vax_dose_4_by_vaxdate_sum0_999999_n"
  ) :=
    .(
      vax_dose_1_by_vaxdate_n,
      vax_dose_2_by_vaxdate_n,
      vax_dose_3_by_vaxdate_n,
      vax_dose_4_by_vaxdate_n,
      vax_dose_1_by_vaxdate_sum0_999999_n,
      vax_dose_2_by_vaxdate_sum0_999999_n,
      vax_dose_3_by_vaxdate_sum0_999999_n,
      vax_dose_4_by_vaxdate_sum0_999999_n
    )
]
s_day[location_code %in% sysvak_by_time_location$location_code & is.na(vax_dose_1_by_vaxdate_n)]
s_day[location_code %in% "norge" & is.na(vax_dose_1_by_vaxdate_n)]

s_day[
  data_covid19_sysvak_by_location,
  on = c("date", "location_code"),
  c(
    "vax_dose_1_by_regdate_n",
    "vax_dose_2_by_regdate_n",
    "vax_dose_3_by_regdate_n",
    "vax_dose_4_by_regdate_n"
  ) :=
    .(
      vax_dose_1_by_regdate_n,
      vax_dose_2_by_regdate_n,
      vax_dose_3_by_regdate_n,
      vax_dose_4_by_regdate_n
    )
]

registration_distributor <- function(x){
  retval <- x
  x_index_values <- which(!is.na(x))
  impute <- list()
  for(i in seq_along(x_index_values[-1])){
    imputation_start <- x_index_values[i]
    next_imputation_start <- x_index_values[i+1]
    imputation_end <- next_imputation_start - 1
    if(imputation_start == imputation_end) next()
    retval[imputation_start:imputation_end] <- round(x[imputation_start]/(imputation_end-imputation_start+1))
  }
  return(retval)
}
suma = function(x) if (all(is.na(x))) x[NA_integer_] else sum(x, na.rm = TRUE)

setorder(s_day, location_code, -date)
s_day[, cases_by_regdate_n := registration_distributor(cases_by_regdate_n), by=.(location_code)]
s_day[, vax_dose_1_by_regdate_n := registration_distributor(vax_dose_1_by_regdate_n), by=.(location_code)]
s_day[, vax_dose_2_by_regdate_n := registration_distributor(vax_dose_2_by_regdate_n), by=.(location_code)]
s_day[, vax_dose_3_by_regdate_n := registration_distributor(vax_dose_3_by_regdate_n), by=.(location_code)]
s_day[, vax_dose_4_by_regdate_n := registration_distributor(vax_dose_4_by_regdate_n), by=.(location_code)]

s_day[location_code=="county03",.(date,vax_dose_1_by_regdate_n)]
s_day[,location_code := stringr::str_replace(location_code, "county", "county_nor")]
s_day[,location_code := stringr::str_replace(location_code, "municip", "municip_nor")]
s_day[,location_code := stringr::str_replace(location_code, "norge", "nation_nor")]
s_day[, granularity_time := "date"]
s_day[, border := 2020]
s_day[, age := "total"]
s_day[, sex := "total"]
cstidy::set_csfmt_rts_data_v1(s_day)

s_isoweek <- s_day[,.(
  cases_by_testdate_n = suma(cases_by_testdate_n),
  cases_by_regdate_n = suma(cases_by_regdate_n),
  icu_admissions_n = suma(icu_admissions_n),
  hospital_admissions_main_cause_n = suma(hospital_admissions_main_cause_n),
  testevents_neg_n = suma(testevents_neg_n),
  testevents_pos_n = suma(testevents_pos_n),
  testevents_all_n = suma(testevents_all_n),
  vax_dose_1_by_vaxdate_n = suma(vax_dose_1_by_vaxdate_n),
  vax_dose_2_by_vaxdate_n = suma(vax_dose_2_by_vaxdate_n),
  vax_dose_3_by_vaxdate_n = suma(vax_dose_3_by_vaxdate_n),
  vax_dose_4_by_vaxdate_n = suma(vax_dose_4_by_vaxdate_n),
  vax_dose_1_by_vaxdate_sum0_999999_n = suma(vax_dose_1_by_vaxdate_sum0_999999_n),
  vax_dose_2_by_vaxdate_sum0_999999_n = suma(vax_dose_2_by_vaxdate_sum0_999999_n),
  vax_dose_3_by_vaxdate_sum0_999999_n = suma(vax_dose_3_by_vaxdate_sum0_999999_n),
  vax_dose_4_by_vaxdate_sum0_999999_n = suma(vax_dose_4_by_vaxdate_sum0_999999_n),
  vax_dose_1_by_regdate_n = suma(vax_dose_1_by_regdate_n),
  vax_dose_2_by_regdate_n = suma(vax_dose_2_by_regdate_n),
  vax_dose_3_by_regdate_n = suma(vax_dose_3_by_regdate_n),
  vax_dose_4_by_regdate_n = suma(vax_dose_4_by_regdate_n),
  granularity_time = "isoyearweek"
), by=.(location_code, isoyearweek, border, age, sex)]
cstidy::set_csfmt_rts_data_v1(s_isoweek)

d <- rbind(s_day,s_isoweek)
d[
  csdata::nor_population_by_age_cats(),
  on=c("location_code", "isoyear==calyear", "age", "sex"),
  pop_jan1_n := pop_jan1_n
]

d[, testevents_pos_vs_all_pr100 := round(100*testevents_pos_n/testevents_all_n, 2)]
d[testevents_all_n==0, testevents_pos_vs_all_pr100 := 0]
d[, cases_by_testdate_vs_pop_pr100000 := round(100000*cases_by_testdate_n/pop_jan1_n, 1)]
d[, cases_by_regdate_vs_pop_pr100000 := round(100000*cases_by_regdate_n/pop_jan1_n, 1)]

setcolorder(
  d,
  c(
    "granularity_time",
    "granularity_geo",
    "country_iso3",
    "location_code",
    "border",
    "age",
    "sex",
    "isoyear",
    "isoweek",
    "isoyearweek",
    "season",
    "seasonweek",
    "calyear",
    "calmonth",
    "calyearmonth",
    "date",
    "cases_by_testdate_n",
    "cases_by_testdate_vs_pop_pr100000",
    "cases_by_regdate_n",
    "cases_by_regdate_vs_pop_pr100000",
    "icu_admissions_n",
    "hospital_admissions_main_cause_n",
    "testevents_neg_n",
    "testevents_pos_n",
    "testevents_all_n",
    "testevents_pos_vs_all_pr100",
    "vax_dose_1_by_vaxdate_n",
    "vax_dose_2_by_vaxdate_n",
    "vax_dose_3_by_vaxdate_n",
    "vax_dose_4_by_vaxdate_n",
    "vax_dose_1_by_vaxdate_sum0_999999_n",
    "vax_dose_2_by_vaxdate_sum0_999999_n",
    "vax_dose_3_by_vaxdate_sum0_999999_n",
    "vax_dose_4_by_vaxdate_sum0_999999_n",
    "vax_dose_1_by_regdate_n",
    "vax_dose_2_by_regdate_n",
    "vax_dose_3_by_regdate_n",
    "vax_dose_4_by_regdate_n",
    "pop_jan1_n"
  )
)
d[
  csdata::nor_locations_names(),
  on = "location_code",
  c(
    "location_name",
    "location_name_description_nb"
  ) := .(
    location_name,
    location_name_description_nb
  )
]

# total <- d
total_b2020 <- d
cstidy::set_csfmt_rts_data_v1(total_b2020)
usethis::use_data(total_b2020, compress = "xz", version = 3, overwrite = TRUE)
