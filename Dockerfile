# Use a stable Python base image
FROM python:3.11-slim

# Install system-level dependencies for ML, plotting, etc.
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /service

# Copy only requirements first (for better Docker caching)
COPY requirements.txt ./
COPY . ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for App Runner
ENV PORT=8080

# Set the entrypoint to run your Flask app (adjust as needed)
CMD ["python3", "app.py"]