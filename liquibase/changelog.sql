--liquibase formatted sql

--changeset armen:1
CREATE TABLE `person` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `email` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_unique_email` (`email`)
)

--changeset armen:1.2
    INSERT INTO person (email, name) VALUES ('john@gmail.com', 'John Doe');

--changeset armen:1.3
ALTER TABLE person
    ADD fname VARCHAR(255) NOT NULL;
ALTER TABLE person
    ADD lname VARCHAR(255) NOT NULL;

--changeset armen:1.4
UPDATE person SET fname = SUBSTRING_INDEX(name, ' ', 1);
UPDATE person SET lname = SUBSTRING_INDEX(name, ' ', -1);

--changeset armen:1.5
ALTER TABLE person DROP COLUMN name;

--changeset armen:2
CREATE TABLE `credit` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `person_id` bigint(20) NOT NULL,
    `amount` decimal(12,2) NOT NULL,
    `created_at` datetime DEFAULT current_timestamp(),
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_credit_person` (`person_id`),
    CONSTRAINT `fk_credit_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
)