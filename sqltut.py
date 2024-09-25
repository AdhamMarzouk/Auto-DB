import psycopg2

conn = psycopg2.connect(database="mydb",
                        host="35.168.156.240",
                        user="postgres",
                        password="postgres",
                        port="5432")

cursor = conn.cursor()

cursor.execute("SELECT * FROM  weather;") 

rows = cursor.fetchall()

for row in rows:
    print(row)

cursor.close()
conn.close()