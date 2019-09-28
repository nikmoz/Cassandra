from cassandra.cluster import Cluster

if __name__ == "__main__":
    cluster = Cluster(['127.0.0.1'], port=9042)
    session = cluster.connect('student_todo', wait_for_all_pools=True)
    session.execute('USE student_todo')
    session.execute(
        "BEGIN BATCH "
        "INSERT INTO teacher (name, discipline, groups) VALUES ('Vovck','Statistic',[61,62,63]) ; "
        "INSERT INTO discipline (name, teacher_name, value) VALUES ('Statistic', 'Vovck',100) ;"
        "APPLY BATCH;")
