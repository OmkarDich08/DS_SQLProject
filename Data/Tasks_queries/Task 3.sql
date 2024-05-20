use fda_drug;

/* 1. Categorize Products by dosage form and analyze their distribution.*/    

CREATE VIEW ProductCategory AS
SELECT Dosage, Form, COUNT(*) AS ProductCount,
    SUM(Dosage) AS Total_Dosage,
    AVG(Dosage) AS Avg_Dosage
FROM product
GROUP BY Dosage, Form
ORDER BY Dosage, Form;
COMMIT;

/* 2. Calculate the total number of approvals for each dosage form and identify the most successful forms. */

CREATE VIEW successfulforms AS
SELECT Dosage, Form, drugname, COUNT(*) AS TotalApprovals
FROM product
GROUP BY Dosage, Form, drugname
ORDER BY TotalApprovals DESC;
COMMIT;

/* 3. Investigate yearly trends related to successful forms. */

CREATE VIEW YTrends_SuccForms AS
SELECT YEAR(r.ActionDate) AS ApprovalYear, p.Dosage, p.Form, p.drugname, COUNT(*) AS TotalApprovals
FROM regactiondate r
JOIN product p ON r.ApplNo = p.ApplNo
GROUP BY ApprovalYear, p.Dosage, p.Form, p.drugname
ORDER BY ApprovalYear DESC, TotalApprovals DESC;
COMMIT;
