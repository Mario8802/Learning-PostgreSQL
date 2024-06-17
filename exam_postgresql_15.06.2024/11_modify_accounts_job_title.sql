CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts a
    SET job_title = '(Remote) ' || a.job_title
    FROM addresses addr
    WHERE a.id = addr.account_id
      AND addr.street = address_street
      AND addr.town = address_town
      AND a.job_title NOT LIKE '(Remote) %';
END;
$$;
