DROP DATABASE IF EXISTS `Trip_Angle_24_04`;
CREATE DATABASE `Trip_Angle_24_04`;
USE `Trip_Angle_24_04`;


CREATE TABLE `article` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL	COMMENT '작성날짜',
	`updateDate`	DATETIME	NULL	COMMENT '수정날짜',
	`hitCount`	INT(10)	NULL,
	`title`	CHAR(100)	NULL	COMMENT '제목',
	`body`	TEXT	NULL	COMMENT '내용',
	`memberId`	INT(10)	NOT NULL	COMMENT 'member의 id',
	`boardId`	INT(10)	NOT NULL
);

CREATE TABLE `travelSchedule` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DateTime	NULL,
	`updateDate`	DateTime	NULL,
	`name`	CHAR(100)	NULL,
	`description`	TEXT	NULL,
	`startDate`	DateTime	NULL,
	`endDate`	DateTime	NULL,
	`step`	INT(2)	NULL,
	`regionId`	INT(10)	NOT NULL,
	`memberId`	INT(10)	NOT NULL	COMMENT 'member의 id'
);

CREATE TABLE `member` (
	`id`	INT(10)	NOT NULL	COMMENT 'member의 id',
	`regDate`	DATETIME	NULL	COMMENT '가입날짜',
	`updateDate`	DATETIME	NULL	COMMENT '정보수정날짜',
	`loginId`	CHAR(20)	NULL	COMMENT '로그인 아이디',
	`loginPw`	CHAR(80)	NULL	COMMENT '비밀번호',
	`authLevel`	SMALLINT(2)	NULL	COMMENT '권한 레벨 (3=일반,7=관리자)',
	`name`	CHAR(20)	NULL	COMMENT '회원 이름',
	`nickName`	CHAR(20)	NULL	COMMENT '회원 닉네임(별명)',
	`cellphoneNum`	CHAR(20)	NULL	COMMENT '회원 전화번호',
	`email`	CHAR(50)	NULL	COMMENT '회원가입 이메일(비밀번호, 아이디 찾기 등)',
	`delStatus`	TINYINT(1)	NULL	COMMENT '탈퇴 여부 (0=탈퇴 전, 1= 탈퇴 후)',
	`delDate`	DATETIME	NULL	COMMENT '탈퇴 날짜',
	`socialLoginStatus`	INT(3)	NULL	COMMENT '0 = 스포티파이 회원 아님, 1 = 스포티파이 회원'
);

CREATE TABLE `genFile` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DateTime	NULL,
	`updateDate`	DateTime	NULL,
	`delDate`	DateTime	NULL,
	`delStatus`	TinyINT(1)	NULL,
	`relTypeCode`	CHAR(50)	NULL,
	`relId`	INT(10)	NULL,
	`originFileName`	VARCHAR(100)	NULL,
	`fileExt`	CHAR(10)	NULL,
	`typeCode`	CHAR(20)	NULL,
	`type2Code`	CHAR(20)	NULL,
	`fileSize`	INT(10)	NULL,
	`fileExtTypeCode`	CHAR(10)	NULL,
	`fileExtType2Code`	CHAR(10)	NULL,
	`fileNo`	SMALLINT(2)	NULL,
	`fileDir`	CHAR(20)	NULL
);

CREATE TABLE `regionInfoTips` (
	`id`	INT(10)	UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '여행지 설명 및 꿀팁 세션 아이디',
	`information`	TEXT	NULL	COMMENT '여행지에 대한 설명문',
	`Voltage`	CHAR(30)	NULL	COMMENT '전압',
	`language`	CHAR(20)	NULL	COMMENT '사용언어',
	`climate`	CHAR(30)	NULL	COMMENT '기후',
	`timeDifference`	CHAR(100)	NULL	COMMENT '시차',
	`rate`	CHAR(100)	NULL,
	`tips`	CHAR(100)	NULL,
	`regionId`	INT(10)	NOT NULL
);

CREATE TABLE `anniversaryDates` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL,
	`day`	DATETIME	NULL,
	`countryId`	INT(10)	NOT NULL
);

CREATE TABLE `country` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL
);

CREATE TABLE `weather` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`day`	DATETIME	NULL,
	`minTemp`	DECIMAL(5,2)	NULL,
	`maxTemp`	DECIMAL(5,2)	NULL,
	`humidity`	INT(3)	NULL,
	`icon`	CHAR(3)	NULL,
	`scheduleId`	INT(10)	NOT NULL
);

