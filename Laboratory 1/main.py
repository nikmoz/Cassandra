from cassandra.cluster import Cluster

cluster = Cluster(['127.0.0.1'], port=9042)

def Execute(Query):
    session = cluster.connect('student_todo', wait_for_all_pools=True)
    session.execute('USE student_todo')
    rows = session.execute(Query)
    if (rows):
        for row in rows:
            print(row)
        print('------------------------------')


if __name__ == "__main__":
    Execute(
        'INSERT INTO student (group,name,discipline_points) VALUES (61,\'Mozgovoy\',{\'C++\':80,\'OOP\':75})')
    Execute(
        'INSERT INTO student_todo.student (group,name,discipline_points) VALUES (2002,\'Arthas\',{\'Holy\':60,\'Purging\':95}) ')
    Execute(
        'INSERT INTO student_todo.student (group,name,discipline_points) VALUES (61,\'Patrushev\',{\'Probability\':80})')

    Execute('Select group  FROM  student')
    Execute('Select name  FROM  student WHERE group=61')
    Execute('Select discipline_points  FROM  student WHERE group=61 AND name=\'Mozgovoy\'')

    Execute('INSERT INTO discipline (name, teacher_name, value) VALUES (\'OOP\',\'Borisenko\',60) ')
    Execute('INSERT INTO discipline (name, teacher_name, value) VALUES (\'OOP\',\'Pashko\',70)')
    Execute('INSERT INTO discipline (name, teacher_name, value) VALUES (\'Holy\',\'Uther\',100) ')

    Execute('Select name  FROM  discipline')
    Execute('Select teacher_name  FROM  discipline WHERE name=\'OOP\'')
    Execute('Select value  FROM  discipline WHERE name=\'OOP\' AND teacher_name=\'Borisenko\'')

    Execute(
        'INSERT INTO teacher (name, discipline, groups) VALUES (\'Borisenko\',\'OOP\',[61,62,63]) ')
    Execute(
        'INSERT INTO teacher (name, discipline, groups) VALUES (\'Pashko\',\'Probability\',[71,72])')
    Execute(
        'INSERT INTO teacher (name, discipline, groups) VALUES (\'Medivh\',\'Listen to me boy\',[2002,2007])')

    Execute('Select name  FROM  teacher')
    Execute('Select discipline  FROM  teacher WHERE name=\'Medivh\'')
    Execute('Select groups  FROM  teacher WHERE name=\'Medivh\' AND discipline=\'Listen to me boy\'')

    Execute(
        'INSERT INTO task (group, discipline, tasks) VALUES (61,\'OOP\',[{name:\'Learn patterns\',value:10,deadline:\'2017-09-05 00:00:00\',complete_count:0}]) ')
    Execute(
        'INSERT INTO task (group, discipline, tasks) VALUES (61,\'OOP\',[{name:\'Practice observer\',value:20,deadline:\'2017-09-05 00:00:00\',complete_count:1}]) ')
    Execute(
        'INSERT INTO task (group, discipline, tasks) VALUES (2002,\'Listen to me boy\',[{name:\'Listen boy\',value:100,deadline:\'2003-01-07 00:00:00\',complete_count:-1}]) ')

    Execute('Select group  FROM  task')
    Execute('Select discipline  FROM  task WHERE group=61')
    Execute('Select tasks  FROM  task WHERE group=61 AND discipline=\'OOP\'')

    Execute(
        'UPDATE task SET tasks=tasks+[{name:\'Practice observer\',value:20,deadline:\'2017-09-05 00:00:00\',complete_count:1}] WHERE group=61 AND discipline=\'OOP\'')
    Execute('Select tasks  FROM task WHERE group=61 AND discipline=\'OOP\'')
    Execute(
        'UPDATE student SET discipline_points={\'Purging\':100,\'Death Knigth\':85} WHERE group=2003 AND name=\'Arthas\'')
    Execute('Select discipline_points  FROM  student WHERE group=2003 AND name=\'Arthas\'')
    Execute(
        'UPDATE discipline SET value=100 WHERE name=\'OOP\' AND teacher_name=\'Pashko\'')
    Execute('Select value  FROM  discipline WHERE name=\'OOP\' AND teacher_name=\'Pashko\'')

    Execute('Select tasks From task Where group=61 AND discipline=\'OOP\'')
    Execute('Select discipline_points From student Where group=2003 AND name=\'Arthas\'')
    Execute('Select groups  FROM  teacher WHERE name=\'Medivh\' AND discipline=\'Listen to me boy\'')
    Execute('Select value From discipline Where name=\'OOP\' AND teacher_name=\'Pashko\'')

    Execute("DELETE discipline_points FROM student WHERE group=2003 AND name='Arthas'")
    Execute("DELETE tasks FROM task WHERE group=61 AND discipline='OOP'")
    Execute("DELETE groups FROM teacher WHERE name='Medivh' AND discipline='Listen to me boy'")
