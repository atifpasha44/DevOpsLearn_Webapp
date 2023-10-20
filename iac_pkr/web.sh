#!/bin/bash

# Define the URL of the Apache server to monitor
SERVER_URL="http://example.com"

# Define the email address to receive notifications
TO_EMAIL="your@email.com"

# Function to send an email notification
send_email_notification() {
    local subject="HTTP Server Monitoring Alert"
    local message="The Apache HTTP server at $SERVER_URL is not responding."
    echo "$message" | mail -s "$subject" "$TO_EMAIL"
}

# Check if the HTTP server is responsive
if curl --output /dev/null --silent --head --fail "$SERVER_URL"; then
    echo "HTTP Server is running."
else
    echo "HTTP Server is not responding. Sending email notification."
    send_email_notification
fi

#####To Monitor Every 5 mins 
*/5 * * * * /path/to/your/script.sh
