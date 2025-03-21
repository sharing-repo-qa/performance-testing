# JMeter and MockServer Test Setup
This project demonstrates how to set up and run a performance testing environment using Apache JMeter and MockServer. The setup allows JMeter to send requests to a mock API, which returns predefined responses.

---
## Prerequisites
Ensure you have the following installed on your system:
- **Docker**: [Install Docker](https://www.docker.com/get-started)
- **Docker Compose**: Usually included with Docker Desktop
- (Optional) JMeter installed locally if you'd like to run it outside the container
Using Powershell, go to the file location that contains the dockerfile. Then run `docker build -t jmeter .`

---
## Project Files
The project includes the following files:
1. **`mockserver_initializer.json`**
  - Defines the mock API behavior (e.g., endpoints, responses).
2. **`docker-compose.yml`**
  - Configures the MockServer and JMeter services.
3. **`example.jmx`**
  - The JMeter test plan (replace with your own test plan if needed).
4. **`results` directory**
  - Directory where JMeter stores the test results (`results.jtl`).
5. **`run-jmeter.ps1`** *(optional)* or **`run-jmeter.bat`**:
  - Scripts to execute JMeter locally if Docker is not used.
  
  ---
## How It Works
### 1. MockServer
- **URL**: `http://mockserver:1080/api/resource`
- Responds to `GET` requests with:
 ```json
 {
   "message": "Hello from MockServer!"
 }
 ```
- MockServer is configured using the `mockserver_initializer.json` file.
### 2. JMeter
- Sends requests to MockServer's endpoint (`http://mockserver:1080/api/resource`).
- Executes the test plan (`example.jmx`) defined in the project.
- Saves results in the `results` directory.
---
## Running the Setup
### Step 1: Start the Services
Run the following command to start MockServer and JMeter:
```bash
docker-compose up
```
This will:
1. Launch MockServer on port `1080`.
2. Execute JMeter using the provided test plan (`example.jmx`).

---
### Step 2: Check Results
- **Test Results**: JMeter will save the test results in the `results/results.jtl` file.
- **MockServer Logs**: Check MockServer's responses and logs in the terminal where Docker Compose is running.
---
### Step 3: Stop the Services
Once the test is complete, stop the services with:
```bash
docker-compose down
```

---
## Optional: Run JMeter Locally
If you'd like to run JMeter outside Docker, use the provided scripts:
- **PowerShell**:
 ```powershell
 ./run-jmeter.ps1
 ```

Ensure that JMeter is installed locally and the scripts are updated with your JMeter installation path.
## Docker
Start powershell in the project folder, then run `docker build .`
Then also run `docker run --rm -v ${PWD}:/test jmeter jmeter -n -t /test/example.jmx -l /test/results.jtl`
To enable running this test from your local machine, run `"jmeter -v"` 

---
## Modifying the Setup
1. **Change MockServer Responses**:
  - Update `mockserver_initializer.json` with your desired endpoint and response details.
2. **Update JMeter Test Plan**:
  - Open `example.jmx` in the JMeter GUI to edit the test plan.
3. **Adjust Docker Compose**:
  - Modify `docker-compose.yml` to add new services or change configurations.