# Define the login URL and credentials
$loginUrl = "http://example.com/login"
$username = "your_username"
$password = "your_password"

# Create a credential object
$credential = New-Object System.Management.Automation.PSCredential ($username, (ConvertTo-SecureString $password -AsPlainText -Force))

# Define the login data
$loginData = @{
    username = $username
    password = $password
}

# Send the POST request to log in
$response = Invoke-RestMethod -Uri $loginUrl -Method Post -Credential $credential -ContentType "application/x-www-form-urlencoded" -Body $loginData

# Check the response
if ($response) {
    if ($response.StatusCode -eq 200) {
        Write-Host "Login successful. HTTP status code: $($response.StatusCode)"
        # Add additional actions after successful login
    } else {
        Write-Host "Login failed. HTTP status code: $($response.StatusCode)"
        # Add error handling actions here
    }
} else {
    Write-Host "Failed to connect to the login URL."
    # Add error handling actions here
}



#####This script sends a POST request to the specified login URL with the provided username and password. Replace "http://example.com/login", "your_username", and "your_password" with the actual URL, username, and password for your specific HTTP server login.

#####Ensure that you have the necessary permissions and follow any relevant security and legal guidelines when automating login to a website. The specific details of the HTTP request and the authentication process may vary depending on the website's design and requirements.