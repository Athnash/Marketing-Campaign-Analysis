-- The main step to this project are:
-- 1. Univeriate Analysis
-- 2. Multivariate Analysis
-- 3. Analysis of Key Performance Indiator
-- 4. Recommendations


/* 1. Univariate Analysis
1.1. Top 20 Frequency per Clicks.
*/
USE facebookdata;
SELECT clicks, COUNT(*) AS frequency 
FROM data
GROUP BY clicks
ORDER BY frequency DESC
LIMIT 20;



/*1.2. Frequency of Individual Campaigns.
Campaign 936 had the most occurrence in the dataset
*/
SELECT campaign_id, COUNT(*) AS frequency
FROM data
GROUP BY campaign_id
ORDER BY frequency DESC;



/* 2. Multivariate Analysis
2.1. Gender Impressions Per Campaign.
*/
SELECT
	gender,
    SUM(CASE WHEN campaign_id = 916 THEN impressions ELSE 0 END) AS Campaign_916,
    SUM(CASE WHEN campaign_id = 936 THEN impressions ELSE 0 END) AS Campaign_936,
    SUM(CASE WHEN campaign_id = 1178 THEN impressions ELSE 0 END) AS Campaign_1178
FROM data
GROUP BY gender;
    
    
    
/* 2.2. Sum of clicks by gernder for each campaign.
*/
SELECT
	gender,
    SUM(CASE WHEN campaign_id = 916 THEN clicks ELSE 0 END) AS Campaign_916,
    SUM(CASE WHEN campaign_id = 936 THEN clicks ELSE 0 END) AS Campaign_936,
    SUM(CASE WHEN campaign_id = 1178 THEN clicks ELSE 0 END) AS Campaign_1178
FROM data
GROUP BY gender;



/* 2.3. Sum of total conversion by Campaign Id and Gender. 
*/
SELECT
	gender,
    SUM(CASE WHEN campaign_id = 916 THEN total_conversion ELSE 0 END) AS Campaign_916,
    SUM(CASE WHEN campaign_id = 936 THEN total_conversion ELSE 0 END) AS Campaign_936,
    SUM(CASE WHEN campaign_id = 1178 THEN total_conversion ELSE 0 END) AS Campaign_1178
FROM data
GROUP BY gender;



/*2.4. Sum of Approved Conversion by Gender for each Campaign.
*/
SELECT
	gender,
    SUM(CASE WHEN campaign_id = 916 THEN approved_conversion ELSE 0 END) AS Campaign_916,
    SUM(CASE WHEN campaign_id = 936 THEN approved_conversion ELSE 0 END) AS Campaign_936,
    SUM(CASE WHEN campaign_id = 1178 THEN approved_conversion ELSE 0 END) AS Campaign_1178
FROM data
GROUP BY gender;



-- 3. Analysis of the Key Performance Indicators (KPIs)
/*3.1. Mean CPC, CTR, and CPC by Campaign.
*/
SELECT 
    campaign_id,
    ROUND(AVG(spent / NULLIF(clicks, 0)), 5) AS Mean_CPC,
    ROUND(AVG(clicks / NULLIF(impressions, 0)), 5) AS Mean_CTR,
    ROUND(AVG(total_conversion / NULLIF(clicks, 0)), 5) AS Mean_CR
FROM data
GROUP BY campaign_id;


/*3.2.2. Mean Conversion Rate (CR) by Age and Campaign. 
*/
SELECT 
	age,
    ROUND(AVG(CASE WHEN campaign_id = 916 THEN total_conversion / NULLIF(clicks, 0) END), 5) AS Camapaign_916,
    ROUND(AVG(CASE WHEN campaign_id = 936 THEN total_conversion / NULLIF(clicks, 0) END), 5) AS Campaign_936,
    ROUND(AVG(CASE WHEN campaign_id = 1178 THEN total_conversion / NULLIF(clicks, 0) END), 5) AS Campaign_1178
FROM data
GROUP BY age;


/* 3.2.3. Mean Click Through Rate by Gender and Campaign. 
*/
SELECT 
	gender,
    ROUND(AVG(CASE WHEN campaign_id = 916 THEN clicks / NULLIF(impressions, 0) END), 5) AS Campaign_916,
    ROUND(AVG(CASE WHEN campaign_id = 936 THEN clicks / NULLIF(impressions, 0) END), 5) AS Campaign_936,
    ROUND(AVG(CASE WHEN campaign_id = 1178 THEN clicks / NULLIF(impressions, 0) END), 5) AS Campaign_1178
FROM data
GROUP BY gender;


/*3.2.4. Mean Conversion Rat by Gender and Campaign. 
*/
SELECT 
	gender,
    ROUND(AVG(CASE WHEN campaign_id = 916 THEN total_conversion / NULLIF(clicks, 0) END), 5) AS Campaign_916,
    ROUND(AVG(CASE WHEN campaign_id = 936 THEN total_conversion / NULLIF(clicks, 0) END), 5) AS Campaign_936,
    ROUND(AVG(CASE WHEN campaign_id = 1178 THEN total_conversion / NULLIF(clicks, 0) END), 5) AS Campaign_1178
FROM data
GROUP BY gender;







