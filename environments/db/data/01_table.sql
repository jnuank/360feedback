\c feedback;

CREATE SCHEMA feedback;

CREATE TABLE feedback.episode(
    id VARCHAR PRIMARY KEY,
    contents VARCHAR NOT NULL
);
