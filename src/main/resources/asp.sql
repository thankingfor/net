drop database if exists asp;

create database asp default character set utf8;

use asp;

create table students
(
   /*学号*/
   stu_id         varchar(36) not null,
   /*密码*/
   stu_pass		  varchar(36),
   /*名字*/
   stu_name       varchar(10),
   /*性别*/
   stu_sex        varchar(30),
   /*手机号*/
   stu_phone      varchar(30),
   /*入学时间*/
   stu_comedata   varchar(30),
   /*所在班级*/
   class_id       varchar(36),
   /*喜好*/
   stu_favorable  varchar(100),
   /*名言*/
   stu_words      varchar(100),
   /*备注*/
   stu_remark     varchar(100),
   primary key (stu_id)
);

create table teacher
(
   /*教工号*/
   tea_id         varchar(36) not null,
   /*密码*/
   tea_pass		  varchar(36),
   /*名字*/
   tea_name       varchar(10),
   /*性别*/
   tea_sex        varchar(30),
   /*手机号*/
   tea_phone      varchar(30),
   /*入教时间*/
   tea_comedata   varchar(30),
   /*喜好*/
   tea_favorable  varchar(100),
   /*名言*/
   tea_words      varchar(100),
   /*备注*/
   tea_remark     varchar(100),
   primary key (tea_id)
);

create table admin
(
   /*教工号*/
   admin_id         varchar(36) not null,
   /*密码*/
   admin_pass		varchar(36),
   /*名字*/
   admin_name       varchar(10),
   /*手机号*/
   admin_phone      varchar(30),
   primary key (admin_id)
);

create table classes
(
   /*班级号*/
   class_id         varchar(36) not null,
   /*班级名称*/
   class_name       varchar(10),
   /*所属院系*/
   class_yuanxi     varchar(30),
   primary key (class_id)
);

create table tab
(
   /*任课id*/
   tab_id         varchar(36) not null,
   /*老师编号*/
   tea_id         varchar(36),
   /*班级编号*/
   class_id       varchar(36),
   primary key (tab_id)
);

/*试卷分配给班级得记录表*/
create table class_test
(
   /*任课id*/
   class_test_id         varchar(36) not null,
   /*班级编号*/
   class_id         varchar(36),
   /*班级编号*/
   test_id          varchar(36),
   /*状态,考虑到以后可能会实现,所有学生作完后,提示本次考试完成*/
   class_test_state varchar(36),
   primary key (class_test_id)
);

/*成绩表*/
create table grade
(
   /*成绩单id*/
   grade_id         varchar(36) not null,
   /*学生编号*/
   stu_id           varchar(36),
   /*学生分数*/
   stu_score        int,
   /*所属试卷*/
   test_id          varchar(36),
   /*考试状态/未完成or完成*/
   test_state          varchar(36),
   primary key (grade_id)
);

/*成绩单明细*/
create table grade_detail
(
   /*成绩单明细id*/
   grade_detail_id   varchar(36) not null,
   /*成绩单编号*/
   grade_id          varchar(36),
   /*题目编号*/
   top_id            varchar(36),
   /*学生单题所得分数*/
   stu_score         int,
   /*试题答案/单选/填空的*/
   top_daan         varchar(50),
   /*多选的答案a*/
   top_daan_a       varchar(50),
   /*多选的答案b*/
   top_daan_b       varchar(50),
   /*多选的答案c*/
   top_daan_c       varchar(50),
   /*多选的答案d*/
   top_daan_d       varchar(50),
   primary key (grade_detail_id)
);

/*试卷+所有题目,试卷明细*/
create table test_topic
(
   /*试卷单id*/
   test_topic_id     varchar(36) not null,
   /*试卷编号*/
   test_id           varchar(36),
   /*题目编号*/
   top_id            varchar(36),
   /*试题分数*/
   top_score         int,
   primary key (test_topic_id)
);

/*试卷*/
create table test
(
   /*试卷id*/
   test_id           varchar(36) not null,
   /*那个老师出的试卷*/
   tea_id            varchar(36),
   /*试卷名称*/
   test_name         varchar(36),
   /*试卷的难度*/       
   test_nandu        varchar(36),
   /*试卷的总分*/
   test_score        int,
   /*题目个数*/
   test_total        int,
   /*考试时间 分钟为单位*/
   test_time         int,
   /*状态/完成/未完成*/
   test_state        varchar(36),
   primary key (test_id)
);

/*试卷*/
create table test_record
(
	/*记录id*/
   test_record_id    varchar(36) not null,
   /*试卷id*/
   test_id           varchar(36),
   /*那个老师出的试卷*/
   tea_id            varchar(36),
   /*试卷名称*/
   test_name         varchar(36),
   /*试卷的难度*/       
   test_nandu        varchar(36),
   /*试卷的总分*/
   test_score        int,
   /*题目个数*/
   test_total        int,
   /*考试时间 分钟为单位*/
   test_time         int,
   /*状态/完成/未完成*/
   test_state        varchar(36),
   /*删除的时间*/
   test_deltime      date,
   primary key (test_id)
);

/*试题+答案*/
create table topic
(
   /*题目id*/
   top_id           varchar(36) not null,
   /*那个老师出的题*/
   tea_id           varchar(36),
   /*类型 /1填空/2单选择/3多选*/
   top_type         varchar(36),
   /*考试知识点*/
   top_knowledge    varchar(36),
   /*难度*/
   top_nandu        varchar(36),
   /*题目 */
   top_timu         varchar(100),
   /*选项a*/
   top_a            varchar(50),
   /*选项b*/ 
   top_b            varchar(50),
   /*选项c*/
   top_c            varchar(50),
   /*选项d*/
   top_d            varchar(50),
   /*答案*/
   top_daan         varchar(50),
   /*多选的答案a*/
   top_daan_a       varchar(50),
   /*多选的答案b*/
   top_daan_b       varchar(50),
   /*多选的答案c*/
   top_daan_c       varchar(50),
   /*多选的答案d*/
   top_daan_d       varchar(50),
   primary key (top_id)
);

/*系统参数表*/
create table sys_param
(
   /*字典id*/
   sys_param_id         varchar(36) not null,
   /*key*/
   sys_param_key        varchar(50),
   /*value*/
   sys_param_value      varchar(50),
   primary key (sys_param_id)
);
/*学生信息表*/
select * from students;
/*老师信息表*/
select * from teacher;
/*管理员信息表*/
select * from admin;
/*班级表*/
select * from classes;
/*老师的任课表  teacher--classes*/
select * from tab;
/*成绩单*/
select * from grade;
/*成绩单明细*/
select * from grade_detail;
/*试卷+所有题目,试卷明细*/
select * from test_topic;
/*试卷*/
select * from test;
/*试卷记录,删除之后放到这里*/
select * from test_record;
/*试题+答案*/
select * from topic;
/*系统参数表*/
select * from sys_param;










