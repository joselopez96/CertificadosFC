import pyodbc

lista=[]

try:
    connection=pyodbc.connect('DRIVER={SQL Server};SERVER=localhost;DATABASE=proyectoVenta1;UID=sa;PWD=admin123;')
    print('Conexion exitosa')
    cursor=connection.cursor()
    cursor.execute("select *from productos")
    rows=cursor.fetchall()
    for row in rows:
        print(row)
    
except Exception as ex:
    print(ex)
finally:
    connection.close()
    print("Conexion finalizada")