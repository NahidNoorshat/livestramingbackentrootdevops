FROM python:3.9

# Install necessary packages
RUN apt-get update &&     apt-get install -y python3-pip python3-dev libpq-dev cron &&     apt-get clean

# Create application directory
WORKDIR /opt/app

# Copy application code
COPY requirements.txt /opt/app/
RUN pip install -r requirements.txt
COPY . /opt/app/

# Set execute permission for entrypoint script
RUN chmod +x /opt/app/entrypoint.sh

# Define entrypoint
# Start cron daemon and the entrypoint script
CMD ["sh", "-c", "cron && /opt/app/entrypoint.sh"]