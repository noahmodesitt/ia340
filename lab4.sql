--4.1
/* No because of the 1 to M relationship */

--4.2
/* No because 80 is not a valid fisp */

--4.3
/* just fine, can be improved */

--4.5
/* Yes, worked perfect*/

--4.6
WITH recent_year_income AS (
    SELECT fips, MAX(year) as recent_year
    FROM income
    GROUP BY fips
)
SELECT n.name, i.income, i.year
FROM income i
JOIN recent_year_income ryi ON i.fips = ryi.fips AND i.year = ryi.recent_year
JOIN name n ON i.fips = n.fips
ORDER BY i.income DESC
LIMIT 1;
/* It works */

--4.7
WITH yearly_va_population AS (
    SELECT 
        year, 
        pop,
        LAG(pop) OVER (ORDER BY year) AS previous_year_pop
    FROM population
    WHERE fips = '51'  -- FIPS code for Virginia
    ORDER BY year DESC
    LIMIT 6  -- Get data for the past 5 years and one year prior for growth calculation
)
SELECT 
    year,
    pop AS current_population,
    previous_year_pop,
    CASE 
        WHEN previous_year_pop IS NOT NULL THEN 
            ((pop - previous_year_pop) / previous_year_pop::float) * 100
        ELSE 
            NULL 
    END AS growth_rate
FROM yearly_va_population
WHERE previous_year_pop IS NOT NULL  -- Exclude the first row where there's no previous year
ORDER BY year DESC;

/*-- I modified the prompt to: calculate the population growth rate of each year for the past 5 years in va. */

--4.8
/* ChatGPT can for the most part produce accurate responses. Sometimes you may have to change tour wording for the system to respond correctly though.
Wording can effect what it produces which can lead to a wronf imput that causes errors/ */
