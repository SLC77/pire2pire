DROP TABLE IF EXISTS roles ;
CREATE TABLE roles (id_role INT NOT NULL,
is_admin BOOLEAN,
is_former BOOLEAN,
is_student BOOLEAN,
PRIMARY KEY (id_role));

DROP TABLE IF EXISTS users ;
CREATE TABLE users (id_user_users INT NOT NULL,
name_users VARCHAR,
first_name_users VARCHAR,
birth_date_users DATE,
adress_users VARCHAR,
PRIMARY KEY (id_user_users));

DROP TABLE IF EXISTS trainings ;
CREATE TABLE trainings (id_training_trainings INT NOT NULL,
title_training_trainings VARCHAR,
PRIMARY KEY (id_training_trainings));

DROP TABLE IF EXISTS modules ;
CREATE TABLE modules (id_module_modules INT NOT NULL,
num_module_modules VARCHAR,
title_module_modules VARCHAR,
objective_modules VARCHAR,
duration_modules TIME,
PRIMARY KEY (id_module_modules));

DROP TABLE IF EXISTS lessons ;
CREATE TABLE lessons (id_lesson_lessons INT NOT NULL,
title_lesson_lessons VARCHAR,
content_lessons TEXT,
id_user_users **NOT FOUND**,
PRIMARY KEY (id_lesson_lessons));

DROP TABLE IF EXISTS tags_modules ;
CREATE TABLE tags_modules (id_tag_module_tags_modules INT NOT NULL,
name_tag_module_tags_modules VARCHAR,
PRIMARY KEY (id_tag_module_tags_modules));

DROP TABLE IF EXISTS tags_lessons ;
CREATE TABLE tags_lessons (id_tag_lesson_tags_lessons INT NOT NULL,
name_tag_lesson_tags_lessons VARCHAR,
PRIMARY KEY (id_tag_lesson_tags_lessons));

DROP TABLE IF EXISTS contain ;
CREATE TABLE contain (id_module_modules **NOT FOUND** NOT NULL,
id_training_trainings **NOT FOUND** NOT NULL,
PRIMARY KEY (id_module_modules,
 id_training_trainings));

DROP TABLE IF EXISTS participate ;
CREATE TABLE participate (id_user_users **NOT FOUND** NOT NULL,
id_training_trainings **NOT FOUND** NOT NULL,
PRIMARY KEY (id_user_users,
 id_training_trainings));

DROP TABLE IF EXISTS compose ;
CREATE TABLE compose (id_module_modules **NOT FOUND** NOT NULL,
id_lesson_lessons **NOT FOUND** NOT NULL,
PRIMARY KEY (id_module_modules,
 id_lesson_lessons));

DROP TABLE IF EXISTS define ;
CREATE TABLE define (id_role **NOT FOUND** NOT NULL,
id_user_users **NOT FOUND** NOT NULL,
PRIMARY KEY (id_role,
 id_user_users));

DROP TABLE IF EXISTS possess ;
CREATE TABLE possess (id_lesson_lessons **NOT FOUND** NOT NULL,
id_tag_lesson_tags_lessons **NOT FOUND** NOT NULL,
PRIMARY KEY (id_lesson_lessons,
 id_tag_lesson_tags_lessons));

DROP TABLE IF EXISTS have ;
CREATE TABLE have (id_module_modules **NOT FOUND** NOT NULL,
id_tag_module_tags_modules **NOT FOUND** NOT NULL,
PRIMARY KEY (id_module_modules,
 id_tag_module_tags_modules));

DROP TABLE IF EXISTS create ;
CREATE TABLE create (id_training_trainings **NOT FOUND** NOT NULL,
id_user_users **NOT FOUND** NOT NULL,
PRIMARY KEY (id_training_trainings,
 id_user_users));

DROP TABLE IF EXISTS add ;
CREATE TABLE add (id_user_users **NOT FOUND** NOT NULL,
id_module_modules **NOT FOUND** NOT NULL,
PRIMARY KEY (id_user_users,
 id_module_modules));

DROP TABLE IF EXISTS validate ;
CREATE TABLE validate (id_user_users **NOT FOUND** NOT NULL,
id_module_modules **NOT FOUND** NOT NULL,
PRIMARY KEY (id_user_users,
 id_module_modules));

ALTER TABLE lessons ADD CONSTRAINT FK_lessons_id_user_users FOREIGN KEY (id_user_users) REFERENCES users (id_user_users);

ALTER TABLE contain ADD CONSTRAINT FK_contain_id_module_modules FOREIGN KEY (id_module_modules) REFERENCES modules (id_module_modules);
ALTER TABLE contain ADD CONSTRAINT FK_contain_id_training_trainings FOREIGN KEY (id_training_trainings) REFERENCES trainings (id_training_trainings);
ALTER TABLE participate ADD CONSTRAINT FK_participate_id_user_users FOREIGN KEY (id_user_users) REFERENCES users (id_user_users);
ALTER TABLE participate ADD CONSTRAINT FK_participate_id_training_trainings FOREIGN KEY (id_training_trainings) REFERENCES trainings (id_training_trainings);
ALTER TABLE compose ADD CONSTRAINT FK_compose_id_module_modules FOREIGN KEY (id_module_modules) REFERENCES modules (id_module_modules);
ALTER TABLE compose ADD CONSTRAINT FK_compose_id_lesson_lessons FOREIGN KEY (id_lesson_lessons) REFERENCES lessons (id_lesson_lessons);
ALTER TABLE define ADD CONSTRAINT FK_define_id_role FOREIGN KEY (id_role) REFERENCES roles (id_role);
ALTER TABLE define ADD CONSTRAINT FK_define_id_user_users FOREIGN KEY (id_user_users) REFERENCES users (id_user_users);
ALTER TABLE possess ADD CONSTRAINT FK_possess_id_lesson_lessons FOREIGN KEY (id_lesson_lessons) REFERENCES lessons (id_lesson_lessons);
ALTER TABLE possess ADD CONSTRAINT FK_possess_id_tag_lesson_tags_lessons FOREIGN KEY (id_tag_lesson_tags_lessons) REFERENCES tags_lessons (id_tag_lesson_tags_lessons);
ALTER TABLE have ADD CONSTRAINT FK_have_id_module_modules FOREIGN KEY (id_module_modules) REFERENCES modules (id_module_modules);
ALTER TABLE have ADD CONSTRAINT FK_have_id_tag_module_tags_modules FOREIGN KEY (id_tag_module_tags_modules) REFERENCES tags_modules (id_tag_module_tags_modules);
ALTER TABLE create ADD CONSTRAINT FK_create_id_training_trainings FOREIGN KEY (id_training_trainings) REFERENCES trainings (id_training_trainings);
ALTER TABLE create ADD CONSTRAINT FK_create_id_user_users FOREIGN KEY (id_user_users) REFERENCES users (id_user_users);
ALTER TABLE add ADD CONSTRAINT FK_add_id_user_users FOREIGN KEY (id_user_users) REFERENCES users (id_user_users);
ALTER TABLE add ADD CONSTRAINT FK_add_id_module_modules FOREIGN KEY (id_module_modules) REFERENCES modules (id_module_modules);
ALTER TABLE validate ADD CONSTRAINT FK_validate_id_user_users FOREIGN KEY (id_user_users) REFERENCES users (id_user_users);
ALTER TABLE validate ADD CONSTRAINT FK_validate_id_module_modules FOREIGN KEY (id_module_modules) REFERENCES modules (id_module_modules);
