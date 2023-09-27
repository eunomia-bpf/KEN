## How to Use

### Starting the Service Program
Before you begin, make sure to install the necessary packages: flask, flask_cors, jq.

Then, you can start the backend service using the following command:
```shell
cd ./evaluation
python ./index.py
```

This will launch the service program at http://127.0.0.1:4000. The backend service accepts five parameters: `user_input`, `additionalContext`, `bpfType`, `model`, and `apiKey`. The backend will generate code using KEN and return the results.

### Launching the Front-end Web Page
```shell
cd ./front-end
npm install # This command only needs to be executed on the first run
npm run dev
```

This will initiate the service at http://127.0.0.1:3000. You can choose your desired model on the frontend and provide program description information. The frontend will then send these parameters to the backend and display the processing results.
