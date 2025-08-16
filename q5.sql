DROP PROCEDURE IF EXISTS SubscriberWatchTimeReport;

DELIMITER //

CREATE PROCEDURE SubscriberWatchTimeReport()
BEGIN
    -- Declare local variables for the cursor.
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_subscriber_ID INT;
    DECLARE history_count INT;

    -- Declare a cursor to iterate over ALL distinct subscribers.
    -- We select from the Subscribers table to include users with no history.
    DECLARE subscriber_cursor CURSOR FOR
        SELECT SubscriberID FROM Subscribers;

    -- Set a handler to exit the loop when the cursor runs out of rows.
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor.
    OPEN subscriber_cursor;

    -- Begin the loop to fetch each subscriber's ID.
    subscriber_loop: LOOP
        FETCH subscriber_cursor INTO current_subscriber_ID;
        IF done THEN
            LEAVE subscriber_loop;
        END IF;

        -- Check if the current subscriber has any records in WatchHistory.
        SELECT COUNT(*)
        INTO history_count
        FROM WatchHistory
        WHERE SubscriberID = current_subscriber_ID;

        -- Use an IF statement to determine the action.
        IF history_count > 0 THEN
            -- If they have history, print a header and then call the procedure
            -- to get and print their details.
            CALL GetWatchHistoryBySubscriber(current_subscriber_ID);
        ELSE
            -- If they have no history, print the custom message.
            SELECT CONCAT('No Watch History for Subscriber ID: ', current_subscriber_ID, ' ---') AS message;
        END IF;

    END LOOP;

    -- Close the cursor.
    CLOSE subscriber_cursor;

END //

DELIMITER ;

-- Call SubscriberWatchTimeReport();