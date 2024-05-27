import sys

#print(sys.path)
import io
import json

import pandas as pd
from flask import Flask, jsonify, request
from torchvision import models
import torch
import torch.nn as nn
import torch.nn.functional as F

from mean_and_std import x_mean, x_std 
from mean_and_std import y_mean, y_std 
# our data

# define the same class as the one used in training
class NeuralNetwork(nn.Module):
    def __init__(self):
        super(NeuralNetwork, self).__init__()
        self.layer1 = nn.Linear(24, 24)
        self.layer2 = nn.Linear(24, 36)
        self.layer3 = nn.Linear(36, 24)
        self.layer4 = nn.Linear(24, 12)
        self.output = nn.Linear(12, 1)
        
    def forward(self, x):
        x = F.relu(self.layer1(x))
        x = F.relu(self.layer2(x))
        x = F.relu(self.layer3(x))
        x = F.relu(self.layer4(x))
        x = self.output(x)
        return x
app = Flask(__name__)

model = NeuralNetwork()

state_dict = torch.load("model.pth")
model.load_state_dict(state_dict)

# set model to eval mode 
model.eval()

def transform_input(input_data):
    #data_scaled = scale_data(input_data)
    data_tensor = torch.tensor(input_data)
    return data_tensor 

def read_json_file(file_path):
    df = pd.read_json(file_path, orient='records', lines=True)
    return df

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)

    #input_data = data['input']
    data_list = []
    for key, value in data.items():
        data_list.append(value)
        data_list[-1] = (data_list[-1] - x_mean[key]) / x_std[key]

    input_tensor = transform_input(data_list)

    with torch.no_grad():
        output = model(input_tensor)
        
    prediction = output.numpy().tolist()

    prediction[0] = prediction[0] * y_std + y_mean
    print(type(prediction))

    return jsonify({'prediction': prediction})

@app.route('/get-correlations', methods=['GET'])
def get_data():
    file_path = "selected_columns.json"
    df = read_json_file(file_path)
    data = df.to_dict(orient='records') # to list of dictionaries
    return jsonify(data)

if __name__ == "__main__":
    app.run(debug=True)
