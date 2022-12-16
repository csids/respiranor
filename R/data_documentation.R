# death by time ----
#' COVID-19 weekly number of death in Norway
#'
#' This dataset contains weekly number of death in Norway,
#' from 2020 week 8 (2020-02-23) to 2022 week 45 (2022-11-13)
#'
#' @format
#' \describe{
#' \item{granularity_time}{Time granularity: isoweek}
#' \item{granularity_geo}{Geographical granularity: nation}
#' \item{location_code}{Location code: norge}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: total}
#' \item{sex}{Sex category: total}
#' \item{year}{Year of data registration}
#' \item{week}{ISO week of data registration}
#' \item{yrwk}{Year week of data registration}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{date}{Date of data registration}
#' \item{n}{Number of cases}
#' \item{date_of_publishing}{Date of data release: 2022-11-11}
#' }
"death_by_time"


# demographics ----
#' COVID-19 total number of death in Norway by age and sex
#'
#' This dataset contains total number of death in Norway caused by COVID-19
#'
#' @format
#' \describe{
#' \item{granularity_time}{Time granularity: total}
#' \item{granularity_geo}{Geographical granularity: nation}
#' \item{location_code}{Location code: norge}
#' \item{border}{Municipality border. All 2020}
#' \item{age}{Age category: 0-39, 40-49, 50-59, 60-69, 70-79, 80-89, 90+}
#' \item{sex}{Sex category: male, female}
#' \item{year}{1900, i.e. of all time}
#' \item{week}{1, i.e. of all time}
#' \item{yrwk}{1900-01, i.e. of all time}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{date}{1900-01-01, i.e. of all time}
#' \item{n}{Number of cases}
#' \item{date_of_publishing}{Date of data release}
#' \item{tag_outcome}{Outcome tag. Death}
#' }
"demographics"


# hospital by time ----

#' COVID-19 daily number of hospitalisation and ICU admissions in Norway
#'
#' This dataset contains daily number of COVID-19 hospitalisation and ICU admissions in Norway,
#' from 2020-02-21 to 2022-11-10
#'
#' @format
#' \describe{
#' \item{granularity_time}{Time granularity: day}
#' \item{granularity_geo}{Geographical granularity: nation}
#' \item{location_code}{Location code: norge}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: total}
#' \item{sex}{Sex category: total}
#' \item{year}{Year of data registration}
#' \item{week}{ISO week of data registration}
#' \item{yrwk}{Year week of data registration}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{date}{Date of data registration}
#' \item{n_icu}{Number of ICU admissions}
#' \item{n_hospital_main_cause}{Number of hospitalisation where COVID-19 is the main cause}
#' \item{date_of_publishing}{Date of data release}
#' }
"hospital_by_time"


# lab by time ----
#' COVID-19 daily number of tested in Norway
#'
#' This dataset contains daily number of tested (positive, negative) in Norway,
#' from 2020-04-01 to 2022-11-10
#'
#' @format
#' \describe{
#' \item{granularity_time}{Time granularity: day}
#' \item{granularity_geo}{Geographical granularity: nation}
#' \item{location_code}{Location code: norge}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: total}
#' \item{sex}{Sex category: total}
#' \item{year}{Year of data registration}
#' \item{week}{ISO week of data registration}
#' \item{yrwk}{Year week of data registration}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{date}{Date of data registration}
#' \item{n_neg}{Number of negative COVID tests}
#' \item{n_pos}{Number of positive COVID tests}
#' \item{pr100_pos}{Percentage of positive tests of all tests}
#' \item{date_of_publishing}{Date of data release}
#' }
"lab_by_time"


# msis by location -----
#' MSIS confirmed COVID-19 cases of all time in Norway
#'
#' This dataset contains MSIS confirmed COVID-19 cases of all time in national, county and municipality levels.
#'
#' @format
#' \describe{
#' \item{location_code}{Location code in Norway}
#' \item{date}{1900-01-01, i.e. of all time}
#' \item{n}{Number of cases}
#' \item{granularity_time}{Time granularity: total}
#' \item{granularity_geo}{Geographical granularity: nation, county, municip}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: total}
#' \item{sex}{Sex category: total}
#' \item{year}{1900, i.e. of all time}
#' \item{week}{1, i.e. of all time}
#' \item{yrwk}{1900-01, i.e. of all time}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{date}{1900-01-01, i.e. of all time}
#' \item{pop}{Population}
#' \item{pr100000}{Number of cases per 100 000 population}
#' \item{location_name}{Location name, matches location code}
#' \item{date_of_publishing}{Date of data release}
#' }
"msis_by_location"




