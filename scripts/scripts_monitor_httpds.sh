#!/bin/bash

# Define the name of the service to monitor
SERVICE_NAME="httpd"

# Check if the service is running
if systemctl is-active --quiet $SERVICE_NAME; then
    echo "$SERVICE_NAME is running."
else
    # If the service is not running, try to start it
    echo "$SERVICE_NAME is not running. Attempting to start..."
    systemctl start $SERVICE_NAME

    # Check the exit status of the start command
    if [ $? -eq 0 ]; then
        echo "$SERVICE_NAME has been started successfully."
    else
        echo "Failed to start $SERVICE_NAME."
        # You can add additional handling here, like sending an alert
    fi
fi
