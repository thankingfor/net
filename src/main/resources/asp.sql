drop database if exists asp;

create database asp default character set utf8;

use asp;

create table students
(
   /*ѧ��*/
   stu_id         varchar(36) not null,
   /*����*/
   stu_pass		  varchar(36),
   /*����*/
   stu_name       varchar(10),
   /*�Ա�*/
   stu_sex        varchar(30),
   /*�ֻ���*/
   stu_phone      varchar(30),
   /*��ѧʱ��*/
   stu_comedata   varchar(30),
   /*���ڰ༶*/
   class_id       varchar(36),
   /*ϲ��*/
   stu_favorable  varchar(100),
   /*����*/
   stu_words      varchar(100),
   /*��ע*/
   stu_remark     varchar(100),
   primary key (stu_id)
);

create table teacher
(
   /*�̹���*/
   tea_id         varchar(36) not null,
   /*����*/
   tea_pass		  varchar(36),
   /*����*/
   tea_name       varchar(10),
   /*�Ա�*/
   tea_sex        varchar(30),
   /*�ֻ���*/
   tea_phone      varchar(30),
   /*���ʱ��*/
   tea_comedata   varchar(30),
   /*ϲ��*/
   tea_favorable  varchar(100),
   /*����*/
   tea_words      varchar(100),
   /*��ע*/
   tea_remark     varchar(100),
   primary key (tea_id)
);

create table admin
(
   /*�̹���*/
   admin_id         varchar(36) not null,
   /*����*/
   admin_pass		varchar(36),
   /*����*/
   admin_name       varchar(10),
   /*�ֻ���*/
   admin_phone      varchar(30),
   primary key (admin_id)
);

create table classes
(
   /*�༶��*/
   class_id         varchar(36) not null,
   /*�༶����*/
   class_name       varchar(10),
   /*����Ժϵ*/
   class_yuanxi     varchar(30),
   primary key (class_id)
);

create table tab
(
   /*�ο�id*/
   tab_id         varchar(36) not null,
   /*��ʦ���*/
   tea_id         varchar(36),
   /*�༶���*/
   class_id       varchar(36),
   primary key (tab_id)
);

/*�Ծ������༶�ü�¼��*/
create table class_test
(
   /*�ο�id*/
   class_test_id         varchar(36) not null,
   /*�༶���*/
   class_id         varchar(36),
   /*�༶���*/
   test_id          varchar(36),
   /*״̬,���ǵ��Ժ���ܻ�ʵ��,����ѧ�������,��ʾ���ο������*/
   class_test_state varchar(36),
   primary key (class_test_id)
);

/*�ɼ���*/
create table grade
(
   /*�ɼ���id*/
   grade_id         varchar(36) not null,
   /*ѧ�����*/
   stu_id           varchar(36),
   /*ѧ������*/
   stu_score        int,
   /*�����Ծ�*/
   test_id          varchar(36),
   /*����״̬/δ���or���*/
   test_state          varchar(36),
   primary key (grade_id)
);

/*�ɼ�����ϸ*/
create table grade_detail
(
   /*�ɼ�����ϸid*/
   grade_detail_id   varchar(36) not null,
   /*�ɼ������*/
   grade_id          varchar(36),
   /*��Ŀ���*/
   top_id            varchar(36),
   /*ѧ���������÷���*/
   stu_score         int,
   /*�����/��ѡ/��յ�*/
   top_daan         varchar(50),
   /*��ѡ�Ĵ�a*/
   top_daan_a       varchar(50),
   /*��ѡ�Ĵ�b*/
   top_daan_b       varchar(50),
   /*��ѡ�Ĵ�c*/
   top_daan_c       varchar(50),
   /*��ѡ�Ĵ�d*/
   top_daan_d       varchar(50),
   primary key (grade_detail_id)
);

