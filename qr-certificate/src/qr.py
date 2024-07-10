from flask import Flask, render_template,request
import qrcode
from io import BytesIO
from base64 import b64encode

app=Flask(__name__)

@app.route('/')
def home():
    return render_template('qrcodegen.html')


@app.route('/qrmaker',methods=['GET','POST'])
def genQR():
    data=request.form.to_dict()
    data_to_convert=data['data']  
    qr=qrcode.make(data_to_convert)
    qr.save('src\static\img\qrcode.jpg')
    return render_template('qrcodegen.html')



if __name__=='__main__':
    app.run(debug=True)