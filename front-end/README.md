## how to use

### Start the service program
```shell
cd ./evaluation
python ./index.py
```

This will start the service program http://127.0.0.1:4000. To use this service, you need to pass four parameters: user_query, bpfType, model, and apiKey. The backend service will return the program corresponding to `user_query`.

Currently, `index.py` contains the relevant processing code for GPT-3.5 and GPT-4, with the code for other models to be completed later.

### Launch the front-end web page
```shell
cd ./front-end
npm install # executes on first run
npm run dev
```

This will start the service http://127.0.0.1:3000. You can select the desired model on the frontend and input program description information. The frontend will pass the parameters to the backend and return the processing results.