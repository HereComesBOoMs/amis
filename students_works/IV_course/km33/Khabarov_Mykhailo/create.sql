

if exists(select 1 from sys.sysforeignkey where role='FK_LECTOR''S_LECTOR''S _USER') then
    alter table "Lector's subject"
       delete foreign key "FK_LECTOR'S_LECTOR'S _USER"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LECTOR''S_SUBJECT O_SUBJECT') then
    alter table "Lector's subject"
       delete foreign key "FK_LECTOR'S_SUBJECT O_SUBJECT"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VISITING_STUDENT V_USER') then
    alter table "Visiting info"
       delete foreign key "FK_VISITING_STUDENT V_USER"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VISITING_SUBJECT I_SUBJECT') then
    alter table "Visiting info"
       delete foreign key "FK_VISITING_SUBJECT I_SUBJECT"
end if;

drop index if exists "Lector's subject"."Subject of lector_FK";

drop index if exists "Lector's subject"."Lector's subject_FK";

drop table if exists "Lector's subject";

drop index if exists Subject.Subject_PK;

drop table if exists Subject;

drop index if exists "User".User_PK;

drop table if exists "User";

drop index if exists "Visiting info"."Subject is visited by student_FK";

drop index if exists "Visiting info"."Student visiting subjects_FK";

drop table if exists "Visiting info";

/*==============================================================*/
/* Table: "Lector's subject"                                    */
/*==============================================================*/
create table "Lector's subject" 
(
   NameS                long varchar                   null,
   Phone                long varchar                   null,
   First_name_fk        long varchar                   null,
   NameS_fk             long varchar                   null
);

/*==============================================================*/
/* Index: "Lector's subject_FK"                                 */
/*==============================================================*/
create index "Lector's subject_FK" on "Lector's subject" (
Phone ASC
);

/*==============================================================*/
/* Index: "Subject of lector_FK"                                */
/*==============================================================*/
create index "Subject of lector_FK" on "Lector's subject" (
NameS ASC
);

/*==============================================================*/
/* Table: Subject                                               */
/*==============================================================*/
create table Subject 
(
   NameS                long varchar                   not null,
   Amount               integer                        null,
   constraint PK_SUBJECT primary key (NameS)
);

/*==============================================================*/
/* Index: Subject_PK                                            */
/*==============================================================*/
create unique index Subject_PK on Subject (
NameS ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   Phone                long varchar                   not null,
   First_name           long varchar                   null,
   Last_name            long varchar                   null,
   Lector               smallint                       null,
   constraint PK_USER primary key (Phone)
);

/*==============================================================*/
/* Index: User_PK                                               */
/*==============================================================*/
create unique index User_PK on "User" (
Phone ASC
);

/*==============================================================*/
/* Table: "Visiting info"                                       */
/*==============================================================*/
create table "Visiting info" 
(
   NameS                long varchar                   null,
   Phone                long varchar                   null,
   First_name_fk        long varchar                   null,
   NameS_fk             long varchar                   null,
   "Date"               date                           null,
   Visited              smallint                       null
);

/*==============================================================*/
/* Index: "Student visiting subjects_FK"                        */
/*==============================================================*/
create index "Student visiting subjects_FK" on "Visiting info" (
Phone ASC
);

/*==============================================================*/
/* Index: "Subject is visited by student_FK"                    */
/*==============================================================*/
create index "Subject is visited by student_FK" on "Visiting info" (
NameS ASC
);

alter table "Lector's subject"
   add constraint "FK_LECTOR'S_LECTOR'S _USER" foreign key (Phone)
      references "User" (Phone)
      on update restrict
      on delete restrict;

alter table "Lector's subject"
   add constraint "FK_LECTOR'S_SUBJECT O_SUBJECT" foreign key (NameS)
      references Subject (NameS)
      on update restrict
      on delete restrict;

alter table "Visiting info"
   add constraint "FK_VISITING_STUDENT V_USER" foreign key (Phone)
      references "User" (Phone)
      on update restrict
      on delete restrict;

alter table "Visiting info"
   add constraint "FK_VISITING_SUBJECT I_SUBJECT" foreign key (NameS)
      references Subject (NameS)
      on update restrict
      on delete restrict;

