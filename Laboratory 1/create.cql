CREATE KEYSPACE IF NOT EXISTS student_todo
WITH replication = {
'class': 'SimpleStrategy',
'replication_factor' : 1
}
AND durable_writes = FALSE;

CREATE TABLE IF NOT EXISTS student_todo.student (
    name text,
    group int,
    discipline_points map<text,int>,
    PRIMARY KEY (group,name)
);

CREATE TABLE IF NOT EXISTS student_todo.discipline (
    name text,
    value int,
    teacher_name text,
    PRIMARY KEY (name,teacher_name)
);
CREATE TABLE IF NOT EXISTS student_todo.teacher (
    name text,
    groups list<int>,
    discipline text,
    PRIMARY KEY (name,discipline)
);
CREATE TYPE IF NOT EXISTS student_todo.task (
    name text,
    value int,
    deadline timestamp,
    complete_count int
);

CREATE TABLE IF NOT EXISTS student_todo.task (
    tasks list<FROZEN<task>>,
    group int,
    discipline text,
    PRIMARY KEY (group,discipline)
);