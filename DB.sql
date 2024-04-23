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
	`regDate`	DATETIME	NULL,
	`updateDate`	DATETIME	NULL,
	`name`	CHAR(100)	NULL,
	`description`	TEXT	NULL,
	`startDate`	DATETIME	NULL,
	`endDate`	DATETIME	NULL,
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
ALTER TABLE `recommendSpotReview` MODIFY `id` INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (`id`);