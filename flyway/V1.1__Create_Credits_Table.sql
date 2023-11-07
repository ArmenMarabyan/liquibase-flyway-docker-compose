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