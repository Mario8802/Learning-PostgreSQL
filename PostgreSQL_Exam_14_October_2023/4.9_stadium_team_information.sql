CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))
RETURNS TABLE (team_name VARCHAR(30)) AS $$
BEGIN
    RETURN QUERY
    SELECT teams.name AS team_name
    FROM stadiums
    JOIN teams ON stadiums.id = teams.stadium_id
    WHERE stadiums.name = stadium_name
    ORDER BY teams.name ASC;
END;
$$ LANGUAGE plpgsql;
