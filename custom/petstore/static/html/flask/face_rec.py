from flask import Flask, request
import base64
from flask_cors import CORS
import json
import os,base64 
import torch
from load_data import *
from train_model import *
import cv2

app = Flask(__name__)
CORS(app, resources=r'/*')

@app.route('/',methods=['POST'])
def hello_world():
    if request.method == "POST":
  
        data = json.loads(request.form.get('data'))
        username = data['data']
        username=   username.replace('data:image/png;base64,', '')
 
        imgdata=base64.b64decode(username)
        file=open('1.jpg','wb')
        file.write(imgdata)
        file.close()
     
        model =CNN(2)

        model = torch.load('/home/lwl/Code/model.h5')

        #分类器
        cascade_path = "/home/lwl/Code/front/flask/face/face_rec_pytorch-master/haarcascade_frontalface_default.xml"
        #加载分类器
        cascade = cv2.CascadeClassifier(cascade_path)
        #读取度片
        img = cv2.imread('1.jpg')
        person = {"index":-1, "prob":0}
       

        def pre11():
            faceRects = cascade.detectMultiScale(img, scaleFactor=1.2, minNeighbors=3, minSize=(42, 42))
            if len(faceRects) > 0:
                for faceRect in faceRects:
                    print('some body')
                    x, y, w, h = faceRect
                    # 截取脸部图像提交给模型识别这是谁
                    image = img[y - 10: y + h + 10, x - 10: x + w + 10]
                    #然后处理图像大小

                    #在此处进行预测
                    index, probability = pre(model, image)
                    person['index']=str(index)
                    person["prob"] = str(probability)
                    print(type(str(index)))


                    print(index, probability)
        pre11()
        print(person)


                    


   
        

        return person
    else:
        return person



if __name__ == '__main__':
    app.run(host='127.0.0.1', port='3002')


