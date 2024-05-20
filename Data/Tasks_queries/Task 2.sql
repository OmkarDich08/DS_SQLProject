use fda_drug;

/* 1. Group products based on MarketingStatus. Provide meaningful insights into the segmentation patterns.*/

CREATE VIEW MktStatus AS
SELECT ProductMktStatus, Form, drugname, Dosage,
COUNT(*) AS ApprovedDrugs
FROM product
GROUP BY ProductMktStatus, Form, drugname, Dosage;
COMMIT;

/* 2. Calculate the total number of applications for each MarketingStatus year-wise after the year 2010*/

CREATE VIEW YWise_AppAfter_2010 AS
SELECT YEAR(r.ActionDate) AS ApplicationYear, p.ProductMktStatus, p.ApplNo, COUNT(*) AS TotalApplications
FROM regactiondate r
JOIN product p ON r.ApplNo = p.ApplNo    
WHERE YEAR(r.ActionDate) > 2010
GROUP BY ApplicationYear, p.ProductMktStatus, p.ApplNo
ORDER BY ApplicationYear, TotalApplications;
COMMIT;

/* 3. Identify the top MarketingStatus with the maximum number of applications and analyze its trend over time. */    
    CREATE VIEW TopMarketingStatus AS
    WITH TopMarketingStatus AS (
    SELECT ProductMktStatus, COUNT(*) AS TotalApplications
    FROM product
    GROUP BY ProductMktStatus
    ORDER BY TotalApplications DESC
    LIMIT 1
)
SELECT YEAR(r.ActionDate) AS ApplicationYear, p.ApplNo, COUNT(*) AS TotalApplications
FROM regactiondate r 
JOIN product p ON r.ApplNo = p.ApplNo        
WHERE p.ProductMktStatus = (SELECT p.ProductMktStatus FROM TopMarketingStatus)
GROUP BY ApplicationYear, p.ProductMktStatus, p.ApplNo
ORDER BY ApplicationYear, TotalApplications;
COMMIT;    
  