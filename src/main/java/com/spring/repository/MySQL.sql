-- Active: 1728554886701@@127.0.0.1@3306

-- user Table Create SQL
-- 테이블 생성 SQL - user
CREATE TABLE user
(
    `user_idx`              INT UNSIGNED    NOT NULL    COMMENT '사용자 인덱스', 
    `user_id`               VARCHAR(255)    NOT NULL    COMMENT '사용자 아이디', 
    `user_pw`               VARCHAR(255)    NOT NULL    COMMENT '비밀번호', 
    `user_nickname`         VARCHAR(255)    NOT NULL    COMMENT '닉네임', 
    `user_profile_picture`  VARCHAR(255)    NOT NULL    COMMENT '프로필 사진', 
    `user_email`            VARCHAR(255)    NOT NULL    COMMENT '이메일', 
    `user_signup_date`      TIMESTAMP       NOT NULL    DEFAULT now() COMMENT '가입일자', 
    `user_role`             VARCHAR(5)      NOT NULL    DEFAULT 'user' COMMENT '권한', 
    `user_is_active`        VARCHAR(5)      NOT NULL    DEFAULT 'True' COMMENT '탈퇴여부', 
     PRIMARY KEY (user_idx)
);

-- contest Table Create SQL
-- 테이블 생성 SQL - contest
CREATE TABLE contest
(
    `contest_idx`             INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '공모전 인덱스', 
    `user_idx`            INT UNSIGNED    NOT NULL    COMMENT '작성자', 
    `contest_title`       VARCHAR(255)    NOT NULL    COMMENT '제목', 
    `contest_image_url`   VARCHAR(255)    NOT NULL    COMMENT '사진 경로', 
    `contest_content`     TEXT            NOT NULL    COMMENT '설명', 
    `contest_view_count`  INT UNSIGNED    NOT NULL    DEFAULT 0 COMMENT '조회수', 
    `contest_updated_at`  TIMESTAMP       NOT NULL    DEFAULT now() COMMENT '작성일', 
     PRIMARY KEY (contest_idx)
);

-- Foreign Key 설정 SQL - contest(user_idx) -> user(user_idx)
ALTER TABLE contest
    ADD CONSTRAINT FK_contest_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Shorts Table Create SQL
-- 테이블 생성 SQL - Shorts
CREATE TABLE Shorts
(
    `shorts_idx`         INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '쇼츠 인덱스', 
    `user_idx`           INT UNSIGNED    NOT NULL    COMMENT '작성자', 
    `shorts_title`       VARCHAR(255)    NOT NULL    COMMENT '제목', 
    `shorts_video_url`   VARCHAR(255)    NOT NULL    COMMENT '동영상 경로', 
    `shorts_content`     TEXT            NOT NULL    COMMENT '설명', 
    `shorts_view_count`  INT UNSIGNED    NOT NULL    DEFAULT 0 COMMENT '조회수', 
    `shorts_updated_at`  TIMESTAMP       NOT NULL    DEFAULT now() COMMENT '작성일', 
     PRIMARY KEY (shorts_idx)
);

-- Foreign Key 설정 SQL - Shorts(user_idx) -> user(user_idx)
ALTER TABLE Shorts
    ADD CONSTRAINT FK_Shorts_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- live2D_model Table Create SQL
-- 테이블 생성 SQL - live2D_model
CREATE TABLE live2D_model
(
    `model_idx`   INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '모델 idx', 
    `model_name`  VARCHAR(50)     NOT NULL    COMMENT '이름', 
    `model_path`  VARCHAR(255)    NOT NULL    COMMENT '경로', 
     PRIMARY KEY (model_idx)
);

