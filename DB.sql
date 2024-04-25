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
	`memberId`	INT(10)	UNSIGNED NOT NULL	COMMENT 'member의 id',
	`boardId`	INT(10)	UNSIGNED NOT NULL
);

CREATE TABLE `travelSchedule` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	CHAR(100)	NULL,
	`description`	TEXT	NULL,
	`startDate`	DATETIME	NULL,
	`endDate`	DATETIME	NULL,
	`step`	INT(2)	NULL,
	`regionId`	INT(10)	UNSIGNED NOT NULL,
	`memberId`	INT(10)	UNSIGNED NOT NULL	COMMENT 'member의 id'
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
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`delDate`	DATETIME	NULL,
	`delStatus`	TINYINT(1)	NULL,
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
	`id`	INT(10)	COMMENT '여행지 설명 및 꿀팁 세션 아이디',
	`information`	TEXT	NULL	COMMENT '여행지에 대한 설명문',
	`Voltage`	CHAR(30)	NULL	COMMENT '전압',
	`language`	CHAR(20)	NULL	COMMENT '사용언어',
	`climate`	CHAR(30)	NULL	COMMENT '기후',
	`timeDifference`	CHAR(100)	NULL	COMMENT '시차',
	`rate`	CHAR(100)	NULL,
	`tips`	CHAR(100)	NULL,
	`regionId`	INT(10)	UNSIGNED NOT NULL
);

CREATE TABLE `anniversaryDates` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL,
	`day`	DATETIME	NULL,
	`countryId`	INT(10)	UNSIGNED NOT NULL
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
	`scheduleId`	INT(10)	UNSIGNED NOT NULL
);

CREATE TABLE `fashion` (
	`id`	INT(10)	NOT NULL,
	`regData`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(100)	NULL,
	`brand`	VARCHAR(50)	NULL,
	`imageUrl`	TEXT	NULL,
	`gender`	TINYINT(1)	NULL,
	`scheduleId`	INT(10)	UNSIGNED NOT NULL
);

CREATE TABLE `shoppingList` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL,
	`description`	TEXT	NULL,
	`imageUrl`	TEXT	NULL,
	`regionId`	INT(10)	UNSIGNED NOT NULL
);

CREATE TABLE `region` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	VARCHAR(30)	NULL,
	`naverRegionCord`	CHAR(20)	NULL,
	`imageUrl`	TEXT	NULL,
	`countryId`	INT(10)	UNSIGNED NOT NULL
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
	`countryId`	INT(10)	UNSIGNED NOT NULL
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
	`memberId`	INT(10)	UNSIGNED NOT NULL	COMMENT 'member의 id'
);

CREATE TABLE `spotifyMember` (
	`id`	INT(20)	NOT NULL	COMMENT '스포티파이 소셜로그인 회원id',
	`name`	CHAR(50)	NULL	COMMENT '스포티파이 소셜로그인 회원 이름',
	`email`	CHAR(100)	NULL	COMMENT '스포티파이 소셜로그인 회원 email',
	`sporifyUserId`	INT(20)	UNSIGNED NULL	COMMENT '스포티파이 회원의 id'
);

CREATE TABLE `reply` (
	`id`	INT(10)	NOT NULL,
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`relTypeCode`	CHAR(50)	NULL,
	`relId`	INT(10)	NULL,
	`body`	TEXT	NULL,
	`memberId`	INT(10)	UNSIGNED NOT NULL	COMMENT 'member의 id'
);

CREATE TABLE `recommendSpotReview` (
	`id`	INT(10)	NOT NULL	COMMENT '추천 장소 리뷰id',
	`grade`	INT(10)	NULL	COMMENT '평점',
	`regDate`	DATETIME	NULL	COMMENT '작성날짜',
	`body`	TEXT	NULL	COMMENT '리뷰 내용',
	`spotId`	INT(10)	UNSIGNED NOT NULL	COMMENT '추천 장소 id',
	`memberId`	INT(10)	UNSIGNED NOT NULL	COMMENT 'member의 id'
);

## 주키 추가
ALTER TABLE `article` MODIFY `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `travelSchedule` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `member` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `genFile` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `regionInfoTips` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `anniversaryDates` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `country` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `weather` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `fashion` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `shoppingList` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `region` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `recommendRegion` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `tabList` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `recommendSpot` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `regionSymbolicWord` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `tag` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `board` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `reactionPoint` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `spotifyMember` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);
ALTER TABLE `reply` MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);

## 관계키 추가
ALTER TABLE `article` ADD CONSTRAINT `FK_member_TO_article_1` FOREIGN KEY (
	`memberId`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `article` ADD CONSTRAINT `FK_board_TO_article_1` FOREIGN KEY (
	`boardId`
)
REFERENCES `board` (
	`id`
);

ALTER TABLE `travelSchedule` ADD CONSTRAINT `FK_region_TO_travelSchedule_1` FOREIGN KEY (
	`regionId`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `travelSchedule` ADD CONSTRAINT `FK_member_TO_travelSchedule_1` FOREIGN KEY (
	`memberId`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `regionInfoTips` ADD CONSTRAINT `FK_region_TO_regionInfoTips_1` FOREIGN KEY (
	`regionId`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `anniversaryDates` ADD CONSTRAINT `FK_country_TO_anniversaryDates_1` FOREIGN KEY (
	`countryId`
)
REFERENCES `country` (
	`id`
);

ALTER TABLE `weather` ADD CONSTRAINT `FK_travelSchedule_TO_weather_1` FOREIGN KEY (
	`scheduleId`
)
REFERENCES `travelSchedule` (
	`id`
);

ALTER TABLE `fashion` ADD CONSTRAINT `FK_travelSchedule_TO_fashion_1` FOREIGN KEY (
	`scheduleId`
)
REFERENCES `travelSchedule` (
	`id`
);

ALTER TABLE `shoppingList` ADD CONSTRAINT `FK_region_TO_shoppingList_1` FOREIGN KEY (
	`regionId`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `region` ADD CONSTRAINT `FK_country_TO_region_1` FOREIGN KEY (
	`countryId`
)
REFERENCES `country` (
	`id`
);

ALTER TABLE `regionSymbolicWord` ADD CONSTRAINT `FK_region_TO_regionSymbolicWord_1` FOREIGN KEY (
	`countryId`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `reactionPoint` ADD CONSTRAINT `FK_member_TO_reactionPoint_1` FOREIGN KEY (
	`memberId`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `reply` ADD CONSTRAINT `FK_member_TO_reply_1` FOREIGN KEY (
	`memberId`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `recommendSpotReview` ADD CONSTRAINT `FK_recommendSpot_TO_recommendSpotReview_1` FOREIGN KEY (
	`spotId`
)
REFERENCES `recommendSpot` (
	`id`
);

ALTER TABLE `recommendSpotReview` ADD CONSTRAINT `FK_member_TO_recommendSpotReview_1` FOREIGN KEY (
	`memberId`
)
REFERENCES `member` (
	`id`
);


########### TEST DATA ############


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


UPDATE article
SET memberId = 2
WHERE id IN (1,2);

UPDATE article
SET memberId = 3
WHERE id IN (3,4);


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


UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

UPDATE article
SET boardId = 3
WHERE id = 4;


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



SELECT * FROM article;

SELECT * FROM board;