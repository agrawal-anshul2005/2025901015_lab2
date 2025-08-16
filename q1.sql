-- Drop the procedure if it already exists
DROP procedure IF EXISTS ListAllSubscribers;

-- Create the procedure
Delimiter //
CREATE PROCEDURE ListAllSubscribers () 
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE subsname varchar(100);

DECLARE cur_subscribers cursor for 
	select SubscriberName
    FROM subscribers;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
OPEN cur_subscribers;

read_loop: LOOP
FETCH cur_subscribers INTO subsname;

	IF done then
    LEAVE read_loop;
    end if;
    
    Select subsname as Subscriber_name;
    
END LOOP;

CLOSE cur_subscribers;

END //

delimiter ;

-- Call ListAllSubscribers();