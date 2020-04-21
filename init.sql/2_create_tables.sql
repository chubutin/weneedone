--use database fulbito_db

CREATE TABLE IF NOT EXISTS fulbito_schema.users (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (current_timestamp),
    nickname VARCHAR(64) NOT NULL,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL,
    sex VARCHAR(64),
    birthday DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS fulbito_schema.venues (
    id uuid DEFAULT extensions.uuid_generate_v4 () NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (current_timestamp),
    venue_name VARCHAR(64),
    phone VARCHAR(64),
    email VARCHAR(64),
    city VARCHAR(64),
    addressLine VARCHAR(64),
    addressLine2 VARCHAR(64),
    country VARCHAR(64),
    -- location 
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS fulbito_schema.matches(
    id uuid DEFAULT extensions.uuid_generate_v4 () NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (current_timestamp),
    match_date_time TIMESTAMP WITH TIME ZONE NOT NULL,
    related_last_math uuid,
    created_by uuid,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES fulbito_schema.users (id)
);

CREATE TABLE IF NOT EXISTS fulbito_schema.pitches (
    id uuid DEFAULT extensions.uuid_generate_v4 () NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (current_timestamp),
    pitch_name VARCHAR(64),
    max_players SMALLINT,
    recommended_max_players SMALLINT,
    recommended_min_players SMALLINT,
    venue_id uuid,
    PRIMARY KEY (id),
    FOREIGN KEY (venue_id) REFERENCES fulbito_schema.matches (id)
);