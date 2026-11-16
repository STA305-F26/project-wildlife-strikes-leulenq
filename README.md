What Makes a Bird Strike Damaging?
================
Leul Enquanhone

## Summary

**Dataset.** I used FAA wildlife strike reports for the four largest US
airlines (American, Delta, Southwest, and United) from 1990 to 2018,
shared through TidyTuesday (July 23, 2019). Each row is one reported
strike. The original data has 56,978 strikes; I dropped two ID columns,
leaving 19 variables. After removing strikes with no damage information,
52,654 strikes were left. The data dictionary is in
[`data/README.md`](data/README.md).

**Research question.** When a plane hits a bird, what makes it more
likely that the plane gets damaged? I started out looking at height and
phase of flight. Exploring the data showed that planes higher up are
also flying faster, so the question became: **is a strike more dangerous
because the plane is high, or because it is fast?**

**Methodology.** I recoded damage into Yes/No, fixed inconsistent
phase-of-flight labels, and grouped height into bins. I compared damage
rates across phase of flight, height, speed, and bird size with summary
tables and bar plots. Then I fit logistic regression models with damage
as the response, using the 26,005 strikes with both height and speed
recorded, and reported odds ratios with 95% confidence intervals.

**Findings.**

- About 7.6% of reported strikes damaged the aircraft.
- Strikes higher up look more damaging on their own, but height and
  speed are strongly linked.
- With both in the model, each extra 10 knots of speed multiplies the
  odds of damage by about 1.08 (95% CI 1.06 to 1.1), while the odds
  ratio for each extra 1,000 feet is 0.99 (95% CI 0.96 to 1.02). So
  **speed matters and height does not** once speed is accounted for.
- Bird size also matters a lot: 35% of strikes with large birds caused
  damage, compared to 1.4% for small birds.

**Limitations.** Reporting is voluntary and changed over time: reports
went up from a few hundred a year in the early 1990s to almost 4,000 in
2018 while the share with damage went down, which probably means more
minor strikes were reported later. About half of the strikes are missing
height or speed. The results are associations, not causes.

## Repo organization

- `presentation.Rmd` / `presentation.pdf`: presentation slides
- `proposal/`: project proposal (Sections 1-3)
- `analysis/`: exploratory plots (`eda.Rmd`) and logistic regression
  (`model.Rmd`)
- `R/clean-data.R`: cleaning script that creates
  `data/wildlife_clean.rds`
- `data/`: raw data (`wildlife_impacts.csv`), cleaned data, and data
  dictionary

## Data source

FAA Wildlife Strike Database, via TidyTuesday:
<https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-07-23>
