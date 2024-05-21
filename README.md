# DS_SQLProject
### SQL Data Analysis and Visualization with Power BI for FDA Data

**_Description_:**
- The U.S. Food and Drug Administration (FDA) is a federal agency responsible for safeguarding public health in the United States. It oversees various areas, including food safety, pharmaceuticals, medical devices, cosmetics, tobacco, and veterinary products. The FDA evaluates the safety and efficacy of drugs, biological products, and medical devices, conducts inspections, and enforces regulations. It also regulates food production and distribution, conducts research, provides public health education, and monitors and responds to emerging health risks. The FDA's mission is to protect and promote public health by ensuring the safety and effectiveness of a wide range of products and substances. iVision is collaborating with FDA to perform Data analysis on FDA’s dataset. FDA has provided iVision with SQL script of their dataset. As an analyst at iVision your role is to create informative reports by conducting a thorough analysis of the data using powerful tools like MySQL and Power BI.

**_Project Goals:_**

**- SQL Queries:**

**1. Identifying Approval Trends (Task 1.sql)**
  - Determine the number of drugs approved each year and provide insights into the yearly trends.
  - Identify the top three years that got the highest and lowest approvals, in descending and ascending order, respectively.
  - Explore approval trends over the years based on sponsors.
  - Rank sponsors based on the total number of approvals they received each year between 1939 and 1960.

**2. Segmentation Analysis Based on Drug MarketingStatus (Task 2.sql)**
  - Group products based on MarketingStatus. Provide meaningful insights into the segmentation patterns.
  - Calculate the total number of applications for each MarketingStatus year-wise after the year 2010.
  - Identify the top MarketingStatus with the maximum number of applications and analyze its trend over time.

**3. Analyzing Products (Task 3.sql)**
  - Categorize Products by dosage form and analyze their distribution.
  - Calculate the total number of approvals for each dosage form and identify the most successful forms.
  - Investigate yearly trends related to successful forms.
    
**4. Exploring Therapeutic Classes and Approval Trends (Task 4.sql)**
  - Analyze drug approvals based on therapeutic evaluation code (TE_Code).
  - Determine the therapeutic evaluation code (TE_Code) with the highest number of Approvals in each year.

**- Power BI Visualizations:**

  - Visualize the **yearly approval trends** of drugs. Highlight any significant patterns and/or fluctuations, if any.
  
  ![YearlyApprovalTrends](/Data/YAT.PNG)
  
  - Explore approval trends over the years based on **different sponsors**. Uncover patterns and changes in **approval rates** among sponsors.

  ![SegmentationAnalysis](/Data/SBAT.PNG)

  - Visualize the segmentation of products based on **MarketingStatus**.

   ![Marketing](/Data/MSPS.PNG) 

  - Show the **total number of applications** for each MarketingStatus. Enable users to filter by years and MarketingStatus for detailed analysis.

  ![FilteredMktStatus](/Data/FMS.PNG)

  - Analyze the **grouping** of drugs by dosage form. Visualize the **distribution of approvals** across different forms. Identify the **most successful dosage form**.

  ![DosageFormGrouping](/Data/DFG.PNG)

  - Visualize drug approvals based on **therapeutic classes**. Identify classes with the **highest number of approvals**.

   ![TECApprovals](/Data/TEC.PNG)

[Visualizations](https://app.powerbi.com/reportEmbed?reportId=abafcc74-4aea-47d3-9870-41f5299bac82&autoAuth=true&ctid=b83a511a-e5da-44e1-a5bd-2b03fa460cd2)




