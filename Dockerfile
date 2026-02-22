# Use a slim Python image to save space on the older Pi
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Install system dependencies required for hardware I2C communication
# We use libgpiod-dev and gpiod to auto-resolve the correct library version
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev\
    i2c-tools \
    libgpiod-dev \
    gpiod \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the renamed application code
COPY GreenDIGIT.py .

# Expose HTTP port 80
EXPOSE 80

# Start the FastAPI server
CMD ["uvicorn", "GreenDIGIT:app", "--host", "0.0.0.0", "--port", "80"]
