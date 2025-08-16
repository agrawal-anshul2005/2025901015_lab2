-- Drop the procedure if it already exists
DROP procedure IF EXISTS AddSubscriberIfNotExists;

-- Create the procedure, it will take the name, and insert a record in the subscriber table
Delimiter //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    -- Declare a local variable to hold the count of existing subscribers with the same name.
    DECLARE name_count INT;

    -- Check if a record with the same name already exists in the table.
    -- We're selecting into the variable we just declared.
    SELECT COUNT(*)
    INTO name_count
    FROM Subscribers as a
    Where a.SubscriberName = subName;
    
     IF name_count > 0 THEN
        -- If the name already exists, print a message.
        SELECT 'Record already Present' AS Message;
    ELSE
        -- If the name does not exist, insert the new record.
        -- We'll also provide a default email for this example.
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate) VALUES
			(subname, NOW());
		SELECT 'Record inserted successfully!' AS Message;
	END IF;



END // 

Delimiter ;

-- Calling part of the script

-- Call AddSubscriberIfNotExists('Anshul');
-- Check if insert was successful
-- Select * from Subscribers;