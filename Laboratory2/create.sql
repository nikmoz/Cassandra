-- Table: public."Teacher"

-- DROP TABLE public."Teacher";

CREATE TABLE public."Teacher"
(
    Name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    Degree character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Teacher_pkey" PRIMARY KEY (Name)
)

TABLESPACE "Test";

-- Table: public."Discipline"

-- DROP TABLE public."Discipline";

CREATE TABLE public."Discipline"
(
    Name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    Teacher_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Discipline_pkey" PRIMARY KEY (Name),
    CONSTRAINT "Discipline_fk" FOREIGN KEY (Teacher_name)
        REFERENCES public."Teacher" (Name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE "Test";


-- Table: public."Student"

-- DROP TABLE public."Student";

CREATE TABLE public."Student"
(
    Name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    SGroup integer NOT NULL,
    CONSTRAINT "Student_pkey" PRIMARY KEY (Name, SGroup)
)

TABLESPACE "Test";

-- Table: public."Task"

-- DROP TABLE public."Task";

CREATE TABLE public."Task"
(
    ID integer NOT NULL,
    Discipline_name character varying(255) COLLATE pg_catalog."default",
    Value integer NOT NULL,
    Deadline time without time zone NOT NULL,
    Name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Task_pkey" PRIMARY KEY (ID),
    CONSTRAINT "Task_Discipline_fk" FOREIGN KEY (Discipline_name)
        REFERENCES public."Discipline" (Name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE "Test";


-- Table: public."Student_Task"

-- DROP TABLE public."Student_Task";

CREATE TABLE public."Student_Task"
(
    Student_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    Student_group integer NOT NULL,
    Task_id integer NOT NULL,
    CONSTRAINT "Student_Task_pkey" PRIMARY KEY (Student_name, Student_group, Task_id),
    CONSTRAINT "Student_Task_fk" FOREIGN KEY (Student_group, Student_name)
        REFERENCES public."Student" (SGroup, Name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Task_Student_fk" FOREIGN KEY (Task_id)
        REFERENCES public."Task" (ID) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE "Test";

-- Table: public."Student_Discipline"

-- DROP TABLE public."Student_Discipline";

CREATE TABLE public."Student_Discipline"
(
    Discipline_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    Student_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    Student_group integer NOT NULL,
    Points integer NOT NULL,
    CONSTRAINT "Student_Discipline_pkey" PRIMARY KEY (Discipline_name, Student_name, Student_group),
    CONSTRAINT "Student_Discipline_fk" FOREIGN KEY (Discipline_name)
        REFERENCES public."Discipline" (Name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Student_Discipline_fk2" FOREIGN KEY (Student_group, Student_name)
        REFERENCES public."Student" (SGroup, Name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE "Test";
