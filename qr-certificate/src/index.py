import pyodbc
from flask import Flask,render_template

app=Flask(__name__)

connection=pyodbc.connect('DRIVER={SQL Server};SERVER=localhost;DATABASE=proyectoVenta1;UID=sa;PWD=admin123;')



@app.route('/')
def index():
    lista=[]
    cursor=connection.cursor()
    cursor.execute("select * from productos")
    rows=cursor.fetchall()
    for row in rows:
        lista.append({"Codigo":row[0],"Nombre":row[1],"Descripcion":row[2],
                      "Precio":row[3],"Stock":row[4],
                      "Fechaing":row[5],"Fechacad":row[6],
                      "Rutaimg":row[7],"Estado":row[8],
                      "Codcat":row[9]})
    #connection.close()
    return render_template('index.html',data=lista)

if __name__=='__main__':
    app.run(debug=True)