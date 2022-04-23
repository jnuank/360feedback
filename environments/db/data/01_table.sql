\c feedback;

CREATE SCHEMA フィードバック;

CREATE TABLE フィードバック.エピソード(
    Id UUID PRIMARY KEY,
    日付 DATE NOT NULL,
    内容 VARCHAR NOT NULL
);

CREATE TABLE フィードバック.メンバー(
    Id UUID PRIMARY KEY,
    名前 VARCHAR(100) NOT NULL
);

CREATE TABLE フィードバック.行動(
    Id UUID PRIMARY KEY,
    エピソードId UUID NOT NULL,
    メンバーId UUID NOT NULL,
    内容 VARCHAR NOT NULL,

    FOREIGN KEY (エピソードId) REFERENCES フィードバック.エピソード(Id),
    FOREIGN KEY (メンバーId) REFERENCES フィードバック.メンバー(Id)
);

