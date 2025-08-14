FROM python:3.12.0b1-slim-buster
WORKDIR /service
COPY requirements.txt .
COPY . ./
RUN pip install -r requirements.txt
ENTRYPOINT [ "python3", "app.py" ]