# msis by time location ----
#' Daily MSIS confirmed COVID-19 cases in Norway
#'
#' This dataset contains daily MSIS confirmed COVID-19 cases in national, county and municipality levels,
#' from 2020-02-21 to 2022-11-10
#'
#' @format
#' \describe{
#' \item{location_code}{Location code in Norway}
#' \item{date}{Date of data registration}
#' \item{n}{Number of cases}
#' \item{granularity_time}{Time granularity: total}
#' \item{granularity_geo}{Geographical granularity: nation, county, municip}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: total}
#' \item{sex}{Sex category: total}
#' \item{year}{Year of data registration}
#' \item{week}{ISO week of data registration}
#' \item{yrwk}{Year week of data registration}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{pop}{Population}
#' \item{pr100000}{Number of cases per 100 000 population}
#' \item{location_name}{Location name, matches location code}
#' \item{date_of_publishing}{Date of data release}
#' }
"msis_by_time_location"



# sysvak by location sex age ----
#' Vaccination in Norway of all time by sex and age
#'
#' This dataset contains total vaccination of 1st, 2nd, 3rd and 4th dose in national, county and municipality levels, categorised by age groups and sex.
#'
#'
#' @format
#' \describe{
#' \item{granularity_time}{Time granularity: total}
#' \item{granularity_geo}{Geographical granularity: nation, county, municip}
#' \item{location_code}{Location code in Norway}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: 12-15, 16-17, 18-24, 25-39, 40-44, 45-54, 55-64, 65-74, 75-79, 80-84, above 85}
#' \item{sex}{Sex category: male, female}
#' \item{year}{1900, i.e. of all time}
#' \item{week}{1, i.e. of all time}
#' \item{yrwk}{1900-01, i.e. of all time}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{date}{1900-01-01, i.e. of all time}
#' \item{n_dose_1}{Number of dose 1}
#' \item{n_dose_2}{Number of dose 2}
#' \item{n_dose_3}{Number of dose 3}
#' \item{n_dose_4}{Number of dose 4}
#' \item{pr100_dose_1}{Percentage of dose 1}
#' \item{pr100_dose_2}{Percentage of dose 2}
#' \item{pr100_dose_3}{Percentage of dose 3}
#' \item{pr100_dose_4}{Percentage of dose 4}
#' \item{pop}{Population}
#' \item{location_name}{Location name, matches location code}
#' \item{date_of_publishing}{Date of data release}
#' }
"sysvak_by_location_sex_age"






# sysvak by time location ----

#' Daily vaccination in Norway
#'
#' This dataset contains daily and cumulative vaccination of 1st, 2nd, 3rd and 4th dose in national, county and municipality levels,
#' from 2020-12-02 to 2022-11-10.
#'
#' @format
#' \describe{
#' \item{granularity_time}{Time granularity: day}
#' \item{granularity_geo}{Geographical granularity: nation, county, municip}
#' \item{location_code}{Location code in Norway}
#' \item{border}{Municipality border: 2020}
#' \item{age}{Age category: total}
#' \item{sex}{Sex category: total}
#' \item{year}{Year of data registration}
#' \item{week}{ISO week of data registration}
#' \item{yrwk}{Year week of data registration}
#' \item{season}{Influenza season}
#' \item{x}{Season week}
#' \item{n_dose_1}{Number of dose 1}
#' \item{n_dose_2}{Number of dose 2}
#' \item{n_dose_3}{Number of dose 3}
#' \item{n_dose_4}{Number of dose 4}
#' \item{cum_n_dose_1}{Cumulative number of dose 1}
#' \item{cum_n_dose_2}{Cumulative number of dose 2}
#' \item{cum_n_dose_3}{Cumulative number of dose 3}
#' \item{cum_n_dose_4}{Cumulative number of dose 4}
#' \item{cum_pr100_dose_1}{Cumulative percentage of dose 1}
#' \item{cum_pr100_dose_2}{Cumulative percentage of dose 2}
#' \item{cum_pr100_dose_3}{Cumulative percentage of dose 3}
#' \item{cum_pr100_dose_4}{Cumulative percentage of dose 4}
#' \item{pop}{Population}
#' \item{location_name}{Location name, matches location code}
#' \item{date_of_publishing}{Date of data release}
#' }
"sysvak_by_time_location"


