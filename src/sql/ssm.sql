DROP DATABASE IF EXISTS jiaowu;
CREATE DATABASE IF NOT EXISTS jiaowu
  CHARACTER SET 'utf8'
  COLLATE 'utf8_general_ci';

CREATE TABLE IF NOT EXISTS t_u
USE ssm;ser (
  id       INTEGER PRIMARY KEY AUTO_INCREMENT,

  name     VARCHAR(20) NOT NULL,

  password VARCHAR(20) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO t_user (name, password) VALUES ('double', '123456');
INSERT INTO t_user (name, password) VALUES ('charli', '123');