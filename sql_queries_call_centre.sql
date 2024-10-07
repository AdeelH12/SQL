-- Total Number of Calls

SELECT COUNT(DISTINCT id) as Total_Number_of_Calls from call_centre;

-- Total Call Duration in Hours

SELECT SUM(Call_Duration_In_Minutes) / 60 AS Total_call_duration_in_hours from call_centre;

-- Total Call Duration in Minutes

SELECT SUM(Call_Duration_In_Minutes) AS Total_call_duration_in_minutes from call_centre;

-- Average call duration in minutes

SELECT avg(Call_Duration_In_Minutes) As Average_call_duration_in_minutes from call_centre;

-- Response time percentage

SELECT 
    Response_Time, 
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM call_centre)), 2) AS percentage_response_time
FROM 
    call_centre
GROUP BY 
    Response_Time;

-- Total Call By Day 

SELECT DAYNAME(Call_Timestamp) AS Call_day, COUNT(DISTINCT id) AS Total_calls FROM call_centre GROUP BY DAYNAME(Call_Timestamp);

-- Total Calls by State

SELECT State, COUNT(DISTINCT id) AS Total_Calls FROM call_centre
GROUP BY State;

-- Top Reason for calls

SELECT Reason, COUNT(DISTINCT id) AS Total_Calls FROM call_centre
GROUP BY Reason
ORDER BY Reason ASC;

-- Top calls by channel

SELECT Channel, COUNT(DISTINCT id) AS Total_Calls FROM call_centre
GROUP BY Channel
ORDER BY Channel ASC;

-- Top Calls By Sentiment

SELECT Sentiment, COUNT(DISTINCT id) AS Total_Calls FROM call_centre
GROUP BY Sentiment
ORDER BY Sentiment ASC;

-- Total Calls by Call Centre 

SELECT Call_Centres_City, COUNT(DISTINCT id) AS Total_Calls FROM call_centre
GROUP BY Call_Centres_City;