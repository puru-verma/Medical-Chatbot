# Use official Python slim image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the application code
COPY . .

# Expose port 8080 (required by Cloud Run)
EXPOSE 8080

# Command to run the app using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
