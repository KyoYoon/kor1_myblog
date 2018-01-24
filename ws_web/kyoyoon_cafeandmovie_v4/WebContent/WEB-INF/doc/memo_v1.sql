1) cafeandmovie ���̺��� ���� 
   - ������ ���̺� ����
     DROP TABLE cafeandmovie;
   
   CREATE TABLE cafeandmovie( 
     messageno  INT     NOT NULL AUTO_INCREMENT PRIMARY KEY, -- �޸� ��ȣ 
     title     VARCHAR(40)    NOT NULL, -- ����   
     content   VARCHAR(1000)  NOT NULL, -- ����, 1000 ��
     writer     VARCHAR(20)    NOT NULL, -- �����
     passwd   VARCHAR(15)    NOT NULL, -- �н�����
     tag_name     VARCHAR(200)          NULL, -- ���� �±� 
     favorites_url     VARCHAR(500)          NULL, -- ���ã�� url
     email     VARCHAR(100)           NULL, -- Email
     rdate     DATETIME         NOT NULL  -- �����
   );  
 
    
2) ���̺� ����
   DROP TABLE cafeandmovie;
 
 
3) ���
   INSERT INTO cafeandmovie(title, content, writer, passwd, tag_name, favorites_url, email, rdate)
   VALUES('��â�� ī�� ���', '��â�� ī�� ���', '�մ���', '123', '���', 'https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565', 'mail1@aaa.kr', now());
 
   INSERT INTO cafeandmovie(title, content, writer, passwd, tag_name, favorites_url, email, rdate)
   VALUES('��ȭ ������', '��ȭ ������', '�մ���2', '123', '������', 'www.cine21.com/movie/info/?movie_id=51935', 'mail2@bbb.kr', now());
 
   INSERT INTO cafeandmovie(title, content, writer, passwd, tag_name, favorites_url, email, rdate)
   VALUES('��ȭ ��Ʈ����', '��ȭ ��Ʈ����', '�մ���3', '123', '��Ʈ����', 'https://www.netflix.com/kr/title/20557937', 'mail3@ccc.kr', now());
 
    
4) ���
   SELECT messageno, title, content, writer, passwd, tag_name, favorites_url, email, rdate
   FROM cafeandmovie 
   ORDER BY messageno ASC;
   
messageno title     content   writer passwd tag_name favorites_url                                                         email        rdate
 --------- --------- --------- ------ ------ -------- --------------------------------------------------------------------- ------------ ---------------------
         1 ��â�� ī�� ��� ��â�� ī�� ��� �մ���    123    ���       https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565 mail1@aaa.kr 2018-01-24 17:51:17.0
         2 ��ȭ ������    ��ȭ ������    �մ���2   123    ������      www.cine21.com/movie/info/?movie_id=51935                             mail2@bbb.kr 2018-01-24 17:51:18.0
         3 ��ȭ ��Ʈ����   ��ȭ ��Ʈ����   �մ���3   123    ��Ʈ����     https://www.netflix.com/kr/title/20557937                             mail3@ccc.kr 2018-01-24 17:51:19.0
 
   SELECT messageno, title, content, writer, passwd, tag_name, favorites_url, email, rdate
   FROM cafeandmovie 
   ORDER BY messageno DESC;
 
 messageno title     content   writer passwd tag_name favorites_url                                                         email        rdate
 --------- --------- --------- ------ ------ -------- --------------------------------------------------------------------- ------------ ---------------------
         3 ��ȭ ��Ʈ����   ��ȭ ��Ʈ����   �մ���3   123    ��Ʈ����     https://www.netflix.com/kr/title/20557937                             mail3@ccc.kr 2018-01-24 17:51:19.0
         2 ��ȭ ������    ��ȭ ������    �մ���2   123    ������      www.cine21.com/movie/info/?movie_id=51935                             mail2@bbb.kr 2018-01-24 17:51:18.0
         1 ��â�� ī�� ��� ��â�� ī�� ��� �մ���    123    ���       https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565 mail1@aaa.kr 2018-01-24 17:51:17.0
  
5) ��ȸ
   SELECT messageno, title, content, writer, passwd, tag_name, favorites_url, email, rdate
   FROM cafeandmovie 
   WHERE messageno = 1;
   
 messageno title     content   writer passwd tag_name favorites_url                                                         email        rdate
 --------- --------- --------- ------ ------ -------- --------------------------------------------------------------------- ------------ ---------------------
         1 ��â�� ī�� ��� ��â�� ī�� ��� �մ���    123    ���       https://m.blog.naver.com/PostView.nhn?blogId=joann0&logNo=30141853565 mail1@aaa.kr 2018-01-24 17:51:17.0
 
6) �н����� �˻�
   SELECT COUNT(*)
   FROM cafeandmovie
   WHERE messageno=1 AND passwd='123';
   
   COUNT(*) �� �÷���
   -------------------
            1
   
   SELECT COUNT(*) as cnt
   FROM cafeandmovie
   WHERE messageno=1 AND passwd='123';
   
   cnt
   ----
     1    �� ���ڵ尡 ���ų� ��ġ���������� 0
         
7) ����
   UPDATE cafeandmovie
   SET title = '��Ʈ����2', content = '��Ʈ����2', rname = '�Ʒι�', tag_name='��Ʈ����2' favorites_url='http://~', email='maeil1' 
   WHERE messageno = 3;
 
8) ����
�� �ϳ��� ���ڵ� ����
    DELETE FROM cafeandmovie
    WHERE visitorno = 3;
 
�� ��� ���ڵ� ����(����)
    DELETE FROM cafeandmovie;