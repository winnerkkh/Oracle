-- synonym 동의어
-- 테이블의 별칭을 만들어 사용하는 경우ㅇ
-- create [PUBLIC] synonym 시너님명 FOR 객체

create table sampletbl(
   memo varchar2(50)
);

insert into sampletbl values('오월은 푸르구나');
insert into sampletbl values('최선을 다 합시다');

select * from sampletbl;

grant select on sampletbl to hr;
create public synonym pub_sam for sys.sampletbl;

-- synonym 삭제
-- drop synonym 시너님명;

drop synonym samtbl;