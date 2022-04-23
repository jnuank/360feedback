\c feedback;

CREATE SCHEMA フィードバック;

CREATE TABLE フィードバック.エピソード(
    Id VARCHAR(4) PRIMARY KEY,
    日付 DATE NOT NULL,
    内容 VARCHAR NOT NULL
);

CREATE TABLE フィードバック.メンバー(
    Id VARCHAR(4) PRIMARY KEY,
    名前 VARCHAR(100) NOT NULL
);

CREATE TABLE フィードバック.行動(
    Id VARCHAR(4) PRIMARY KEY,
    エピソードId VARCHAR(4) NOT NULL,
    メンバーId VARCHAR(4) NOT NULL,
    内容 VARCHAR NOT NULL,

    FOREIGN KEY (エピソードId) REFERENCES フィードバック.エピソード(Id),
    FOREIGN KEY (メンバーId) REFERENCES フィードバック.メンバー(Id)
);

