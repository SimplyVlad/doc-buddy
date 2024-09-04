# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Define environment variable
ENV NG_LINK ngrock-tunnel-url

# Run Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]