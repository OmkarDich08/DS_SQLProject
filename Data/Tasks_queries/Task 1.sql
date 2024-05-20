use fda_drug;

/* 1. Determine the number of drugs approved each year and provide insights into the yearly trends.*/

CREATE VIEW drugs_approved_each_year AS
SELECT YEAR(ActionDate) AS approval_year, COUNT(*) AS number_of_drugs_approved
FROM regactiondate
GROUP BY YEAR(ActionDate)
ORDER BY approval_year;

COMMIT;

/* 2. Identify the top three years that got the highest and lowest approvals, in descending and ascending order, respectively. */

-- Top three years with the highest number of approvals
CREATE VIEW Top_3_Highest_Approvals AS
SELECT YEAR(ActionDate) AS approval_year, COUNT(*) AS number_of_drugs_approved
FROM regactiondate
GROUP BY YEAR(ActionDate)
ORDER BY number_of_drugs_approved DESC
LIMIT 3;
COMMIT;

-- Top three years with the lowest number of approvals
CREATE VIEW Top_3_Lowest_Approvals AS
SELECT YEAR(ActionDate) AS approval_year, COUNT(*) AS number_of_drugs_approved
FROM regactiondate
GROUP BY YEAR(ActionDate)
ORDER BY number_of_drugs_approved ASC
LIMIT 3;
COMMIT;

/* 3. Explore approval trends over the years based on sponsors. */

CREATE VIEW sponsor_approval_trends AS
SELECT YEAR(r.ActionDate) AS approval_year, a.SponsorApplicant, a.ActionType, COUNT(*) AS approval_count
FROM regactiondate r
JOIN application a ON r.ApplNo = a.ApplNo
GROUP BY approval_year, a.SponsorApplicant, a.ActionType
ORDER BY approval_year, approval_count;
COMMIT;
  
/* 4. Rank sponsors based on the total number of approvals they received each year between 1939 and 1960. */
 
CREATE VIEW sponsors_rank AS
SELECT YEAR(r.ActionDate) AS approval_year, a.SponsorApplicant, a.ActionType,
RANK() OVER (PARTITION BY YEAR(approval_year) ORDER BY COUNT(*) DESC) AS approval_rank
FROM regactiondate r
JOIN application a ON r.ApplNo = a.ApplNo
WHERE YEAR(r.ActionDate) BETWEEN 1939 AND 1960
GROUP BY approval_year, a.SponsorApplicant, a.ActionType
ORDER BY approval_year, approval_rank;
COMMIT;

    