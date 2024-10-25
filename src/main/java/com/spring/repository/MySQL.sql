-- tb_user Table Create SQL
CREATE TABLE tb_user
(
    `user_idx`              INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '사용자 인덱스', 
    `user_id`               VARCHAR(255)     NOT NULL    COMMENT '사용자 아이디', 
    `user_pw`               VARCHAR(255)     NOT NULL    COMMENT '비밀번호', 
    `user_nickname`         VARCHAR(255)     NOT NULL    COMMENT '닉네임', 
    `user_profile_picture`  VARCHAR(1000)    NOT NULL    COMMENT '프로필 사진', 
    `user_email`            VARCHAR(255)     NOT NULL    COMMENT '이메일', 
    `user_signup_date`      TIMESTAMP        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '가입일자', 
    `user_role`             VARCHAR(5)       NOT NULL    DEFAULT 'user' COMMENT '권한', 
    `user_is_active`        BOOLEAN          NOT NULL    DEFAULT 0 COMMENT '탈퇴여부', 
    `user_point`            INT              NOT NULL    COMMENT '스마일 포인트(잔액)', 
     PRIMARY KEY (user_idx)
) COMMENT '사용자';

-- Unique Index 설정 SQL - tb_user(user_nickname, user_email)
CREATE UNIQUE INDEX UQ_user_1
    ON tb_user(user_nickname, user_email);

-- tb_character Table Create SQL
CREATE TABLE tb_character
(
    `character_idx`       INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '캐릭터 인덱스', 
    `character_category`  VARCHAR(50)     NOT NULL    COMMENT '캐릭터 카테고리', 
    `character_name`      VARCHAR(50)     NOT NULL    COMMENT '캐릭터 이름', 
    `character_image`     VARCHAR(50)     NOT NULL    COMMENT '캐릭터 사진 경로', 
    `character_des`       TEXT            NOT NULL    COMMENT '캐릭터 설명', 
    `character_gender`    VARCHAR(1)      NOT NULL    COMMENT '캐릭터 성별', 
    `character_likes`     VARCHAR(50)     NOT NULL    COMMENT '캐릭터 좋아하는것', 
    `character_nolike`    VARCHAR(50)     NOT NULL    COMMENT '캐릭터 싫어하는것', 
    `character_color`     VARCHAR(50)     NOT NULL    COMMENT '고유 색상', 
    `character_price`     INT             NOT NULL    DEFAULT 0 COMMENT '캐릭터 가격', 
     PRIMARY KEY (character_idx)
) COMMENT '캐릭터 도감';

-- tb_point_payment Table Create SQL
CREATE TABLE tb_point_payment
(
    `point_idx`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '포인트 인덱스', 
    `character_idx`  INT UNSIGNED    NOT NULL    COMMENT '캐릭터 인덱스', 
    `point_date`     TIMESTAMP       NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '포인트 결제 날짜', 
    `point_amount`   INT             NOT NULL    COMMENT '포인트 남은 금액', 
    `user_idx`       INT UNSIGNED    NOT NULL    COMMENT '사용자 인덱스', 
     PRIMARY KEY (point_idx)
) COMMENT '포인트 내용';