/*�Ծ�+������Ŀ,�Ծ���ϸ*/
create table test_topic
(
   /*�Ծ�id*/
   test_topic_id     varchar(36) not null,
   /*�Ծ���*/
   test_id           varchar(36),
   /*��Ŀ���*/
   top_id            varchar(36),
   /*�������*/
   top_score         int,
   primary key (test_topic_id)
);

/*�Ծ�*/
create table test
(
   /*�Ծ�id*/
   test_id           varchar(36) not null,
   /*�Ǹ���ʦ�����Ծ�*/
   tea_id            varchar(36),
   /*�Ծ�����*/
   test_name         varchar(36),
   /*�Ծ���Ѷ�*/       
   test_nandu        varchar(36),
   /*�Ծ���ܷ�*/
   test_score        int,
   /*��Ŀ����*/
   test_total        int,
   /*����ʱ�� ����Ϊ��λ*/
   test_time         int,
   /*״̬/���/δ���*/
   test_state        varchar(36),
   primary key (test_id)
);

/*�Ծ�*/
create table test_record
(
	/*��¼id*/
   test_record_id    varchar(36) not null,
   /*�Ծ�id*/
   test_id           varchar(36),
   /*�Ǹ���ʦ�����Ծ�*/
   tea_id            varchar(36),
   /*�Ծ�����*/
   test_name         varchar(36),
   /*�Ծ���Ѷ�*/       
   test_nandu        varchar(36),
   /*�Ծ���ܷ�*/
   test_score        int,
   /*��Ŀ����*/
   test_total        int,
   /*����ʱ�� ����Ϊ��λ*/
   test_time         int,
   /*״̬/���/δ���*/
   test_state        varchar(36),
   /*ɾ����ʱ��*/
   test_deltime      date,
   primary key (test_id)
);

/*����+��*/
create table topic
(
   /*��Ŀid*/
   top_id           varchar(36) not null,
   /*�Ǹ���ʦ������*/
   tea_id           varchar(36),
   /*���� /1���/2��ѡ��/3��ѡ*/
   top_type         varchar(36),
   /*����֪ʶ��*/
   top_knowledge    varchar(36),
   /*�Ѷ�*/
   top_nandu        varchar(36),
   /*��Ŀ */
   top_timu         varchar(100),
   /*ѡ��a*/
   top_a            varchar(50),
   /*ѡ��b*/ 
   top_b            varchar(50),
   /*ѡ��c*/
   top_c            varchar(50),
   /*ѡ��d*/
   top_d            varchar(50),
   /*��*/
   top_daan         varchar(50),
   /*��ѡ�Ĵ�a*/
   top_daan_a       varchar(50),
   /*��ѡ�Ĵ�b*/
   top_daan_b       varchar(50),
   /*��ѡ�Ĵ�c*/
   top_daan_c       varchar(50),
   /*��ѡ�Ĵ�d*/
   top_daan_d       varchar(50),
   primary key (top_id)
);

/*ϵͳ������*/
create table sys_param
(
   /*�ֵ�id*/
   sys_param_id         varchar(36) not null,
   /*key*/
   sys_param_key        varchar(50),
   /*value*/
   sys_param_value      varchar(50),
   primary key (sys_param_id)
);
/*ѧ����Ϣ��*/
select * from students;
/*��ʦ��Ϣ��*/
select * from teacher;
/*����Ա��Ϣ��*/
select * from admin;
/*�༶��*/
select * from classes;
/*��ʦ���οα�  teacher--classes*/
select * from tab;
/*�ɼ���*/
select * from grade;
/*�ɼ�����ϸ*/
select * from grade_detail;
/*�Ծ�+������Ŀ,�Ծ���ϸ*/
select * from test_topic;
/*�Ծ�*/
select * from test;
/*�Ծ��¼,ɾ��֮��ŵ�����*/
select * from test_record;
/*����+��*/
select * from topic;
/*ϵͳ������*/
select * from sys_param;










