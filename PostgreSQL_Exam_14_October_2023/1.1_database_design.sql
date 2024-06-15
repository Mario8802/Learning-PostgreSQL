CREATE TABLE towns (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE stadiums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    capacity INTEGER CHECK (capacity > 0) NOT NULL,
    town_id INTEGER NOT NULL,
    CONSTRAINT fk_town FOREIGN KEY (town_id) REFERENCES towns(id) ON DELETE CASCADE
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base INTEGER DEFAULT 0 CHECK (fan_base >= 0) NOT NULL,
    stadium_id INTEGER NOT NULL,
    CONSTRAINT fk_stadium FOREIGN KEY (stadium_id) REFERENCES stadiums(id) ON DELETE CASCADE
);

CREATE TABLE coaches (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 CHECK (salary >= 0) NOT NULL,
    coach_level INTEGER DEFAULT 0 CHECK (coach_level >= 0) NOT NULL
);

CREATE TABLE skills_data (
    id SERIAL PRIMARY KEY,
    dribbling INTEGER DEFAULT 0 CHECK (dribbling >= 0) NULL,
    pace INTEGER DEFAULT 0 CHECK (pace >= 0) NULL,
    passing INTEGER DEFAULT 0 CHECK (passing >= 0) NULL,
    shooting INTEGER DEFAULT 0 CHECK (shooting >= 0) NULL,
    speed INTEGER DEFAULT 0 CHECK (speed >= 0) NULL,
    strength INTEGER DEFAULT 0 CHECK (strength >= 0) NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INTEGER DEFAULT 0 CHECK (age >= 0) NOT NULL,
    position CHAR(1) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 CHECK (salary >= 0) NOT NULL,
    hire_date TIMESTAMP NULL,
    skills_data_id INTEGER NOT NULL,
    team_id INTEGER NULL,
    CONSTRAINT fk_skills_data FOREIGN KEY (skills_data_id) REFERENCES skills_data(id) ON DELETE CASCADE,
    CONSTRAINT fk_team FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
);

CREATE TABLE players_coaches (
    player_id INTEGER,
    coach_id INTEGER,
    CONSTRAINT fk_player FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_coach FOREIGN KEY (coach_id) REFERENCES coaches(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (player_id, coach_id)
);