-- Foreign Key 설정 SQL - tb_point_payment(character_idx) -> tb_character(character_idx)
ALTER TABLE tb_point_payment
    ADD CONSTRAINT FK_tb_point_payment_character_idx_tb_character_character_idx FOREIGN KEY (character_idx)
        REFERENCES tb_character (character_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - tb_point_payment(user_idx) -> tb_user(user_idx)
ALTER TABLE tb_point_payment
    ADD CONSTRAINT FK_tb_point_payment_user_idx_tb_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES tb_user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- tb_board Table Create SQL
CREATE TABLE tb_board
(
    `board_idx`         INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '게시판 인덱스', 
    `user_idx`          INT UNSIGNED     NOT NULL    COMMENT '작성자', 
    `board_title`       VARCHAR(1500)    NOT NULL    COMMENT '제목', 
    `board_file_path`   VARCHAR(1000)    NOT NULL    COMMENT '첨부파일 경로', 
    `board_content`     TEXT             NOT NULL    COMMENT '설명', 
    `board_view_count`  INT UNSIGNED     NOT NULL    DEFAULT 0 COMMENT '조회수', 
    `board_updated_at`  TIMESTAMP        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '작성일', 
     PRIMARY KEY (board_idx)
) COMMENT '게시판(자랑)';

-- Foreign Key 설정 SQL - tb_board(user_idx) -> tb_user(user_idx)
ALTER TABLE tb_board
    ADD CONSTRAINT FK_tb_board_user_idx_tb_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES tb_user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- tb_file Table Create SQL
CREATE TABLE tb_file
(
    `file_idx`       INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '파일 인덱스', 
    `file_name`      VARCHAR(50)     NOT NULL    COMMENT '이름', 
    `file_path`      VARCHAR(255)    NOT NULL    COMMENT '경로', 
    `file_category`  VARCHAR(255)    NOT NULL    COMMENT '파일 카테고리', 
     PRIMARY KEY (file_idx)
) COMMENT '파일경로 저장';

-- tb_customer_service Table Create SQL
CREATE TABLE tb_customer_service
(
    `customer_service_idx`       INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '고객지원 인덱스', 
    `customer_service_category`  VARCHAR(50)     NOT NULL    COMMENT '고객지원 카테고리', 
    `customer_service_title`     VARCHAR(50)     NOT NULL    COMMENT '고객지원 제목', 
    `customer_service_content`   TEXT            NOT NULL    COMMENT '고객지원 내용', 
    `customer_service_date`      TIMESTAMP       NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '고객지원 등록 날짜', 
    `user_idx`                   INT UNSIGNED    NOT NULL    COMMENT '작성자', 
    `customer_service_comment`   VARCHAR(50)     NOT NULL    COMMENT '관리자 댓글', 
     PRIMARY KEY (customer_service_idx)
) COMMENT '고객 지원';

-- Foreign Key 설정 SQL - tb_customer_service(user_idx) -> tb_user(user_idx)
ALTER TABLE tb_customer_service
    ADD CONSTRAINT FK_tb_customer_service_user_idx_tb_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES tb_user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- tb_payment Table Create SQL
CREATE TABLE tb_payment
(
    `payment_idx`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '결제 인덱스', 
    `payment_date`     DATETIME        NOT NULL    COMMENT '결제 날짜', 
    `payment_content`  VARCHAR(50)     NOT NULL    COMMENT '결제 내역', 
    `user_idx`         INT UNSIGNED    NOT NULL    COMMENT '결제 사람', 
     PRIMARY KEY (payment_idx)
) COMMENT '결제 기록(현금 -> 포인트)';

-- Foreign Key 설정 SQL - tb_payment(user_idx) -> tb_user(user_idx)
ALTER TABLE tb_payment
    ADD CONSTRAINT FK_tb_payment_user_idx_tb_user_user_idx FOREIGN KEY (user_idx)
        REFERENCES tb_user (user_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- 포인트차감 및 캐릭터 하루대여관련 컬럼추가
ALTER TABLE tb_point_payment
ADD rental_end_date timestamp NULL COMMENT '대여 만료일',
ADD rental_status varchar(20) DEFAULT 'ACTIVE' COMMENT '대여 상태';

INSERT INTO tb_customer_service 
(customer_service_category, customer_service_title, customer_service_content, user_idx, customer_service_comment)
VALUES
('0', '시스템 정기점검 안내', '2024년 1월 정기점검 안내드립니다...', 1, '안내 완료'),
('0', '캐릭터 업데이트 안내', '새로운 캐릭터가 추가될 예정입니다...', 1, '안내 완료'),
('0', '결제 시스템 개선 안내', '결제 시스템이 개선될 예정입니다...', 1, '안내 완료'),
('1', '포인트 충전 방법 안내', '포인트 충전 방법에 대해 안내드립니다...', 1, '답변 완료'),
('1', '캐릭터 구매 방법 안내', '캐릭터 구매 절차를 안내드립니다...', 1, '답변 완료'),
('1', '비밀번호 변경 방법', '비밀번호 변경 방법을 안내드립니다...', 1, '답변 완료'),
('2', '새로운 기능 제안', '채팅 시스템 개선을 제안드립니다...', 2, '검토중'),
('2', '캐릭터 추가 요청', '새로운 캐릭터 추가를 요청드립니다...', 2, '검토중'),
('2', '이벤트 제안', '신규 이벤트 아이디어를 제안드립니다...', 2, '검토중'),
('0', '연말 이벤트 안내', '12월 특별 이벤트를 안내드립니다...', 1, '안내 완료');