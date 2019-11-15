FROM continuumio/miniconda3

LABEL Name=keratoconus-tracking Version=0.0.1
EXPOSE 5000

WORKDIR /app
ADD . /app

RUN conda env create -f environment.yml
CMD /bin/bash -c "source activate myenv && mlflow server --host 0.0.0.0 --port $PORT --backend-store-uri $BACKEND_STORE_URI --default-artifact-root ./mlruns"
