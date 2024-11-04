# Use the official Python image from Docker Hub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY core/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire core folder to the working directory
COPY core/ .

# Set environment variables
ENV FLASK_APP=core/server.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=7755

# Command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:7755", "core.server:app"]
