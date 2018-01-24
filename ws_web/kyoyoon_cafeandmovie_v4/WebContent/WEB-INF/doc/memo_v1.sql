1) cafeandmovie 테이블의 생성 
   - 기존의 테이블 삭제
     DROP TABLE cafeandmovie;
   
   CREATE TABLE cafeandmovie( 
     messageno  INT     NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 메모 번호 
     title     VARCHAR(40)    NOT NULL, -- 제목   
     content   VARCHAR(1000)  NOT NULL, -- 내용, 1000 자
     writer     VARCHAR(20)    NOT NULL, -- 등록자
     passwd   VARCHAR(15)    NOT NULL, -- 패스워드
     tag_name     VARCHAR(200)          NULL, -- 관련 태그 
     favorites_url     VARCHAR(500)          NULL, -- 즐겨찾기 url
     email     VARCHAR(100)           NULL, -- Email
     rdate     DATETIME         NOT NULL  -- 등록일
   );  
 
    
2) 테이블 삭제
   DROP TABLE cafeandmovie;
 
 
3) 등록
   INSERT INTO cafeandmovie(title, content, writer, passwd, tag_name, favorites_url, email, rdate)
   VALUES('평창동 카페 모뜨', '평창동 카페 모뜨', '왕눈이', '123', '모뜨', 'https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565', 'mail1@aaa.kr', now());
 
   INSERT INTO cafeandmovie(title, content, writer, passwd, tag_name, favorites_url, email, rdate)
   VALUES('영화 원더휠', '영화 원더휠', '왕눈이2', '123', '원더휠', 'www.cine21.com/movie/info/?movie_id=51935', 'mail2@bbb.kr', now());
 
   INSERT INTO cafeandmovie(title, content, writer, passwd, tag_name, favorites_url, email, rdate)
   VALUES('영화 매트릭스', '영화 매트릭스', '왕눈이3', '123', '매트릭스', 'https://www.netflix.com/kr/title/20557937', 'mail3@ccc.kr', now());
 
    
4) 목록
   SELECT messageno, title, content, writer, passwd, tag_name, favorites_url, email, rdate
   FROM cafeandmovie 
   ORDER BY messageno ASC;
   
messageno title     content   writer passwd tag_name favorites_url                                                         email        rdate
 --------- --------- --------- ------ ------ -------- --------------------------------------------------------------------- ------------ ---------------------
         1 평창동 카페 모뜨 평창동 카페 모뜨 왕눈이    123    모뜨       https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565 mail1@aaa.kr 2018-01-24 17:51:17.0
         2 영화 원더휠    영화 원더휠    왕눈이2   123    원더휠      www.cine21.com/movie/info/?movie_id=51935                             mail2@bbb.kr 2018-01-24 17:51:18.0
         3 영화 매트릭스   영화 매트릭스   왕눈이3   123    매트릭스     https://www.netflix.com/kr/title/20557937                             mail3@ccc.kr 2018-01-24 17:51:19.0
 
   SELECT messageno, title, content, writer, passwd, tag_name, favorites_url, email, rdate
   FROM cafeandmovie 
   ORDER BY messageno DESC;
 
 messageno title     content   writer passwd tag_name favorites_url                                                         email        rdate
 --------- --------- --------- ------ ------ -------- --------------------------------------------------------------------- ------------ ---------------------
         3 영화 매트릭스   영화 매트릭스   왕눈이3   123    매트릭스     https://www.netflix.com/kr/title/20557937                             mail3@ccc.kr 2018-01-24 17:51:19.0
         2 영화 원더휠    영화 원더휠    왕눈이2   123    원더휠      www.cine21.com/movie/info/?movie_id=51935                             mail2@bbb.kr 2018-01-24 17:51:18.0
         1 평창동 카페 모뜨 평창동 카페 모뜨 왕눈이    123    모뜨       https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565 mail1@aaa.kr 2018-01-24 17:51:17.0
  
5) 조회
   SELECT messageno, title, content, writer, passwd, tag_name, favorites_url, email, rdate
   FROM cafeandmovie 
   WHERE messageno = 1;
   
 messageno title     content   writer passwd tag_name favorites_url                                                         email        rdate
 --------- --------- --------- ------ ------ -------- --------------------------------------------------------------------- ------------ ---------------------
         1 평창동 카페 모뜨 평창동 카페 모뜨 왕눈이    123    모뜨       https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565 mail1@aaa.kr 2018-01-24 17:51:17.0
 
6) 패스워드 검사
   SELECT COUNT(*)
   FROM cafeandmovie
   WHERE messageno=1 AND passwd='123';
   
   COUNT(*) ← 컬럼명
   -------------------
            1
   
   SELECT COUNT(*) as cnt
   FROM cafeandmovie
   WHERE messageno=1 AND passwd='123';
   
   cnt
   ----
     1    ← 레코드가 없거나 일치하지않으면 0
         
7) 수정
   UPDATE cafeandmovie
   SET title = '매트릭스2', content = '매트릭스2', rname = '아로미', tag_name='매트릭스2' favorites_url='http://~', email='maeil1' 
   WHERE messageno = 3;
 
8) 삭제
① 하나의 레코드 삭제
    DELETE FROM cafeandmovie
    WHERE visitorno = 3;
 
② 모든 레코드 삭제(주의)
    DELETE FROM cafeandmovie;