SELECT * FROM projects.engagement_data;
use projects;
select EngagementID, ContentID, CampaignID, ProductID, 
upper(replace(ContentType,'Socialmedia','Social Media')) as ContentType,
left(ViewsClicksCombined, locate('-',ViewsClicksCombined) - 1) as views,
right(ViewsClicksCombined,length(ViewsClicksCombined)- locate('-',ViewsClicksCombined)) as clicks,
likes,
DATE_FORMAT(EngagementDate, '%d.%m.%Y') AS EngagementDate
from projects.engagement_data 
where ContentType!='NEWSLETTER';