CREATE TABLE `fashion` (
	`id`	INT(10)	NOT NULL,
	`regData`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(100)	NULL,
	`brand`	VARCHAR(50)	NULL,
	`imageUrl`	TEXT	NULL,
	`scheduleId`	INT(10)	NOT NULL
);

CREATE TABLE `shoppingList` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL,
	`description`	TEXT	NULL,
	`imageUrl`	TEXT	NULL,
	`regionId`	INT(10)	NOT NULL
);

CREATE TABLE `region` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL,
	`naverRegionCord`	CHAR(20)	NULL,
	`countryId`	INT(10)	NOT NULL
);

CREATE TABLE `recommendRegion` (
	`id`	INT(20)	NOT NULL	COMMENT '추천장소 id',
	`SpotName`	CHAR(50)	NULL	COMMENT '장소 명',
	`grade`	INT(20)	NULL	COMMENT '평점',
	`reviewCount`	INT(100)	NULL	COMMENT '리뷰 갯수',
	`countryName`	CHAR(50)	NULL	COMMENT '국가명',
	`regionName`	CHAR(50)	NULL	COMMENT '지역명',
	`goodReactionPoint`	INT(100)	NULL	COMMENT '좋아요갯수'
);

CREATE TABLE `tabList` (
	`id`	INT(10)	NOT NULL	COMMENT '테마별 추천 장소 리스트 id',
	`themeName`	CHAR(50)	NULL	COMMENT '테마명',
	`themeBody`	CHAR(100)	NULL	COMMENT '테마별 설명'
);

CREATE TABLE `recommendSpot` (
	`id`	INT(10)	NOT NULL	COMMENT '추천 장소 id',
	`groceryName`	CHAR(50)	NULL	COMMENT '가게명',
	`grade`	INT(20)	NULL	COMMENT '평점',
	`reviewCount`	INT(100)	NULL	COMMENT '리뷰 갯수',
	`address`	CHAR(50)	NULL	COMMENT '주소',
	`operatingTime`	TIME	NULL	COMMENT '운영 시간',
	`phoneNumber`	CHAR(100)	NULL	COMMENT '전화번호'
);

CREATE TABLE `regionSymbolicWord` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`symbolicWord`	CHAR(30)	NULL,
	`countryId`	INT(10)	NOT NULL
);

CREATE TABLE `tag` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	CHAR(30)	NULL,
	`relTypeCode`	CHAR(50)	NULL,
	`relId`	INT(10)	NULL
);

CREATE TABLE `board` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL	COMMENT '작성날짜',
	`updateDate`	DATETIME	NULL	COMMENT '수정날짜',
	`code`	CHAR(50)	NULL	COMMENT '제목',
	`name`	TEXT	NULL	COMMENT '내용',
	`delStatus`	TINYINT(1)	NULL,
	`delDate`	DATETIME	NULL
);

CREATE TABLE `reactionPoint` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`relTypeCode`	CHAR(50)	NULL,
	`relId`	INT(10)	NULL,
	`point`	INT(10)	NULL,
	`memberId`	INT(10)	NOT NULL	COMMENT 'member의 id'
);

CREATE TABLE `spotifyMember` (
	`id`	INT(20)	NOT NULL	COMMENT '스포티파이 소셜로그인 회원id',
	`name`	CHAR(50)	NULL	COMMENT '스포티파이 소셜로그인 회원 이름',
	`email`	CHAR(100)	NULL	COMMENT '스포티파이 소셜로그인 회원 email',
	`sporifyUserId`	INT(20)	NULL	COMMENT '스포티파이 회원의 id'
);

CREATE TABLE `reply` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`relTypeCode`	CHAR(50)	NULL,
	`relId`	INT(10)	NULL,
	`body`	TEXT	NULL,
	`memberId`	INT(10)	NOT NULL	COMMENT 'member의 id'
);

CREATE TABLE `recommendSpotReview` (
	`id`	INT(10)	NOT NULL	COMMENT '추천 장소 리뷰id',
	`grade`	INT(10)	NULL	COMMENT '평점',
	`regDate`	DATETIME	NULL	COMMENT '작성날짜',
	`body`	TEXT	NULL	COMMENT '리뷰 내용',
	`spotId`	INT(10)	NOT NULL	COMMENT '추천 장소 id',
	`memberId`	INT(10)	NOT NULL	COMMENT 'member의 id'
);

