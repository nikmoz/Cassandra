INSERT INTO student_todo.student (group,name,discipline_points) VALUES (61,'Mozgovoy',{'C++':80,'OOP':75});             
INSERT INTO student_todo.student (group,name,discipline_points) VALUES (61,'Patrushev',{'Probability':80});
INSERT INTO student_todo.student (group,name,discipline_points) VALUES (2002,'Arthas',{'Holy':60,'Purging':95});

Select group  FROM  student_todo.student;              
Select name  FROM  student_todo.student WHERE group=61 ;
Select discipline_points  FROM  student_todo.student WHERE group=61 AND name='Mozgovoy';   

INSERT INTO student_todo.discipline (name, teacher_name, value) VALUES ('OOP','Borisenko',60);             
INSERT INTO student_todo.discipline (name, teacher_name, value) VALUES ('OOP','Pashko',70);
INSERT INTO student_todo.discipline (name, teacher_name, value) VALUES ('Holy','Uther',100);

Select name  FROM  student_todo.discipline;              
Select teacher_name  FROM  student_todo.discipline WHERE name='OOP';
Select value  FROM  student_todo.discipline WHERE name='OOP' AND teacher_name='Borisenko'; 

INSERT INTO student_todo.teacher (name, discipline, groups) VALUES ('Borisenko','OOP',[61,62,63]);             
INSERT INTO student_todo.teacher (name, discipline, groups) VALUES ('Pashko','Probability',[71,72]);
INSERT INTO student_todo.teacher (name, discipline, groups) VALUES ('Medivh','Listen to me boy',[2002,2007]);

Select name  FROM  student_todo.teacher;              
Select discipline  FROM  student_todo.teacher WHERE name='Medivh';
Select groups  FROM  student_todo.teacher WHERE name='Medivh' AND discipline='Listen to me boy';      

INSERT INTO student_todo.task (group, discipline, tasks) VALUES (61,'OOP',[{name:'Learn patterns',value:10,deadline:'2017-09-05 00:00:00',complete_count:0}]);             
INSERT INTO student_todo.task (group, discipline, tasks) VALUES (61,'OOP',[{name:'Practice observer',value:20,deadline:'2017-09-05 00:00:00',complete_count:1}]); 
INSERT INTO student_todo.task (group, discipline, tasks) VALUES (2002,'Listen to me boy',[{name:'Listen boy',value:100,deadline:'2003-01-07 00:00:00',complete_count:-1}]); 

Select group  FROM  student_todo.task;              
Select discipline  FROM  student_todo.task WHERE group=61;
Select tasks  FROM  student_todo.task WHERE group=61 AND discipline='OOP';    

UPDATE student_todo.task SET tasks=tasks+[{name:'Practice observer',value:20,deadline:'2017-09-05 00:00:00',complete_count:1}] WHERE group=61 AND discipline='OOP';
Select tasks  FROM  student_todo.task WHERE group=61 AND discipline='OOP';   
   
UPDATE student_todo.student SET discipline_points={'Purging':100,'Death Knigth':85} WHERE group=2003 AND name='Arthas';
Select discipline_points  FROM  student_todo.student WHERE group=2003 AND name='Arthas';
  
UPDATE student_todo.discipline SET value=100 WHERE name='OOP' AND teacher_name='Pashko';  
Select value  FROM  student_todo.discipline WHERE name='OOP' AND teacher_name='Pashko'; 
   
Select tasks From student_todo.task Where group=61 AND discipline='OOP';

Select discipline_points From student_todo.student Where group=2003 AND name='Arthas';

Select groups  FROM  student_todo.teacher WHERE name='Medivh' AND discipline='Listen to me boy';  

Select value From student_todo.discipline Where name='OOP' AND teacher_name='Pashko';

DELETE discipline_points FROM student_todo.student WHERE group=2003 AND name='Arthas';

DELETE tasks FROM student_todo.task WHERE group=61 AND discipline='OOP';

DELETE groups FROM student_todo.teacher WHERE name='Medivh' AND discipline='Listen to me boy'; 