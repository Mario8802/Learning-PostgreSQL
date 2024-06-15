CREATE OR REPLACE PROCEDURE sp_players_team_name(
    IN player_name VARCHAR(50),
    OUT team_name VARCHAR(45)
)
LANGUAGE plpgsql
AS $procedure$
DECLARE
    current_team VARCHAR(45);
BEGIN
    SELECT t.name
    INTO current_team
    FROM teams AS t
    JOIN players AS p ON p.team_id = t.id
    WHERE CONCAT(p.first_name, ' ', p.last_name) = player_name;

    IF current_team IS NULL THEN
        team_name := 'The player currently has no team';
    ELSE
        team_name := current_team;
    END IF;
END $procedure$;