ALTER TABLE `article` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `travelSchedule` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `member` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `genFile` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `regionInfoTips` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `anniversaryDates` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `country` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `weather` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `fashion` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `shoppingList` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `region` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `recommendRegion` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `tabList` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `recommendSpot` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `regionSymbolicWord` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `tag` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `board` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `reactionPoint` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `spotifyMember` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `reply` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);



########### TEST DATA ############

DROP DATABASE IF EXISTS `Spring_AM_01`;
CREATE DATABASE `Spring_AM_01`;
USE `Spring_AM_01`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);


# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# member TD 생성
# (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcd@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1',
cellphoneNum = '01043214321',
email = 'abcde@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2',
cellphoneNum = '01056785678',
email = 'abcdef@gmail.com';

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE article
SET memberId = 2
WHERE id IN (1,2);

UPDATE article
SET memberId = 3
WHERE id IN (3,4);


# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

# board TD 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';

ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

UPDATE article
SET boardId = 3
WHERE id = 4;

ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

# reactionPoint 테이블 생성
CREATE TABLE reactionPoint(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

# article 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE article AS A
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`body` = '댓글 4';

# reply 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE reply ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE reply ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 1번 회원이 2번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 2,
`point` = 1;

# 2번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 2번 회원이 2번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 2,
`point` = -1;

# 3번 회원이 1번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'reply',
relId = 1,
`point` = 1;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE reply AS R
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON R.id = RP_SUM.relId
SET R.goodReactionPoint = RP_SUM.goodReactionPoint,
R.badReactionPoint = RP_SUM.badReactionPoint;

###############################################

SELECT * FROM article;

SELECT * FROM `member`;

SELECT * FROM `board`;

SELECT * FROM reactionPoint;

SELECT * FROM `reply`;



SELECT goodReactionPoint
FROM article 
WHERE id = 1

INSERT INTO article
(
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(),NOW(), FLOOR(RAND() * 2) + 2, FLOOR(RAND() * 3) + 1, CONCAT('제목_',RAND()), CONCAT('내용_',RAND())
FROM article;

SELECT IFNULL(SUM(RP.point),0)
FROM reactionPoint AS RP
WHERE RP.relTypeCode = 'article'
AND RP.relId = 3
AND RP.memberId = 1;


UPDATE article 
SET title = '제목5'
WHERE id = 5;

UPDATE article 
SET title = '제목11'
WHERE id = 6;

UPDATE article 
SET title = '제목45'
WHERE id = 7;

SELECT FLOOR(RAND() * 2) + 2

SELECT FLOOR(RAND() * 3) + 1


SHOW FULL COLUMNS FROM `member`;
DESC `member`;



SELECT LAST_INSERT_ID();

SELECT *
FROM article AS A
WHERE 1

	AND boardId = 1

			AND A.title LIKE CONCAT('%','0000','%')
			OR A.body LIKE CONCAT('%','0000','%')

ORDER BY id DESC

SELECT COUNT(*)
FROM article AS A
WHERE 1
AND boardId = 1
AND A.title LIKE CONCAT('%','0000','%')
OR A.body LIKE CONCAT('%','0000','%')
ORDER BY id DESC


SELECT hitCount
FROM article
WHERE id = 374;

SELECT A.*
FROM article AS A
WHERE A.id = 1

SELECT A.*, M.nickname AS extra__writer
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
WHERE A.id = 1

# LEFT JOIN
SELECT A.*, M.nickname AS extra__writer, RP.point
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 서브쿼리
SELECT A.*,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM (
    SELECT A.*, M.nickname AS extra__writer 
    FROM article AS A
    INNER JOIN `member` AS M
    ON A.memberId = M.id
    ) AS A
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 조인
SELECT A.*, M.nickname AS extra__writer,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;


SELECT *, COUNT(*)
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

SELECT IF(RP.point > 0, '큼','작음')
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

# 각 게시물의 좋아요, 싫어요 갯수
SELECT RP.relTypeCode, RP.relId,
SUM(IF(RP.point > 0,RP.point,0)) AS goodReactionPoint,
SUM(IF(RP.point < 0,RP.point * -1,0)) AS badReactionPoint
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId