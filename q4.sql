-- Drop the procedure if it already exists
DROP procedure IF EXISTS SendWatchTimeReport;

-- Create the procedure, it will take the ID, and call the GetWatchHistoryBySubscriber procedure to print the watch details
Delimiter //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN

-- Declare local variables for the cursor.
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_subscriber_name VARCHAR(100);
    DECLARE current_subscriber_ID int;

    -- Declare a cursor to iterate over all distinct subscribers who have watched content.
    -- We're selecting from the WatchHistory table to ensure we only get names
    -- of subscribers who actually have watch records.
    DECLARE subscriber_cursor CURSOR FOR
        SELECT DISTINCT SubscriberID
        FROM WatchHistory;

    -- Set a handler to exit the loop when the cursor runs out of rows.
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor.
    OPEN subscriber_cursor;

    -- Begin the loop to fetch each subscriber's name.
    subscriber_loop: LOOP
        FETCH subscriber_cursor INTO current_subscriber_ID;
        IF done THEN
            LEAVE subscriber_loop;
        END IF;
	
    call GetWatchHistoryBySubscriber(current_subscriber_ID);
		

    END LOOP;

    -- Close the cursor.
    CLOSE subscriber_cursor;

END//

Delimiter ;

Call SendWatchTimeReport();