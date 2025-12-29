# -------------------------------
# Base Image (STABLE & COMPATIBLE)
# -------------------------------
FROM python:3.10-slim

# -------------------------------
# System Dependencies
# -------------------------------
RUN apt-get update && apt-get install -y \
    ffmpeg \
    aria2 \
    gcc \
    libffi-dev \
    curl \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# -------------------------------
# Set Working Directory
# -------------------------------
WORKDIR /app

# -------------------------------
# Copy requirements first (cache)
# -------------------------------
COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# -------------------------------
# Copy Project Files
# -------------------------------
COPY . .

# -------------------------------
# Environment Variables
# -------------------------------
ENV PYTHONUNBUFFERED=1
ENV COOKIES_FILE_PATH="/modules/youtube_cookies.txt"

# -------------------------------
# Start Telegram Bot
# -------------------------------
CMD ["python", "main.py"]
