# Data dictionary

## `wildlife_impacts.csv`

FAA wildlife strike reports for American, Delta, Southwest, and United Airlines, 1990-2018. Source: [TidyTuesday, July 23, 2019](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-07-23). 56,978 rows, 19 variables. `airport_id` and `species_id` from the original data were dropped because they repeat `airport` and `species`.

| variable | class | description |
|:---|:---|:---|
| `incident_date` | date | Date of the strike |
| `state` | character | State where the strike happened (N/A for outside the US) |
| `airport` | character | Airport name |
| `operator` | character | Airline |
| `atype` | character | Aircraft type (for example A-320, B-737-800) |
| `type_eng` | character | Engine type: A = piston, B = turbojet, C = turboprop, D = turbofan, F = turboshaft |
| `species` | character | Species of wildlife that was hit |
| `damage` | character | Damage level: N = none, M = minor, M? = uncertain, S = substantial, D = destroyed |
| `num_engs` | double | Number of engines |
| `incident_month` | double | Month of the strike |
| `incident_year` | double | Year of the strike |
| `time_of_day` | character | Dawn, Day, Dusk, or Night |
| `time` | double | Time of the strike (24-hour clock, hhmm) |
| `height` | double | Height of the plane at impact (feet above ground) |
| `speed` | double | Speed of the plane at impact (knots) |
| `phase_of_flt` | character | Phase of flight at impact (take-off run, climb, approach, ...) |
| `sky` | character | Sky condition: No Cloud, Some Cloud, Overcast |
| `precip` | character | Precipitation: None, Fog, Rain, Snow, or combinations |
| `cost_repairs_infl_adj` | double | Repair cost in dollars, adjusted for inflation |

## `wildlife_clean.rds`

Created by `R/clean-data.R`. Strikes with missing `damage` are removed (52,654 rows), and these variables are added:

| variable | class | description |
|:---|:---|:---|
| `damaged` | factor | "Yes" if `damage` is M, M?, S, or D; "No" if N |
| `phase` | factor | `phase_of_flt` with capitalization fixed, keeping the 5 main phases: Take-off run, Climb, Descent, Approach, Landing roll (other phases are NA) |
| `height_bin` | factor | `height` grouped into 0 ft, 1-500 ft, 501-1,000 ft, 1,001-3,000 ft, Over 3,000 ft |
| `bird_size` | factor | Small, Medium, or Large, from species labels like "Unknown bird - small" (NA otherwise) |

`time_of_day` is also turned into a factor (Dawn, Day, Dusk, Night) and `operator` is changed to title case.
