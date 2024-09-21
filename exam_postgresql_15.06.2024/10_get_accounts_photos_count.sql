CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INTEGER AS $$
DECLARE
    photos_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO photos_count
    FROM accounts a
    JOIN accounts_photos ap ON a.id = ap.account_id
    WHERE a.username = account_username;
    
    RETURN photos_count;
END;
$$ LANGUAGE plpgsql; 