-- user_character_experiences Table Create SQL
-- 테이블 생성 SQL - user_character_experiences
CREATE TABLE user_character_experiences (
    `experience_idx` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '체험 idx',
    `user_idx` INT UNSIGNED NOT NULL COMMENT '사용자 인덱스',
    `model_idx` INT UNSIGNED NOT NULL COMMENT '모델 idx',
    `started_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '체험 시작시간',
    `ended_at` TIMESTAMP NULL COMMENT '체험 종료 시간',
    PRIMARY KEY (experience_idx)
);

-- Foreign Key 설정 SQL - user_character_experiences(user_idx) -> user(user_idx)
ALTER TABLE user_character_experiences
    ADD CONSTRAINT FK_user_character_experiences_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - user_character_experiences(model_idx) -> live2D_model(model_idx)
ALTER TABLE user_character_experiences
    ADD CONSTRAINT FK_user_character_experiences_model_idx_live2D_model_model_idx FOREIGN KEY (model_idx)
        REFERENCES live2D_model (model_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- shorts_likes Table Create SQL
-- 테이블 생성 SQL - shorts_likes
CREATE TABLE shorts_likes
(
    `shorts_likes_idx`  INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '좋아요 인덱스', 
    `user_idx`          INT UNSIGNED    NOT NULL    COMMENT '사용자 인덱스', 
    `shorts_idx`        INT UNSIGNED    NOT NULL    COMMENT '쇼츠 인덱스', 
     PRIMARY KEY (shorts_likes_idx)
);

-- Foreign Key 설정 SQL - shorts_likes(user_idx) -> user(user_idx)
ALTER TABLE shorts_likes
    ADD CONSTRAINT FK_shorts_likes_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - shorts_likes(shorts_idx) -> Shorts(shorts_idx)
ALTER TABLE shorts_likes
    ADD CONSTRAINT FK_shorts_likes_shorts_idx_Shorts_shorts_idx FOREIGN KEY (shorts_idx)
        REFERENCES Shorts (shorts_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- shorts_comments Table Create SQL
-- 테이블 생성 SQL - shorts_comments
CREATE TABLE shorts_comments
(
    `shorts_comments_idx`        INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '쇼츠 댓글 idx', 
    `shorts_idx`                 INT UNSIGNED    NOT NULL    COMMENT '쇼츠 인덱스', 
    `user_idx`                   INT UNSIGNED    NOT NULL    COMMENT '작성자', 
    `shorts_comment`             VARCHAR(255)    NOT NULL    COMMENT '댓글 내용', 
    `shorts_comment_updated_at`  TIMESTAMP       NOT NULL    DEFAULT now() COMMENT '작성일', 
     PRIMARY KEY (shorts_comments_idx)
);

-- Foreign Key 설정 SQL - shorts_comments(shorts_idx) -> Shorts(shorts_idx)
ALTER TABLE shorts_comments
    ADD CONSTRAINT FK_shorts_comments_shorts_idx_Shorts_shorts_idx FOREIGN KEY (shorts_idx)
        REFERENCES Shorts (shorts_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - shorts_comments(user_idx) -> user(user_idx)
ALTER TABLE shorts_comments
    ADD CONSTRAINT FK_shorts_comments_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- contest_comments Table Create SQL
-- 테이블 생성 SQL - contest_comments
CREATE TABLE contest_comments
(
    `contest_comments_idx`         INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '공모전 댓글 idx', 
    `contest_idx`                  INT UNSIGNED    NOT NULL    COMMENT '공모전 idx', 
    `user_idx`                     INT UNSIGNED    NOT NULL    COMMENT '작성자', 
    `contest_comments_content`         VARCHAR(50)     NOT NULL    COMMENT '댓글 내용', 
    `contest_comments_updated_at`  TIMESTAMP       NOT NULL    DEFAULT now() COMMENT '작성일', 
     PRIMARY KEY (contest_comments_idx)
);

-- Foreign Key 설정 SQL - contest_comments(contest_idx) -> contest(post_id)
ALTER TABLE contest_comments
    ADD CONSTRAINT FK_contest_comments_contest_idx_contest_contest_idx FOREIGN KEY (contest_idx)
        REFERENCES contest (contest_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - contest_comments(user_idx) -> user(user_idx)
ALTER TABLE contest_comments
    ADD CONSTRAINT FK_contest_comments_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- contest_likes Table Create SQL
-- 테이블 생성 SQL - contest_likes
CREATE TABLE contest_likes
(
    `contest_likes_idx`  INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '좋아요 인덱스', 
    `user_idx`           INT UNSIGNED    NOT NULL    COMMENT '사용자 인덱스', 
    `contest_idx`        INT UNSIGNED    NOT NULL    COMMENT '공모전 인덱스', 
     PRIMARY KEY (contest_likes_idx)
);

-- Foreign Key 설정 SQL - contest_likes(user_idx) -> user(user_idx)
ALTER TABLE contest_likes
    ADD CONSTRAINT FK_contest_likes_user_idx_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - contest_likes(contest_idx) -> contest(post_id)
ALTER TABLE contest_likes
    ADD CONSTRAINT FK_contest_likes_contest_idx_contest_contest_idx FOREIGN KEY (contest_idx)
        REFERENCES contest (contest_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shorts_likes
ADD COLUMN shorts_likes_count INT UNSIGNED NOT NULL DEFAULT 1 COMMENT '좋아요 수';

ALTER TABLE contest_likes
ADD COLUMN contest_likes_count INT UNSIGNED NOT NULL DEFAULT 1 COMMENT '좋아요 수';

ALTER TABLE `shorts` DROP COLUMN `shorts_view_count`;

ALTER TABLE `contest` DROP COLUMN `contest_view_count`;

ALTER TABLE `shorts_likes` 
CHANGE COLUMN `shorts_likes_count` `shorts_view_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '조회수 수';

INSERT INTO `contest` (`user_idx`, `contest_title`, `contest_image_url`, `contest_content`, `contest_updated_at`) VALUES
(1, '여름 풍경 콘테스트', 'https://example.com/summer1.jpg', '아름다운 여름 풍경을 담아주세요.', NOW()),
(2, '반려동물 사진전', 'https://example.com/pet1.jpg', '귀여운 반려동물의 모습을 공유해주세요.', NOW()),
(3, '도시의 밤 콘테스트', 'https://example.com/city1.jpg', '도시의 야경을 멋지게 담아주세요.', NOW()),
(4, '음식 사진 공모전', 'https://example.com/food1.jpg', '맛있는 음식을 예쁘게 찍어주세요.', NOW()),
(5, '꽃 사진 콘테스트', 'https://example.com/flower1.jpg', '아름다운 꽃의 모습을 담아주세요.', NOW()),
(6, '여행 스냅샷 공모전', 'https://example.com/travel1.jpg', '여행지에서의 특별한 순간을 공유해주세요.', NOW()),
(7, '일상의 아름다움 콘테스트', 'https://example.com/daily1.jpg', '평범한 일상 속 특별한 순간을 포착해주세요.', NOW()),
(8, '흑백 사진 공모전', 'https://example.com/blackwhite1.jpg', '흑백의 매력을 담은 사진을 올려주세요.', NOW()),
(9, '스포츠 순간 콘테스트', 'https://example.com/sports1.jpg', '스포츠 경기의 결정적 순간을 담아주세요.', NOW()),
(10, '자연의 경이로움 공모전', 'https://example.com/nature1.jpg', '자연의 놀라운 모습을 사진으로 담아주세요.', NOW());

INSERT INTO `contest_likes` (`user_idx`, `contest_idx`, `contest_likes_count`) VALUES
(2, 1, 150),
(3, 1, 120),
(4, 2, 200),
(5, 2, 180),
(6, 3, 300),
(7, 3, 250),
(8, 4, 100),
(9, 4, 90),
(10, 5, 400),
(1, 5, 350);

CREATE TABLE user
(
    `user_idx`              INT UNSIGNED    NOT NULL AUTO_INCREMENT COMMENT '사용자 인덱스', 
    `user_id`               VARCHAR(255)    NOT NULL COMMENT '사용자 아이디', 
    `user_pw`               VARCHAR(255)    NOT NULL COMMENT '비밀번호', 
    `user_nickname`         VARCHAR(255)    NOT NULL COMMENT '닉네임', 
    `user_profile_picture`  VARCHAR(255)    NULL COMMENT '프로필 사진', 
    `user_email`            VARCHAR(255)    NOT NULL COMMENT '이메일', 
    `user_signup_date`      TIMESTAMP       NULL DEFAULT now() COMMENT '가입일자', 
    `user_role`             VARCHAR(5)      NULL DEFAULT 'user' COMMENT '권한', 
    `user_is_active`        VARCHAR(5)      NULL DEFAULT 'True' COMMENT '탈퇴여부', 
    PRIMARY KEY (`user_idx`)
);

INSERT INTO user (user_id, user_pw, user_nickname, user_profile_picture, user_email, user_signup_date, user_role, user_is_active)
VALUES 
('user1', 'password1', '고양이lover', '/images/profile1.jpg', 'user1@example.com', '2024-10-11 14:15:57', 'user', 'True'),
('user2', 'password2', '댄스매니아', '/images/profile2.jpg', 'user2@example.com', '2024-10-11 14:15:57', 'user', 'True'),
('user3', 'password3', '디자인고수', '/images/profile3.jpg', 'user3@example.com', '2024-10-11 14:15:57', 'user', 'True'),
('user4', 'password4', '요리왕', '/images/profile4.jpg', 'user4@example.com', '2024-10-11 14:15:57', 'user', 'True'),
('user5', 'password5', '영상크리에이터', '/images/profile5.jpg', 'user5@example.com', '2024-10-11 14:15:57', 'user', 'True'),
('user6', 'password6', 'Nickname6', '/default_profile.jpg', 'user6@example.com', '2024-10-14 12:24:17', 'user', 'True'),
('user7', 'password7', 'Nickname7', '/default_profile.jpg', 'user7@example.com', '2024-10-14 12:24:17', 'user', 'True'),
('user8', 'password8', 'Nickname8', '/default_profile.jpg', 'user8@example.com', '2024-10-14 12:24:17', 'user', 'True'),
('user9', 'password9', 'Nickname9', '/default_profile.jpg', 'user9@example.com', '2024-10-14 12:24:17', 'user', 'True'),
('user10', 'password10', 'Nickname10', '/default_profile.jpg', 'user10@example.com', '2024-10-14 12:24:17', 'user', 'True');
