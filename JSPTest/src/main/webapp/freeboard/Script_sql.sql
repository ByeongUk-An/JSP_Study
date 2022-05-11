Create Table freeboard (
    id number constraint PK_freeboard_id Primary Key,  -- 자동증가 컬럼
    name varchar2(10) not null,
    password varchar2(100) null,
    email varchar2(100) null,
    subject varchar2(100) not null,  -- 글제목
    content varchar2(100) not null,  -- 글내용
    inputdate varchar2(100) not null,  --글쓴날짜
    masterid number default 0,  -- 질문 답변형 게시판에서 답변의 글을 그룹핑 할때 사용 
    readcount number default 0, -- 글 조회수
    replaynum number default 0, -- 
    step number default 0
);

select * from freeboard;