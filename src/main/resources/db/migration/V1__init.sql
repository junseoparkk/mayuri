-- USERS TABLE
CREATE TABLE IF NOT EXISTS `users` (
    `user_id` BIGINT NOT NULL,
    `nickname` VARCHAR(255) NULL,
    `profile_url` VARCHAR(255) NULL,
    `google_id` VARCHAR(255) NULL,
    `status` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    CONSTRAINT `PK_USERS` PRIMARY KEY (`user_id`)
);

-- BOARDS TABLE
CREATE TABLE IF NOT EXISTS `boards` (
    `board_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `title` VARCHAR(255) NULL,
    `explanation` VARCHAR(255) NULL,
    `video_count` INT NULL,
    `like_count` INT NULL,
    `status` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    CONSTRAINT `PK_BOARDS` PRIMARY KEY (`board_id`),
    CONSTRAINT `FK_boards_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

-- USERS_LIKES TABLE
CREATE TABLE IF NOT EXISTS `users_likes` (
    `users_likes_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `board_id` BIGINT NOT NULL,
    CONSTRAINT `PK_USERS_LIKES` PRIMARY KEY (`users_likes_id`),
    CONSTRAINT `FK_users_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    CONSTRAINT `FK_users_likes_boards` FOREIGN KEY (`board_id`) REFERENCES `boards` (`board_id`)
);

-- USERS_SAVES TABLE
CREATE TABLE IF NOT EXISTS `users_saves` (
    `users_saves_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `board_id` BIGINT NOT NULL,
    CONSTRAINT `PK_USERS_SAVES` PRIMARY KEY (`users_saves_id`),
    CONSTRAINT `FK_users_saves_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    CONSTRAINT `FK_users_saves_boards` FOREIGN KEY (`board_id`) REFERENCES `boards` (`board_id`)
);

-- VIDEOS TABLE
CREATE TABLE IF NOT EXISTS `videos` (
`video_id` BIGINT NOT NULL,
`board_id` BIGINT NOT NULL,
`title` VARCHAR(255) NULL,
    `thumbnail_url` VARCHAR(255) NULL,
    `video_url` VARCHAR(255) NULL,
    `explanation` VARCHAR(255) NULL,
    `status` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    CONSTRAINT `PK_VIDEOS` PRIMARY KEY (`video_id`),
    CONSTRAINT `FK_videos_boards` FOREIGN KEY (`board_id`) REFERENCES `boards` (`board_id`)
);
