UPDATE coaches
SET salary = salary * coach_level
WHERE first_name LIKE 'C%'
  AND id IN (
      SELECT coach_id
      FROM players_coaches
      GROUP BY coach_id
      HAVING COUNT(player_id) > 0
  );
