-- 멤버 테이블 생성
drop table member cascade;
create table member(
member_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z][a-z0-9]{7,19}$')),
member_pw varchar2(16) not null 
check(regexp_like(member_pw, '[a-z]+') and regexp_like(member_pw, '[A-Z]+')
			and regexp_like(member_pw, '[0-9]+') and regexp_like(member_pw, '[!@#$]+')),
member_birth char(10) not null,
member_name varchar2(10) not null check(regexp_like(member_name, '^[가-힣0-9]{2,10}$')),
member_phone char(11) not null check(regexp_like(member_phone, '^010[1-9][0-9]{7}$')),
member_email varchar2(100),
member_post char(6),
member_basic_address varchar2(300),
member_detail_address varchar2(300),
member_joindate date default sysdate not null,
member_logindate date
);

-- 멤버 테이블 조회 
select * from member;

-- 멤버 테이블 test_user(1-6) 추가 
insert into member values('testuser1','Testuser1!','YYYY-MM-DD','테스트','01041923035','testuser1@test.co.kr', '000000','서울시 당산동 이레빌딩', '19층 C강의실', sysdate,sysdate);
insert into member values('testuser2','Testuser2!','YYYY-MM-DD','테스트','01041923035','testuser1@test.co.kr', '000000','서울시 당산동 이레빌딩', '19층 C강의실', sysdate,sysdate);
insert into member values('testuser3','Testuser3!','YYYY-MM-DD','테스트','01041923035','testuser1@test.co.kr', '000000','서울시 당산동 이레빌딩', '19층 C강의실', sysdate,sysdate);
insert into member values('testuser4','Testuser4!','YYYY-MM-DD','테스트','01041923035','testuser1@test.co.kr', '000000','서울시 당산동 이레빌딩', '19층 C강의실', sysdate,sysdate);
insert into member values('testuser5','Testuser5!','YYYY-MM-DD','테스트','01041923035','testuser1@test.co.kr', '000000','서울시 당산동 이레빌딩', '19층 C강의실', sysdate,sysdate);
insert into member values('testuser6','Testuser6!','YYYY-MM-DD','테스트','01041923035','testuser1@test.co.kr', '000000','서울시 당산동 이레빌딩', '19층 C강의실', sysdate,sysdate);
