--------------------------------------------------------
--  파일이 생성됨 - 일요일-8월-07-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARD_BNO
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_BNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 103 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARD_COMMENT_CNO
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_COMMENT_CNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARD_IMAGE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_IMAGE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "QNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BNO" NUMBER, 
	"TITLE" VARCHAR2(60 BYTE), 
	"WRITER" VARCHAR2(30 BYTE), 
	"BDATE" DATE DEFAULT SYSDATE, 
	"BCOUNT" NUMBER, 
	"CONTENT" VARCHAR2(1000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT
--------------------------------------------------------

  CREATE TABLE "BOARD_COMMENT" 
   (	"CNO" NUMBER, 
	"CONTENT" VARCHAR2(500 BYTE), 
	"CDATE" DATE DEFAULT SYSDATE, 
	"BNO" NUMBER, 
	"WRITER" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT_HATE
--------------------------------------------------------

  CREATE TABLE "BOARD_COMMENT_HATE" 
   (	"CNO" NUMBER, 
	"ID" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT_LIKE
--------------------------------------------------------

  CREATE TABLE "BOARD_COMMENT_LIKE" 
   (	"CNO" NUMBER, 
	"ID" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_FILE
--------------------------------------------------------

  CREATE TABLE "BOARD_FILE" 
   (	"BNO" NUMBER, 
	"FNO" NUMBER(1,0), 
	"PATH" VARCHAR2(771 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_HATE
--------------------------------------------------------

  CREATE TABLE "BOARD_HATE" 
   (	"BNO" NUMBER, 
	"ID" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_IMAGE
--------------------------------------------------------

  CREATE TABLE "BOARD_IMAGE" 
   (	"BI_NO" NUMBER, 
	"PATH" VARCHAR2(800 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_LIKE
--------------------------------------------------------

  CREATE TABLE "BOARD_LIKE" 
   (	"BNO" NUMBER, 
	"ID" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD_MEMBER
--------------------------------------------------------

  CREATE TABLE "BOARD_MEMBER" 
   (	"ID" VARCHAR2(30 BYTE), 
	"PASSWD" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"NICK" VARCHAR2(30 BYTE), 
	"GRADE_NO" NUMBER(1,0)
   ) ;
--------------------------------------------------------
--  DDL for Table GRADE
--------------------------------------------------------

  CREATE TABLE "GRADE" 
   (	"GRADE_NO" NUMBER(1,0), 
	"GRADE_NAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MAJOR_LIST
--------------------------------------------------------

  CREATE TABLE "MAJOR_LIST" 
   (	"MNO" NUMBER, 
	"MNAME" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" 
   (	"QNO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"WDATE" DATE DEFAULT sysdate, 
	"WRITER" VARCHAR2(30 BYTE), 
	"STATUS" NUMBER(1,0) DEFAULT 0, 
	"RESPONSE" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for View BOARD_COMMENT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BOARD_COMMENT_VIEW" ("CNO", "BNO", "CONTENT", "WRITER", "CDATE", "CLIKE", "CHATE") AS 
  select bca."CNO",bca."BNO",bca."CONTENT",bca."WRITER",bca."CDATE",bca."CLIKE",bca."CHATE" from (select bc.cno as cno, bc.bno, bc.content, bc.writer, bc.cdate as cdate,  (select count(*) from board_comment_like where cno = bc.cno) as clike, (select count(*) from board_comment_hate where cno = bc.cno) as chate from board_comment bc) bca order by cno
;
--------------------------------------------------------
--  DDL for View BOARD_CONTENT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BOARD_CONTENT_VIEW" ("BNO", "TITLE", "WRITER", "NICK", "BCOUNT", "BDATE", "BLIKE", "BHATE", "CONTENT") AS 
  SELECT b.bno, b.title, b.writer, bm.nick, b.bcount, b.bdate ,
(SELECT COUNT(*) FROM BOARD_LIKE BL WHERE BL.BNO = B.BNO) AS BLIKE,
(SELECT COUNT(*) FROM BOARD_HATE BH WHERE BH.BNO = B.BNO) AS BHATE,
b.content
FROM BOARD B, BOARD_MEMBER BM
WHERE B.WRITER = BM.ID ORDER BY BNO DESC
;
--------------------------------------------------------
--  DDL for View BOARD_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BOARD_VIEW" ("BNO", "TITLE", "WRITER", "NICK", "BCOUNT", "BDATE", "BLIKE", "BHATE", "CONTENT") AS 
  SELECT b.bno, b.title ||
decode((select count(*) from board_comment bc where bc.bno = b.bno),0,'',
'[' || (select count(*) from board_comment bc where bc.bno = b.bno) || ']') as title, b.writer, bm.nick, b.bcount, b.bdate ,
(SELECT COUNT(*) FROM BOARD_LIKE BL WHERE BL.BNO = B.BNO) AS BLIKE,
(SELECT COUNT(*) FROM BOARD_HATE BH WHERE BH.BNO = B.BNO) AS BHATE, b.content
FROM BOARD B, BOARD_MEMBER BM
WHERE B.WRITER = BM.ID ORDER BY BNO DESC
;
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (1,'헌법재판소에서 법률의 위헌결…','A0001',to_date('22/04/01','RR/MM/DD'),1714,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (2,'국군은 국가의 안전보장과 국…','A0009',to_date('22/04/02','RR/MM/DD'),847,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (3,'대법원은 법률에 저촉되지 아…','A0006',to_date('22/04/02','RR/MM/DD'),324,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (4,'대통령은 제4항과 제5항의 …','A0007',to_date('22/04/03','RR/MM/DD'),1026,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (5,'대통령은 제4항과 제5항의 …','A0010',to_date('22/04/03','RR/MM/DD'),1433,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (6,'국회의원과 정부는 법률안을 …','A0010',to_date('22/04/04','RR/MM/DD'),1661,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (7,'대한민국의 국민이 되는 요건…','A0009',to_date('22/04/04','RR/MM/DD'),924,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (8,'대통령은 제4항과 제5항의 …','A0007',to_date('22/04/05','RR/MM/DD'),884,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (9,'헌법재판소에서 법률의 위헌결…','A0002',to_date('22/04/05','RR/MM/DD'),1982,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (10,'법관은 탄핵 또는 금고 이상…','A0004',to_date('22/04/05','RR/MM/DD'),1877,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (11,'위원은 정당에 가입하거나 정…','A0005',to_date('22/04/08','RR/MM/DD'),781,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (12,'대통령은 제4항과 제5항의 …','A0008',to_date('22/04/10','RR/MM/DD'),68,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (13,'대법원은 법률에 저촉되지 아…','A0007',to_date('22/04/10','RR/MM/DD'),1372,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (14,'각급 선거관리위원회는 선거인…','A0006',to_date('22/04/11','RR/MM/DD'),159,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (15,'국회의원과 정부는 법률안을 …','A0005',to_date('22/04/12','RR/MM/DD'),1226,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (16,'각급 선거관리위원회는 선거인…','A0008',to_date('22/04/12','RR/MM/DD'),1806,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (17,'대통령은 제4항과 제5항의 …','A0003',to_date('22/04/16','RR/MM/DD'),1778,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (18,'대통령은 제4항과 제5항의 …','A0009',to_date('22/04/16','RR/MM/DD'),712,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (19,'위원은 정당에 가입하거나 정…','A0007',to_date('22/04/18','RR/MM/DD'),1562,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (20,'헌법재판소에서 법률의 위헌결…','A0003',to_date('22/04/19','RR/MM/DD'),1219,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (21,'헌법재판소에서 법률의 위헌결…','A0010',to_date('22/04/19','RR/MM/DD'),774,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (22,'대법원은 법률에 저촉되지 아…','A0005',to_date('22/04/19','RR/MM/DD'),636,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (23,'각급 선거관리위원회는 선거인…','A0001',to_date('22/04/20','RR/MM/DD'),1010,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (24,'법관은 탄핵 또는 금고 이상…','A0010',to_date('22/04/21','RR/MM/DD'),1931,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (25,'대한민국의 국민이 되는 요건…','A0002',to_date('22/04/21','RR/MM/DD'),1092,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (26,'국군은 국가의 안전보장과 국…','A0003',to_date('22/04/25','RR/MM/DD'),757,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (27,'법관은 탄핵 또는 금고 이상…','A0001',to_date('22/04/26','RR/MM/DD'),1937,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (28,'국군은 국가의 안전보장과 국…','A0009',to_date('22/04/27','RR/MM/DD'),982,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (29,'위원은 정당에 가입하거나 정…','A0010',to_date('22/04/27','RR/MM/DD'),493,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (30,'국회의원과 정부는 법률안을 …','A0001',to_date('22/04/27','RR/MM/DD'),803,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (31,'법관은 탄핵 또는 금고 이상…','A0002',to_date('22/04/29','RR/MM/DD'),1852,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (32,'대법원은 법률에 저촉되지 아…','A0003',to_date('22/04/29','RR/MM/DD'),718,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (33,'위원은 정당에 가입하거나 정…','A0010',to_date('22/04/30','RR/MM/DD'),265,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (34,'위원은 정당에 가입하거나 정…','A0002',to_date('22/05/01','RR/MM/DD'),405,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (35,'대한민국의 국민이 되는 요건…','A0004',to_date('22/05/02','RR/MM/DD'),1716,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (36,'국회의원과 정부는 법률안을 …','A0009',to_date('22/05/03','RR/MM/DD'),354,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (37,'위원은 정당에 가입하거나 정…','A0007',to_date('22/05/03','RR/MM/DD'),1793,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (38,'국군은 국가의 안전보장과 국…','A0007',to_date('22/05/03','RR/MM/DD'),559,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (39,'각급 선거관리위원회는 선거인…','A0005',to_date('22/05/03','RR/MM/DD'),1574,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (41,'대통령은 제4항과 제5항의 …','A0010',to_date('22/05/09','RR/MM/DD'),1759,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (42,'법관은 탄핵 또는 금고 이상…','A0006',to_date('22/05/10','RR/MM/DD'),1601,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (43,'위원은 정당에 가입하거나 정…','A0001',to_date('22/05/13','RR/MM/DD'),1589,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (44,'국회의원과 정부는 법률안을 …','A0001',to_date('22/05/14','RR/MM/DD'),876,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (45,'국회의원과 정부는 법률안을 …','A0003',to_date('22/05/15','RR/MM/DD'),907,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (46,'법관은 탄핵 또는 금고 이상…','A0004',to_date('22/05/16','RR/MM/DD'),1918,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (47,'대법원은 법률에 저촉되지 아…','A0006',to_date('22/05/18','RR/MM/DD'),357,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (48,'국군은 국가의 안전보장과 국…','A0001',to_date('22/05/19','RR/MM/DD'),966,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (49,'법관은 탄핵 또는 금고 이상…','A0008',to_date('22/05/19','RR/MM/DD'),722,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (50,'국군은 국가의 안전보장과 국…','A0003',to_date('22/05/21','RR/MM/DD'),1201,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (51,'대한민국의 국민이 되는 요건…','A0008',to_date('22/05/21','RR/MM/DD'),161,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (52,'법관은 탄핵 또는 금고 이상…','A0010',to_date('22/05/25','RR/MM/DD'),1193,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (53,'국회의원과 정부는 법률안을 …','A0007',to_date('22/05/25','RR/MM/DD'),1729,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (54,'각급 선거관리위원회는 선거인…','A0003',to_date('22/05/26','RR/MM/DD'),1107,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (55,'국회의원과 정부는 법률안을 …','A0010',to_date('22/05/30','RR/MM/DD'),719,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (56,'국군은 국가의 안전보장과 국…','A0001',to_date('22/06/01','RR/MM/DD'),991,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (57,'대한민국의 국민이 되는 요건…','A0010',to_date('22/06/02','RR/MM/DD'),1447,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (58,'대통령은 제4항과 제5항의 …','A0001',to_date('22/06/02','RR/MM/DD'),1494,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (59,'법관은 탄핵 또는 금고 이상…','A0005',to_date('22/06/03','RR/MM/DD'),489,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (60,'국회의원과 정부는 법률안을 …','A0007',to_date('22/06/04','RR/MM/DD'),1323,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (61,'헌법재판소에서 법률의 위헌결…','A0005',to_date('22/06/09','RR/MM/DD'),1334,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (62,'국군은 국가의 안전보장과 국…','A0005',to_date('22/06/09','RR/MM/DD'),348,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (63,'헌법재판소에서 법률의 위헌결…','A0005',to_date('22/06/09','RR/MM/DD'),1539,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (64,'국군은 국가의 안전보장과 국…','A0010',to_date('22/06/09','RR/MM/DD'),1981,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (65,'국회의원과 정부는 법률안을 …','A0002',to_date('22/06/11','RR/MM/DD'),644,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (67,'헌법재판소에서 법률의 위헌결…','A0005',to_date('22/06/13','RR/MM/DD'),479,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (68,'각급 선거관리위원회는 선거인…','A0008',to_date('22/06/14','RR/MM/DD'),1501,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (69,'대법원은 법률에 저촉되지 아…','A0004',to_date('22/06/14','RR/MM/DD'),1766,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (70,'대법원은 법률에 저촉되지 아…','A0005',to_date('22/06/15','RR/MM/DD'),537,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (71,'헌법재판소에서 법률의 위헌결…','A0005',to_date('22/06/16','RR/MM/DD'),605,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (73,'위원은 정당에 가입하거나 정…','A0001',to_date('22/06/21','RR/MM/DD'),1607,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (74,'위원은 정당에 가입하거나 정…','A0009',to_date('22/06/23','RR/MM/DD'),100,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (75,'법관은 탄핵 또는 금고 이상…','A0006',to_date('22/06/24','RR/MM/DD'),129,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (76,'각급 선거관리위원회는 선거인…','A0008',to_date('22/06/24','RR/MM/DD'),1855,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (77,'각급 선거관리위원회는 선거인…','A0008',to_date('22/06/24','RR/MM/DD'),884,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 
 게시글 수정하기 입니다. 내용은 간략하게 적겠습니다. 엔터도 포함하겠습니다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (78,'헌법재판소에서 법률의 위헌결…','A0006',to_date('22/06/25','RR/MM/DD'),1671,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (79,'대한민국의 국민이 되는 요건…','A0010',to_date('22/06/27','RR/MM/DD'),486,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (80,'대법원은 법률에 저촉되지 아…','A0007',to_date('22/06/27','RR/MM/DD'),516,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (81,'대한민국의 국민이 되는 요건…','A0008',to_date('22/06/28','RR/MM/DD'),1631,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (82,'대법원은 법률에 저촉되지 아…','A0009',to_date('22/06/29','RR/MM/DD'),463,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (83,'각급 선거관리위원회는 선거인…','A0006',to_date('22/06/30','RR/MM/DD'),1587,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (87,'asdf','A0001',to_date('22/08/01','RR/MM/DD'),4,'asdfasfqwer');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (88,'asdfq','A0002',to_date('22/08/04','RR/MM/DD'),3,'<p>asdfqwerzxcv<img class="image_resized" style="width:77.51%;" src="imageDown.do?fno=1"></p>');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (89,'asdfasdfqwer','A0002',to_date('22/08/04','RR/MM/DD'),12,'<p>asdfsd<img src="imageDown.do?fno=2"></p>');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (90,'asdfasdf','A0002',to_date('22/08/05','RR/MM/DD'),14,'<p>asdffasdf</p><p>asdfasdfqwerqwe</p><p>asdfasdfqwetqwe</p>');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (92,'ㅁㄴㅇㅁㄴㅇㄹ','A0001',to_date('22/08/06','RR/MM/DD'),3,'<p>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㅇㄴㄹ</p><p>ㄴㅁㅇㄻㄴㅇㄻㄴㅇㄹ</p>');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (93,'글작성','A0001',to_date('22/08/06','RR/MM/DD'),4,'<p>&nbsp;이미지 테스트</p>');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (94,'안녕하세요','A0030',to_date('22/08/07','RR/MM/DD'),4,'<p>엔터키도 되는지 테스트</p><p>ckeditor입니다.</p>');
Insert into BOARD (BNO,TITLE,WRITER,BDATE,BCOUNT,CONTENT) values (95,'로그인 후 게시글 등록','A0020',to_date('22/08/07','RR/MM/DD'),3,'<p>파일 업로드 테스트 입니다. 5개를 올려보겠습니다.</p>');
REM INSERTING into BOARD_COMMENT
SET DEFINE OFF;
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (1,'asdf',to_date('22/07/22','RR/MM/DD'),83,'A0002');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (2,'asdfqr',to_date('22/07/22','RR/MM/DD'),83,'A0002');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (46,'댓글 작업 완료 하엿습니다.
엔터 키',to_date('22/08/06','RR/MM/DD'),90,'A0001');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (48,'ㄴㅇㄻㄴㅇㄹ',to_date('22/08/06','RR/MM/DD'),89,'A0004');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (47,'댓글 완료
<br>엔터키 조작여부 확인',to_date('22/08/06','RR/MM/DD'),90,'A0001');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (49,'ㅁㄴㅇㄹ',to_date('22/08/06','RR/MM/DD'),89,'A0004');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (50,'ㅁㄴㅇㄹ',to_date('22/08/06','RR/MM/DD'),88,'A0004');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (51,'alo',to_date('22/08/06','RR/MM/DD'),89,'A0001');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (41,'asdfqwer',to_date('22/08/01','RR/MM/DD'),82,'A0001');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (42,'asdfqwer',to_date('22/08/04','RR/MM/DD'),89,'A0002');
Insert into BOARD_COMMENT (CNO,CONTENT,CDATE,BNO,WRITER) values (52,'hello world',to_date('22/08/07','RR/MM/DD'),94,'A0020');
REM INSERTING into BOARD_COMMENT_HATE
SET DEFINE OFF;
Insert into BOARD_COMMENT_HATE (CNO,ID) values (2,'A0002');
Insert into BOARD_COMMENT_HATE (CNO,ID) values (49,'A0001');
Insert into BOARD_COMMENT_HATE (CNO,ID) values (52,'A0020');
REM INSERTING into BOARD_COMMENT_LIKE
SET DEFINE OFF;
Insert into BOARD_COMMENT_LIKE (CNO,ID) values (1,'A0002');
Insert into BOARD_COMMENT_LIKE (CNO,ID) values (41,'A0001');
Insert into BOARD_COMMENT_LIKE (CNO,ID) values (42,'A0001');
REM INSERTING into BOARD_FILE
SET DEFINE OFF;
Insert into BOARD_FILE (BNO,FNO,PATH) values (87,1,'c:\fileUpload\시험 압축 파일.zip');
Insert into BOARD_FILE (BNO,FNO,PATH) values (92,1,'c:\uploadFiles\javier-miranda-Jn2EaLLYZfY-unsplash.jpg');
Insert into BOARD_FILE (BNO,FNO,PATH) values (95,1,'c:\uploadFiles\localhost_9999_boardView.do_bno=89.png');
Insert into BOARD_FILE (BNO,FNO,PATH) values (95,2,'c:\uploadFiles\javier-miranda-Jn2EaLLYZfY-unsplash.jpg');
Insert into BOARD_FILE (BNO,FNO,PATH) values (95,3,'c:\uploadFiles\jan-kopriva-18oL-EZFO_I-unsplash.jpg');
Insert into BOARD_FILE (BNO,FNO,PATH) values (95,4,'c:\uploadFiles\jan-kopriva-18oL-EZFO_I-unsplash.jpg');
Insert into BOARD_FILE (BNO,FNO,PATH) values (95,5,'c:\uploadFiles\dawid-zawila--G3rw6Y02D0-unsplash.jpg');
REM INSERTING into BOARD_HATE
SET DEFINE OFF;
Insert into BOARD_HATE (BNO,ID) values (83,'A0002');
Insert into BOARD_HATE (BNO,ID) values (93,'A0001');
REM INSERTING into BOARD_IMAGE
SET DEFINE OFF;
Insert into BOARD_IMAGE (BI_NO,PATH) values (1,'c:\fileUpload\2022_08_04_06_49_53_A0002.jpg');
Insert into BOARD_IMAGE (BI_NO,PATH) values (2,'c:\fileUpload\2022_08_04_06_51_27_A0002.jpg');
REM INSERTING into BOARD_LIKE
SET DEFINE OFF;
Insert into BOARD_LIKE (BNO,ID) values (37,'A0001');
Insert into BOARD_LIKE (BNO,ID) values (83,'A0002');
Insert into BOARD_LIKE (BNO,ID) values (83,'A0008');
Insert into BOARD_LIKE (BNO,ID) values (90,'A0001');
Insert into BOARD_LIKE (BNO,ID) values (93,'A0001');
Insert into BOARD_LIKE (BNO,ID) values (94,'A0020');
Insert into BOARD_LIKE (BNO,ID) values (95,'A0020');
REM INSERTING into BOARD_MEMBER
SET DEFINE OFF;
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0001','123456','홍길동','foralis',7);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0002','123456','김영손','present',2);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0003','1234567','이한영','present',3);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0004','123456','지연수','rainsuit',1);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0005','123456','우주희','spacer',5);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0006','123456','김정인','property',6);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0007','123456','정성수','train',7);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0008','123456','박현서','parkday',6);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0009','123456','수현지','waater',5);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0010','123456','김연석','builder',4);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('B0001','123456','임여준','ready',3);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('B0010','asd123456@','테스터정','Jung',3);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0020','1234567','김정석','Order',2);
Insert into BOARD_MEMBER (ID,PASSWD,NAME,NICK,GRADE_NO) values ('A0030','123456','신이정','Two',4);
REM INSERTING into GRADE
SET DEFINE OFF;
Insert into GRADE (GRADE_NO,GRADE_NAME) values (1,'새싹회원');
Insert into GRADE (GRADE_NO,GRADE_NAME) values (2,'일반회원');
Insert into GRADE (GRADE_NO,GRADE_NAME) values (3,'성실회원');
Insert into GRADE (GRADE_NO,GRADE_NAME) values (4,'열심회원');
Insert into GRADE (GRADE_NO,GRADE_NAME) values (5,'우수회원');
Insert into GRADE (GRADE_NO,GRADE_NAME) values (6,'특별회원');
Insert into GRADE (GRADE_NO,GRADE_NAME) values (7,'운영자');
REM INSERTING into MAJOR_LIST
SET DEFINE OFF;
Insert into MAJOR_LIST (MNO,MNAME) values (6,'머신러닝');
Insert into MAJOR_LIST (MNO,MNAME) values (2,'경영');
Insert into MAJOR_LIST (MNO,MNAME) values (3,'컴퓨터공학');
Insert into MAJOR_LIST (MNO,MNAME) values (4,'관광');
Insert into MAJOR_LIST (MNO,MNAME) values (5,'게임');
Insert into MAJOR_LIST (MNO,MNAME) values (1,'소프트웨어 학과');
Insert into MAJOR_LIST (MNO,MNAME) values (7,'ai학과');
Insert into MAJOR_LIST (MNO,MNAME) values (8,'조리학과');
REM INSERTING into QNA
SET DEFINE OFF;
REM INSERTING into BOARD_COMMENT_VIEW
SET DEFINE OFF;
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (1,83,'asdf','A0002',to_date('22/07/22','RR/MM/DD'),1,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (2,83,'asdfqr','A0002',to_date('22/07/22','RR/MM/DD'),0,1);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (41,82,'asdfqwer','A0001',to_date('22/08/01','RR/MM/DD'),1,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (42,89,'asdfqwer','A0002',to_date('22/08/04','RR/MM/DD'),1,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (46,90,'댓글 작업 완료 하엿습니다.
엔터 키','A0001',to_date('22/08/06','RR/MM/DD'),0,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (47,90,'댓글 완료
<br>엔터키 조작여부 확인','A0001',to_date('22/08/06','RR/MM/DD'),0,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (48,89,'ㄴㅇㄻㄴㅇㄹ','A0004',to_date('22/08/06','RR/MM/DD'),0,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (49,89,'ㅁㄴㅇㄹ','A0004',to_date('22/08/06','RR/MM/DD'),0,1);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (50,88,'ㅁㄴㅇㄹ','A0004',to_date('22/08/06','RR/MM/DD'),0,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (51,89,'alo','A0001',to_date('22/08/06','RR/MM/DD'),0,0);
Insert into BOARD_COMMENT_VIEW (CNO,BNO,CONTENT,WRITER,CDATE,CLIKE,CHATE) values (52,94,'hello world','A0020',to_date('22/08/07','RR/MM/DD'),0,1);
REM INSERTING into BOARD_CONTENT_VIEW
SET DEFINE OFF;
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (95,'로그인 후 게시글 등록','A0020','Order',3,to_date('22/08/07','RR/MM/DD'),1,0,'<p>파일 업로드 테스트 입니다. 5개를 올려보겠습니다.</p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (94,'안녕하세요','A0030','Two',4,to_date('22/08/07','RR/MM/DD'),1,0,'<p>엔터키도 되는지 테스트</p><p>ckeditor입니다.</p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (93,'글작성','A0001','foralis',4,to_date('22/08/06','RR/MM/DD'),1,1,'<p>&nbsp;이미지 테스트</p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (92,'ㅁㄴㅇㅁㄴㅇㄹ','A0001','foralis',3,to_date('22/08/06','RR/MM/DD'),0,0,'<p>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㅇㄴㄹ</p><p>ㄴㅁㅇㄻㄴㅇㄻㄴㅇㄹ</p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (90,'asdfasdf','A0002','present',14,to_date('22/08/05','RR/MM/DD'),1,0,'<p>asdffasdf</p><p>asdfasdfqwerqwe</p><p>asdfasdfqwetqwe</p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (89,'asdfasdfqwer','A0002','present',12,to_date('22/08/04','RR/MM/DD'),0,0,'<p>asdfsd<img src="imageDown.do?fno=2"></p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (88,'asdfq','A0002','present',3,to_date('22/08/04','RR/MM/DD'),0,0,'<p>asdfqwerzxcv<img class="image_resized" style="width:77.51%;" src="imageDown.do?fno=1"></p>');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (87,'asdf','A0001','foralis',4,to_date('22/08/01','RR/MM/DD'),0,0,'asdfasfqwer');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (83,'각급 선거관리위원회는 선거인…','A0006','property',1587,to_date('22/06/30','RR/MM/DD'),2,1,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (82,'대법원은 법률에 저촉되지 아…','A0009','waater',463,to_date('22/06/29','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (81,'대한민국의 국민이 되는 요건…','A0008','parkday',1631,to_date('22/06/28','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (80,'대법원은 법률에 저촉되지 아…','A0007','train',516,to_date('22/06/27','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (79,'대한민국의 국민이 되는 요건…','A0010','builder',486,to_date('22/06/27','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (78,'헌법재판소에서 법률의 위헌결…','A0006','property',1671,to_date('22/06/25','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (77,'각급 선거관리위원회는 선거인…','A0008','parkday',884,to_date('22/06/24','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 
 게시글 수정하기 입니다. 내용은 간략하게 적겠습니다. 엔터도 포함하겠습니다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (76,'각급 선거관리위원회는 선거인…','A0008','parkday',1855,to_date('22/06/24','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (75,'법관은 탄핵 또는 금고 이상…','A0006','property',129,to_date('22/06/24','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (74,'위원은 정당에 가입하거나 정…','A0009','waater',100,to_date('22/06/23','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (73,'위원은 정당에 가입하거나 정…','A0001','foralis',1607,to_date('22/06/21','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (71,'헌법재판소에서 법률의 위헌결…','A0005','spacer',605,to_date('22/06/16','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (70,'대법원은 법률에 저촉되지 아…','A0005','spacer',537,to_date('22/06/15','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (69,'대법원은 법률에 저촉되지 아…','A0004','rainsuit',1766,to_date('22/06/14','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (68,'각급 선거관리위원회는 선거인…','A0008','parkday',1501,to_date('22/06/14','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (67,'헌법재판소에서 법률의 위헌결…','A0005','spacer',479,to_date('22/06/13','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (65,'국회의원과 정부는 법률안을 …','A0002','present',644,to_date('22/06/11','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (64,'국군은 국가의 안전보장과 국…','A0010','builder',1981,to_date('22/06/09','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (63,'헌법재판소에서 법률의 위헌결…','A0005','spacer',1539,to_date('22/06/09','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (62,'국군은 국가의 안전보장과 국…','A0005','spacer',348,to_date('22/06/09','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (61,'헌법재판소에서 법률의 위헌결…','A0005','spacer',1334,to_date('22/06/09','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (60,'국회의원과 정부는 법률안을 …','A0007','train',1323,to_date('22/06/04','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (59,'법관은 탄핵 또는 금고 이상…','A0005','spacer',489,to_date('22/06/03','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (58,'대통령은 제4항과 제5항의 …','A0001','foralis',1494,to_date('22/06/02','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (57,'대한민국의 국민이 되는 요건…','A0010','builder',1447,to_date('22/06/02','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (56,'국군은 국가의 안전보장과 국…','A0001','foralis',991,to_date('22/06/01','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (55,'국회의원과 정부는 법률안을 …','A0010','builder',719,to_date('22/05/30','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (54,'각급 선거관리위원회는 선거인…','A0003','present',1107,to_date('22/05/26','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (53,'국회의원과 정부는 법률안을 …','A0007','train',1729,to_date('22/05/25','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (52,'법관은 탄핵 또는 금고 이상…','A0010','builder',1193,to_date('22/05/25','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (51,'대한민국의 국민이 되는 요건…','A0008','parkday',161,to_date('22/05/21','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (50,'국군은 국가의 안전보장과 국…','A0003','present',1201,to_date('22/05/21','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (49,'법관은 탄핵 또는 금고 이상…','A0008','parkday',722,to_date('22/05/19','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (48,'국군은 국가의 안전보장과 국…','A0001','foralis',966,to_date('22/05/19','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (47,'대법원은 법률에 저촉되지 아…','A0006','property',357,to_date('22/05/18','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (46,'법관은 탄핵 또는 금고 이상…','A0004','rainsuit',1918,to_date('22/05/16','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (45,'국회의원과 정부는 법률안을 …','A0003','present',907,to_date('22/05/15','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (44,'국회의원과 정부는 법률안을 …','A0001','foralis',876,to_date('22/05/14','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (43,'위원은 정당에 가입하거나 정…','A0001','foralis',1589,to_date('22/05/13','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (42,'법관은 탄핵 또는 금고 이상…','A0006','property',1601,to_date('22/05/10','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (41,'대통령은 제4항과 제5항의 …','A0010','builder',1759,to_date('22/05/09','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (39,'각급 선거관리위원회는 선거인…','A0005','spacer',1574,to_date('22/05/03','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (38,'국군은 국가의 안전보장과 국…','A0007','train',559,to_date('22/05/03','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (37,'위원은 정당에 가입하거나 정…','A0007','train',1793,to_date('22/05/03','RR/MM/DD'),1,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (36,'국회의원과 정부는 법률안을 …','A0009','waater',354,to_date('22/05/03','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (35,'대한민국의 국민이 되는 요건…','A0004','rainsuit',1716,to_date('22/05/02','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (34,'위원은 정당에 가입하거나 정…','A0002','present',405,to_date('22/05/01','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (33,'위원은 정당에 가입하거나 정…','A0010','builder',265,to_date('22/04/30','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (32,'대법원은 법률에 저촉되지 아…','A0003','present',718,to_date('22/04/29','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (31,'법관은 탄핵 또는 금고 이상…','A0002','present',1852,to_date('22/04/29','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (30,'국회의원과 정부는 법률안을 …','A0001','foralis',803,to_date('22/04/27','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (29,'위원은 정당에 가입하거나 정…','A0010','builder',493,to_date('22/04/27','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (28,'국군은 국가의 안전보장과 국…','A0009','waater',982,to_date('22/04/27','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (27,'법관은 탄핵 또는 금고 이상…','A0001','foralis',1937,to_date('22/04/26','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (26,'국군은 국가의 안전보장과 국…','A0003','present',757,to_date('22/04/25','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (25,'대한민국의 국민이 되는 요건…','A0002','present',1092,to_date('22/04/21','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (24,'법관은 탄핵 또는 금고 이상…','A0010','builder',1931,to_date('22/04/21','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (23,'각급 선거관리위원회는 선거인…','A0001','foralis',1010,to_date('22/04/20','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (22,'대법원은 법률에 저촉되지 아…','A0005','spacer',636,to_date('22/04/19','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (21,'헌법재판소에서 법률의 위헌결…','A0010','builder',774,to_date('22/04/19','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (20,'헌법재판소에서 법률의 위헌결…','A0003','present',1219,to_date('22/04/19','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (19,'위원은 정당에 가입하거나 정…','A0007','train',1562,to_date('22/04/18','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (18,'대통령은 제4항과 제5항의 …','A0009','waater',712,to_date('22/04/16','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (17,'대통령은 제4항과 제5항의 …','A0003','present',1778,to_date('22/04/16','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (16,'각급 선거관리위원회는 선거인…','A0008','parkday',1806,to_date('22/04/12','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (15,'국회의원과 정부는 법률안을 …','A0005','spacer',1226,to_date('22/04/12','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (14,'각급 선거관리위원회는 선거인…','A0006','property',159,to_date('22/04/11','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (13,'대법원은 법률에 저촉되지 아…','A0007','train',1372,to_date('22/04/10','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (12,'대통령은 제4항과 제5항의 …','A0008','parkday',68,to_date('22/04/10','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (11,'위원은 정당에 가입하거나 정…','A0005','spacer',781,to_date('22/04/08','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (10,'법관은 탄핵 또는 금고 이상…','A0004','rainsuit',1877,to_date('22/04/05','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (9,'헌법재판소에서 법률의 위헌결…','A0002','present',1982,to_date('22/04/05','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (8,'대통령은 제4항과 제5항의 …','A0007','train',884,to_date('22/04/05','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (7,'대한민국의 국민이 되는 요건…','A0009','waater',924,to_date('22/04/04','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (6,'국회의원과 정부는 법률안을 …','A0010','builder',1661,to_date('22/04/04','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (5,'대통령은 제4항과 제5항의 …','A0010','builder',1433,to_date('22/04/03','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (4,'대통령은 제4항과 제5항의 …','A0007','train',1026,to_date('22/04/03','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (3,'대법원은 법률에 저촉되지 아…','A0006','property',324,to_date('22/04/02','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (2,'국군은 국가의 안전보장과 국…','A0009','waater',847,to_date('22/04/02','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_CONTENT_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (1,'헌법재판소에서 법률의 위헌결…','A0001','foralis',1714,to_date('22/04/01','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
REM INSERTING into BOARD_VIEW
SET DEFINE OFF;
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (95,'로그인 후 게시글 등록','A0020','Order',3,to_date('22/08/07','RR/MM/DD'),1,0,'<p>파일 업로드 테스트 입니다. 5개를 올려보겠습니다.</p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (94,'안녕하세요[1]','A0030','Two',4,to_date('22/08/07','RR/MM/DD'),1,0,'<p>엔터키도 되는지 테스트</p><p>ckeditor입니다.</p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (93,'글작성','A0001','foralis',4,to_date('22/08/06','RR/MM/DD'),1,1,'<p>&nbsp;이미지 테스트</p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (92,'ㅁㄴㅇㅁㄴㅇㄹ','A0001','foralis',3,to_date('22/08/06','RR/MM/DD'),0,0,'<p>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㅇㄴㄹ</p><p>ㄴㅁㅇㄻㄴㅇㄻㄴㅇㄹ</p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (90,'asdfasdf[2]','A0002','present',14,to_date('22/08/05','RR/MM/DD'),1,0,'<p>asdffasdf</p><p>asdfasdfqwerqwe</p><p>asdfasdfqwetqwe</p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (89,'asdfasdfqwer[4]','A0002','present',12,to_date('22/08/04','RR/MM/DD'),0,0,'<p>asdfsd<img src="imageDown.do?fno=2"></p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (88,'asdfq[1]','A0002','present',3,to_date('22/08/04','RR/MM/DD'),0,0,'<p>asdfqwerzxcv<img class="image_resized" style="width:77.51%;" src="imageDown.do?fno=1"></p>');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (87,'asdf','A0001','foralis',4,to_date('22/08/01','RR/MM/DD'),0,0,'asdfasfqwer');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (83,'각급 선거관리위원회는 선거인…[2]','A0006','property',1587,to_date('22/06/30','RR/MM/DD'),2,1,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (82,'대법원은 법률에 저촉되지 아…[1]','A0009','waater',463,to_date('22/06/29','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (81,'대한민국의 국민이 되는 요건…','A0008','parkday',1631,to_date('22/06/28','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (80,'대법원은 법률에 저촉되지 아…','A0007','train',516,to_date('22/06/27','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (79,'대한민국의 국민이 되는 요건…','A0010','builder',486,to_date('22/06/27','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (78,'헌법재판소에서 법률의 위헌결…','A0006','property',1671,to_date('22/06/25','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (77,'각급 선거관리위원회는 선거인…','A0008','parkday',884,to_date('22/06/24','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 
 게시글 수정하기 입니다. 내용은 간략하게 적겠습니다. 엔터도 포함하겠습니다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (76,'각급 선거관리위원회는 선거인…','A0008','parkday',1855,to_date('22/06/24','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (75,'법관은 탄핵 또는 금고 이상…','A0006','property',129,to_date('22/06/24','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (74,'위원은 정당에 가입하거나 정…','A0009','waater',100,to_date('22/06/23','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (73,'위원은 정당에 가입하거나 정…','A0001','foralis',1607,to_date('22/06/21','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (71,'헌법재판소에서 법률의 위헌결…','A0005','spacer',605,to_date('22/06/16','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (70,'대법원은 법률에 저촉되지 아…','A0005','spacer',537,to_date('22/06/15','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (69,'대법원은 법률에 저촉되지 아…','A0004','rainsuit',1766,to_date('22/06/14','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (68,'각급 선거관리위원회는 선거인…','A0008','parkday',1501,to_date('22/06/14','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (67,'헌법재판소에서 법률의 위헌결…','A0005','spacer',479,to_date('22/06/13','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (65,'국회의원과 정부는 법률안을 …','A0002','present',644,to_date('22/06/11','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (64,'국군은 국가의 안전보장과 국…','A0010','builder',1981,to_date('22/06/09','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (63,'헌법재판소에서 법률의 위헌결…','A0005','spacer',1539,to_date('22/06/09','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (62,'국군은 국가의 안전보장과 국…','A0005','spacer',348,to_date('22/06/09','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (61,'헌법재판소에서 법률의 위헌결…','A0005','spacer',1334,to_date('22/06/09','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (60,'국회의원과 정부는 법률안을 …','A0007','train',1323,to_date('22/06/04','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (59,'법관은 탄핵 또는 금고 이상…','A0005','spacer',489,to_date('22/06/03','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (58,'대통령은 제4항과 제5항의 …','A0001','foralis',1494,to_date('22/06/02','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (57,'대한민국의 국민이 되는 요건…','A0010','builder',1447,to_date('22/06/02','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (56,'국군은 국가의 안전보장과 국…','A0001','foralis',991,to_date('22/06/01','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (55,'국회의원과 정부는 법률안을 …','A0010','builder',719,to_date('22/05/30','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (54,'각급 선거관리위원회는 선거인…','A0003','present',1107,to_date('22/05/26','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (53,'국회의원과 정부는 법률안을 …','A0007','train',1729,to_date('22/05/25','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (52,'법관은 탄핵 또는 금고 이상…','A0010','builder',1193,to_date('22/05/25','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (51,'대한민국의 국민이 되는 요건…','A0008','parkday',161,to_date('22/05/21','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (50,'국군은 국가의 안전보장과 국…','A0003','present',1201,to_date('22/05/21','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (49,'법관은 탄핵 또는 금고 이상…','A0008','parkday',722,to_date('22/05/19','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (48,'국군은 국가의 안전보장과 국…','A0001','foralis',966,to_date('22/05/19','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (47,'대법원은 법률에 저촉되지 아…','A0006','property',357,to_date('22/05/18','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (46,'법관은 탄핵 또는 금고 이상…','A0004','rainsuit',1918,to_date('22/05/16','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (45,'국회의원과 정부는 법률안을 …','A0003','present',907,to_date('22/05/15','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (44,'국회의원과 정부는 법률안을 …','A0001','foralis',876,to_date('22/05/14','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (43,'위원은 정당에 가입하거나 정…','A0001','foralis',1589,to_date('22/05/13','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (42,'법관은 탄핵 또는 금고 이상…','A0006','property',1601,to_date('22/05/10','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (41,'대통령은 제4항과 제5항의 …','A0010','builder',1759,to_date('22/05/09','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (39,'각급 선거관리위원회는 선거인…','A0005','spacer',1574,to_date('22/05/03','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (38,'국군은 국가의 안전보장과 국…','A0007','train',559,to_date('22/05/03','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (37,'위원은 정당에 가입하거나 정…','A0007','train',1793,to_date('22/05/03','RR/MM/DD'),1,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (36,'국회의원과 정부는 법률안을 …','A0009','waater',354,to_date('22/05/03','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (35,'대한민국의 국민이 되는 요건…','A0004','rainsuit',1716,to_date('22/05/02','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (34,'위원은 정당에 가입하거나 정…','A0002','present',405,to_date('22/05/01','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (33,'위원은 정당에 가입하거나 정…','A0010','builder',265,to_date('22/04/30','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (32,'대법원은 법률에 저촉되지 아…','A0003','present',718,to_date('22/04/29','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (31,'법관은 탄핵 또는 금고 이상…','A0002','present',1852,to_date('22/04/29','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (30,'국회의원과 정부는 법률안을 …','A0001','foralis',803,to_date('22/04/27','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (29,'위원은 정당에 가입하거나 정…','A0010','builder',493,to_date('22/04/27','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (28,'국군은 국가의 안전보장과 국…','A0009','waater',982,to_date('22/04/27','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (27,'법관은 탄핵 또는 금고 이상…','A0001','foralis',1937,to_date('22/04/26','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (26,'국군은 국가의 안전보장과 국…','A0003','present',757,to_date('22/04/25','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (25,'대한민국의 국민이 되는 요건…','A0002','present',1092,to_date('22/04/21','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (24,'법관은 탄핵 또는 금고 이상…','A0010','builder',1931,to_date('22/04/21','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (23,'각급 선거관리위원회는 선거인…','A0001','foralis',1010,to_date('22/04/20','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (22,'대법원은 법률에 저촉되지 아…','A0005','spacer',636,to_date('22/04/19','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (21,'헌법재판소에서 법률의 위헌결…','A0010','builder',774,to_date('22/04/19','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (20,'헌법재판소에서 법률의 위헌결…','A0003','present',1219,to_date('22/04/19','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (19,'위원은 정당에 가입하거나 정…','A0007','train',1562,to_date('22/04/18','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (18,'대통령은 제4항과 제5항의 …','A0009','waater',712,to_date('22/04/16','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (17,'대통령은 제4항과 제5항의 …','A0003','present',1778,to_date('22/04/16','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (16,'각급 선거관리위원회는 선거인…','A0008','parkday',1806,to_date('22/04/12','RR/MM/DD'),0,0,'재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (15,'국회의원과 정부는 법률안을 …','A0005','spacer',1226,to_date('22/04/12','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (14,'각급 선거관리위원회는 선거인…','A0006','property',159,to_date('22/04/11','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (13,'대법원은 법률에 저촉되지 아…','A0007','train',1372,to_date('22/04/10','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (12,'대통령은 제4항과 제5항의 …','A0008','parkday',68,to_date('22/04/10','RR/MM/DD'),0,0,'농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (11,'위원은 정당에 가입하거나 정…','A0005','spacer',781,to_date('22/04/08','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (10,'법관은 탄핵 또는 금고 이상…','A0004','rainsuit',1877,to_date('22/04/05','RR/MM/DD'),0,0,'대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. 국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (9,'헌법재판소에서 법률의 위헌결…','A0002','present',1982,to_date('22/04/05','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (8,'대통령은 제4항과 제5항의 …','A0007','train',884,to_date('22/04/05','RR/MM/DD'),0,0,'형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 연소자의 근로는 특별한 보호를 받는다. 대통령의 선거에 관한 사항은 법률로 정한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (7,'대한민국의 국민이 되는 요건…','A0009','waater',924,to_date('22/04/04','RR/MM/DD'),0,0,'행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (6,'국회의원과 정부는 법률안을 …','A0010','builder',1661,to_date('22/04/04','RR/MM/DD'),0,0,'정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (5,'대통령은 제4항과 제5항의 …','A0010','builder',1433,to_date('22/04/03','RR/MM/DD'),0,0,'대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (4,'대통령은 제4항과 제5항의 …','A0007','train',1026,to_date('22/04/03','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (3,'대법원은 법률에 저촉되지 아…','A0006','property',324,to_date('22/04/02','RR/MM/DD'),0,0,'국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 종교의 자유를 가진다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (2,'국군은 국가의 안전보장과 국…','A0009','waater',847,to_date('22/04/02','RR/MM/DD'),0,0,'국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.');
Insert into BOARD_VIEW (BNO,TITLE,WRITER,NICK,BCOUNT,BDATE,BLIKE,BHATE,CONTENT) values (1,'헌법재판소에서 법률의 위헌결…','A0001','foralis',1714,to_date('22/04/01','RR/MM/DD'),0,0,'군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 국군의 조직과 편성은 법률로 정한다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다.');
--------------------------------------------------------
--  DDL for Index BOARD_COMMENT_HATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_COMMENT_HATE_PK" ON "BOARD_COMMENT_HATE" ("CNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_COMMENT_PK" ON "BOARD_COMMENT_LIKE" ("CNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_HATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_HATE_PK" ON "BOARD_HATE" ("BNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_IMAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_IMAGE_PK" ON "BOARD_IMAGE" ("BI_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_LIKE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_LIKE_PK" ON "BOARD_LIKE" ("BNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007032
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007032" ON "EMPLOYEE" ("ENO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007455
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007455" ON "STUDENT" ("SNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007457
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007457" ON "EDU_PERSON" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007460" ON "MAJOR_LIST" ("MNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007557
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007557" ON "GRADE" ("GRADE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007558
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007558" ON "BOARD_MEMBER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007560
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007560" ON "BOARD" ("BNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007568
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007568" ON "BOARD_COMMENT" ("CNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007655
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007655" ON "PRODUCT" ("PRODUCT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007769
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007769" ON "QNA" ("QNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007560
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007560" ON "BOARD" ("BNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007568
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007568" ON "BOARD_COMMENT" ("CNO") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_COMMENT_HATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_COMMENT_HATE_PK" ON "BOARD_COMMENT_HATE" ("CNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_COMMENT_PK" ON "BOARD_COMMENT_LIKE" ("CNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_HATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_HATE_PK" ON "BOARD_HATE" ("BNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_IMAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_IMAGE_PK" ON "BOARD_IMAGE" ("BI_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_LIKE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_LIKE_PK" ON "BOARD_LIKE" ("BNO", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007558
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007558" ON "BOARD_MEMBER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007557
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007557" ON "GRADE" ("GRADE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007460" ON "MAJOR_LIST" ("MNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007769
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007769" ON "QNA" ("QNO") 
  ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD PRIMARY KEY ("BNO") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "BOARD_COMMENT" ADD PRIMARY KEY ("CNO") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT_HATE
--------------------------------------------------------

  ALTER TABLE "BOARD_COMMENT_HATE" ADD CONSTRAINT "BOARD_COMMENT_HATE_PK" PRIMARY KEY ("CNO", "ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT_LIKE
--------------------------------------------------------

  ALTER TABLE "BOARD_COMMENT_LIKE" ADD CONSTRAINT "BOARD_COMMENT_PK" PRIMARY KEY ("CNO", "ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_FILE
--------------------------------------------------------

  ALTER TABLE "BOARD_FILE" MODIFY ("PATH" NOT NULL ENABLE);
  ALTER TABLE "BOARD_FILE" MODIFY ("FNO" NOT NULL ENABLE);
  ALTER TABLE "BOARD_FILE" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_HATE
--------------------------------------------------------

  ALTER TABLE "BOARD_HATE" ADD CONSTRAINT "BOARD_HATE_PK" PRIMARY KEY ("BNO", "ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_IMAGE
--------------------------------------------------------

  ALTER TABLE "BOARD_IMAGE" ADD CONSTRAINT "BOARD_IMAGE_PK" PRIMARY KEY ("BI_NO") ENABLE;
  ALTER TABLE "BOARD_IMAGE" MODIFY ("BI_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_LIKE
--------------------------------------------------------

  ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "BOARD_LIKE_PK" PRIMARY KEY ("BNO", "ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_MEMBER
--------------------------------------------------------

  ALTER TABLE "BOARD_MEMBER" ADD PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table GRADE
--------------------------------------------------------

  ALTER TABLE "GRADE" ADD PRIMARY KEY ("GRADE_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table MAJOR_LIST
--------------------------------------------------------

  ALTER TABLE "MAJOR_LIST" ADD PRIMARY KEY ("MNO") ENABLE;
--------------------------------------------------------
--  Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD PRIMARY KEY ("QNO") ENABLE;
  ALTER TABLE "QNA" ADD CONSTRAINT "QNA_STATUS_CHECK" CHECK (status in(0,1,2)) ENABLE;
