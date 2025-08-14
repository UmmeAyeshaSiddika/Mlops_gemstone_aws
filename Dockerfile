FROM python:3.11-slim
WORKDIR /service
COPY requirements.txt .
COPY . ./
ENV PORT=8080
RUN pip install -r requirements.txt
ENTRYPOINT [ "python3", "app.py" ]