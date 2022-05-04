drop table review_reply;
create table review_reply(
reply_no number primary key,
reply_who references member(member_id) on delete set null,
target_review_no references review(review_no) on delete cascade,
target_member_id references review(reivew_member_id) on delete set null,
reply_content varchar(1800) not null,
reply_time date default sysdate
);


--아직 테이블 등록 하지 않은 상태입니다