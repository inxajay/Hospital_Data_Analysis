CREATE TABLE Hospital(
	Hospital_Name VARCHAR(50),
	Location VARCHAR(50),
	Department VARCHAR(50),
	Doctors_Count NUMERIC,
	Patients_Count NUMERIC,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)

);

SELECT * FROM Hospital

--import data through direct method


--Hospital Data Analysis

-- Q1. Total Number of Patients?
	 
	 SELECT SUM(patients_count) AS total_patients
     FROM Hospital;

--Business Problem Solved: Hospital management lacks visibility on the total number of patients treated,making resource planning and decision-making difficult.

--Business Impact: Knowing the total patients helps allocate staff, beds, and budget more effectively while improving revenue forecasting.

-----------------------------------------------------------------------------------------------------------------------------------------------	   

-- Q2. Average Number of Doctors per Hospital?
SELECT hospital_name,
	ROUND(AVG(doctors_count)) AS avg_doctors
FROM Hospital
GROUP BY hospital_name;


--Business Problem Solved: Lack of clarity on average doctors per hospital causes imbalance in workload.

--Business Impact: Helps optimize staff distribution and improve patient care.

	SELECT * FROM Hospital
------------------------------------------------------------------------------------------------------------------------------------------------	
--Q3.  Top 3 Departments with the Highest Number of Patients?

SELECT hospital_name,
	SUM(patients_count) AS Total_patients
	FROM Hospital
GROUP BY hospital_name
ORDER BY Total_patients DESC
LIMIT 3;


--Business Problem Solved: Management doesn’t know which departments treat the most patients, making it hard to focus resources.

--Business Impact: Identifying top 3 departments helps in resource allocation, capacity planning, and improving patient services.

-------------------------------------------------------------------------------------------------------------------------------------------------
--Q4.  Hospital with the Maximum Medical Expenses?

SELECT hospital_name,
	SUM(medical_expenses) AS Total_expenses
	FROM Hospital
GROUP BY hospital_name
ORDER BY Total_expenses DESC
LIMIT 1;

SELECT * FROM Hospital


--Business Problem Solved: Management is unaware of which hospital incurs the highest medical expenses, leading to poor cost control.

--Business Impact: Finding the hospital with maximum expenses enables better budget planning, cost optimization, and financial efficiency.

---------------------------------------------------------------------------------------------------------------------------------------------------
-- Q5. Daily Average Medical Expenses?

SELECT hospital_name,
      ROUND(AVG(daily_expense)) AS avg_expense_per_day
FROM (
    SELECT hospital_name,
           admission_date,
           SUM(medical_expenses) AS daily_expense
    FROM hospital
    GROUP BY hospital_name, admission_date
)
GROUP BY hospital_name
ORDER BY avg_expense_per_day DESC;


--Business Problem Solved: Hospitals lack visibility on daily average medical expenses, making financial tracking difficult.

--Business Impact: Helps monitor spending patterns, control costs, and improve budget management.

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Q6. Longest Hospital Stay?
SELECT hospital_name,
       admission_date,
       discharge_date,
       (discharge_date - admission_date) AS stay_days
FROM hospital
ORDER BY stay_days DESC
LIMIT 1;


--Business Problem Solved: Hospitals don’t know which patient had the longest stay, causing challenges in bed management and capacity planning.

--Business Impact: Identifying the longest stay improves resource utilization, patient flow, and operational efficiency.


SELECT * FROM Hospital

---------------------------------------------------------------------------------------------------------------------------------------------
--Q7. Total Patients Treated Per City?
SELECT location,	
		SUM(patients_count) AS patients_treated
		FROM Hospital
		GROUP BY location
		ORDER BY patients_treated DESC;



--Business Problem Solved: Management doesn’t know how many patients are treated in each city, limiting regional performance insights.

--Business Impact:	City-wise patient count helps in resource planning, branch expansion, and targeted healthcare services.	

-----------------------------------------------------------------------------------------------------------------------------------------------		

--Q8. Average Length of Stay Per Department?

SELECT department,
       (discharge_date - admission_date) AS stay_days
FROM hospital
ORDER BY stay_days DESC;


--Business Problem Solved: Hospitals lack insights on the average patient stay per department, making it hard to manage capacity.

--Business Impact: Knowing average stay per department improves bed utilization, staffing, and overall efficiency.

SELECT * FROM Hospital

---------------------------------------------------------------------------------------------------------------------------------------------
--Q9. Identify the Department with the Lowest Number of Patients?

SELECT department,
	SUM(patients_count) AS Total_patients
	FROM Hospital
GROUP BY department
ORDER BY Total_patients ASC
LIMIT 1;


--Business Problem Solved: Management is unaware of which department has the lowest patient count, leading to underutilized resources.

--Business Impact: Identifying the least visited department helps optimize resources and improve departmental performance.

----------------------------------------------------------------------------------------------------------------------------------------------
--Q10. Monthly Medical Expenses Report?

--METHOD-1

SELECT DATE_TRUNC('month', admission_date) AS month,
       SUM(medical_expenses) AS total_expense
FROM hospital
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month;

--METHOD-2

SELECT TO_CHAR(admission_date, 'Month YYYY') AS month_name,
       SUM(medical_expenses) AS total_expense
FROM hospital
GROUP BY TO_CHAR(admission_date, 'Month YYYY')
ORDER BY MIN(admission_date) DESC;


--Business Problem Solved: Hospitals lack clear visibility of monthly medical expenses, making it hard to track spending trends.

--Business Impact: A monthly expenses report supports cost control, budget planning, and financial transparency.
----------------------------------------------------------------------------------------------------------------------------------------------

