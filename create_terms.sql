drop table if exists terms;
create table terms(
  term_id int not null auto_increment,
  term varchar(256) not null,
  definition varchar(256),
  notes text,
  access_note_id int,
  citation_id int,
  primary key (term_id)
);

drop table if exists access_notes;
create table access_notes(
  access_note_id int not null auto_increment,
  access_notes text,
  primary key (access_note_id)
);

drop table if exists citations;
create table citations(
  citation_id int not null auto_increment,
  citation_name varchar(256),
  citation_url varchar(256),
  primary key (citation_id)
);

drop table if exists instances;
create table instances(
  instance_id int not null auto_increment,
  document_name varchar(256),
  document_url varchar(256),
  primary key (instance_id)
);

drop table if exists term_instances;
create table term_instances(
  instance_id int not null auto_increment,
  document_name varchar(256),
  document_url varchar(256),
  primary key (instance_id)
);
