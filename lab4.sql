--4.1
*/ No because of the 1 to M relationship */

--4.2
*/ No because 80 is not a valid fisp */

--4.3
*/ just fine */

--4.6
*/ It worked perfect */
SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
WHERE i.year = (SELECT MAX(year) FROM income)
ORDER BY i.income DESC
LIMIT 1;

--4.7
*/-- calculate the VA population growth rate in the past five
years. I did not modify it to get better results. */

--4.8
