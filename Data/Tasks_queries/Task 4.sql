use fda_drug;

/* 1. Analyze drug approvals based on therapeutic evaluation code (TE_Code).*/

CREATE VIEW TECode_approvals AS
WITH TE_Code AS (
SELECT ISNULL(TECode,'NA') AS TECode
FROM product 
)
SELECT p.TECode, p.ProductMktStatus, p.ProductNo , COUNT(*) AS TotalApprovals,
    MIN(r.ActionDate) AS EarliestApproval,
    MAX(r.ActionDate) AS LatestApproval
FROM regactiondate r
JOIN product p ON r.ApplNo = p.ApplNo    
GROUP BY p.TECode, p.ProductMktStatus, p.ProductNo
ORDER BY TotalApprovals DESC;
COMMIT;

/* 2. Determine the therapeutic evaluation code (TE_Code) with the highest number of Approvals in each year.*/

CREATE VIEW HighestTEApprovalsbyYear AS
WITH RankedApprovals AS (
    SELECT TECode, YEAR(r.ActionDate) AS ApprovalYear, COUNT(*) AS TotalApprovals,
        RANK() OVER (PARTITION BY YEAR(r.ActionDate) ORDER BY COUNT(*) DESC) AS ApprovalRank
    FROM regactiondate r
    JOIN product p ON r.ApplNo = p.ApplNo   
    GROUP BY ApprovalYear, TECode
)
SELECT ApprovalYear, TECode, TotalApprovals
FROM RankedApprovals
WHERE ApprovalRank = 1;
COMMIT;
