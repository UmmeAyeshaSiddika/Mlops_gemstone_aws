FROM python:3.12-slim

# Set working directory
WORKDIR /service

# Copy dependency file first for better Docker cache use
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Set default entrypoint
ENTRYPOINT ["python3", "app.py"]