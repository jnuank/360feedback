\c feedback;

CREATE SCHEMA feedback;

CREATE TABLE feedback.episode(
    id UUID PRIMARY KEY,
    contents VARCHAR NOT NULL
)