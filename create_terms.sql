drop table if exists terms;
create table terms(
  id int not null auto_increment,
  term varchar(256) not null,
  definition text,
  notes text,
  access_note_id int,
  citation_id int,
  primary key (id)
);

drop table if exists access_notes;
create table access_notes(
  id int not null auto_increment,
  access_notes text,
  primary key (id)
);

drop table if exists citations;
create table citations(
  id int not null auto_increment,
  name varchar(256),
  url varchar(256),
  primary key (id)
);

drop table if exists instances;
create table instances(
  id int not null auto_increment,
  name varchar(256),
  url varchar(256),
  primary key (id)
);

drop table if exists term_instances;
create table term_instances(
  id int not null auto_increment,
  term_id int,
  instance_id int,
  primary key (id)
);

drop table if exists related_terms;
create table related_terms(
  id int not null auto_increment,
  master_term_id int,
  other_term_id int,
  primary key (id)
);
