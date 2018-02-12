# Use an official Python runtime as a parent image
FROM python:2.7-slim

# TODO
# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
Add . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this containers
EXPOSE 80

# Define environment variable
ENV NAME world

# Run app.py when the container launches
CMD ["python", "app.py"]