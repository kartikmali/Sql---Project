USE mavenfuzzyfactory;

SELECT * FROM website_sessions;

SElECT distinct website_sessions.utm_campaign 
FROM website_sessions;



## ASSIGNMENT_1


SELECT utm_source, utm_campaign, http_referer,
COUNT(website_session_id) as Sessions
FROM website_sessions
WHERE created_at < '2012-04-12'
GROUP BY utm_source, utm_campaign, http_referer
HAVING Sessions < 100
ORDER BY Sessions DESC;



## ASSIGNMENT_2


SELECT
	COUNT(DISTINCT website_sessions.website_session_id) as Sessions,
	COUNT(DISTINCT orders.order_id) as Orders,
	COUNT(orders.order_id)/COUNT(website_sessions.website_session_id)*100 as Conversion_Rate
FROM website_sessions
	Left Join Orders
	ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2012-04-14'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'
    ORDER BY Conversion_Rate;
    

    
## ASSIGNMENMENT_3


SELECT
	YEAR(created_at) as Year, 
    WEEK(created_at) as Week,
    DATE(created_at) as Week_Starting,
	COUNT(DISTINCT website_session_id) as Sessions
FROM website_sessions
WHERE website_sessions.created_at < '2012-05-10'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'
GROUP BY YEAR(created_at), WEEK(created_at);



## ASSIGNMENT_4


SELECT 
	website_sessions.device_type,
	COUNT(DISTINCT website_sessions.website_session_id) as Sessions,
	COUNT(DISTINCT orders.order_id) as Orders,
	COUNT(orders.order_id)/COUNT(website_sessions.website_session_id)*100 as Conversion_Rate
FROM website_sessions
	Left Join Orders
	ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2012-04-15'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'
    GROUP BY device_type;



## ASSIGNMENT_5


SELECT
	website_sessions.device_type,
	YEAR(created_at) as Year, 
    WEEK(created_at) as Week,
    DATE(created_at) as Date,
    COUNT(DISTINCT website_session_id) as Sessions
FROM website_sessions
WHERE website_sessions.created_at < '2012-06-09'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'
GROUP BY WEEK(created_at), device_type;
