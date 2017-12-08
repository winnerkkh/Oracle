--- synonym 동의어
-- 테이블의 별칭을 만들어 사용하는 경우
-- CREATE [PUBLIC] SYNONYM 시노님명 FOR 객체
create table sampletbl(
memo varchar2(50)
);
insert into sampletbl values('오월은 푸르구나');
insert into sampletbl values('최선을 다 합시다');
select * from sampletbl;

grant select on sampletbl to hr;
--
grant select on sampletbl to usertest02;
grant select on sampletbl to usertest04;
-- public 시노님을 만들때 유저가 select권한이 없으면 조회가 안됨.
create public synonym pub_sam for sys.sampletbl;
-- synonym삭제
-- drop synonym 시노님명;
 drop synonym samtbl;
 select * from pub_sam;
 
 
 
 
 









