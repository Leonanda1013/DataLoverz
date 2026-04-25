from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import pickle
import json

app = FastAPI()

# Tambahan CORS agar Next.js bisa akses
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class model_input(BaseModel):
    Pregnancies: int
    Glucose: int
    BloodPressure: int
    SkinThickness: int
    Insulin: int
    BMI: float
    DiabetesPedigreeFunction: float
    Age: int

diabetes_model = pickle.load(open('diabetes_model.sav', 'rb'))

@app.post('/diabetes_prediction')
def diabetes_pred(input_parameters: model_input):
    input_data = input_parameters.json()
    input_dictionary = json.loads(input_data)

    input_list = [
        input_dictionary['Pregnancies'],
        input_dictionary['Glucose'],
        input_dictionary['BloodPressure'],
        input_dictionary['SkinThickness'],
        input_dictionary['Insulin'],
        input_dictionary['BMI'],
        input_dictionary['DiabetesPedigreeFunction'],
        input_dictionary['Age'],
    ]

    prediction = diabetes_model.predict([input_list])

    if prediction[0] == 0:
        return {"result": "Orang tersebut tidak terkena Diabetes"}
    else:
        return {"result": "Orang tersebut terkena Diabetes"}