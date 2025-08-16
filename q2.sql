-- Drop the procedure if it already exists
DROP procedure IF EXISTS GetWatchHistoryBySubscriber;

-- Create the procedure
Delimiter //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT) 
BEGIN

-- Declaration of the variables
DECLARE done INT DEFAULT FALSE;
DECLARE Title varchar(100);
DECLARE SubscriberName varchar(100);
DECLARE Watch_time int;

-- Get the Subscriber name, title, watchtime from the join of the 3 tables
	select b.SubscriberName, a.title , c.watchtime
		from
		Shows a, Subscribers b, WatchHistory c
		where
		c.ShowID = a.ShowID
		and c.SubscriberID = sub_id
        and b.SubscriberID = c.SubscriberID
        ;

END //

Delimiter ;

-- call GetWatchHistoryBySubscriber(2);

