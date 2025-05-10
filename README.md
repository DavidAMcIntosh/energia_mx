# Cenace Energia Script

This script makes a POST request to the Cenace API, retrieves JSON data, and processes it into a CSV file for easier analysis. The CSV contains energy demand and generation data for a specific "gerencia" (management unit) at the specified time.

## Prerequisites

Before running the script, ensure the following:

- **Curl** is installed and available in the system's PATH.
- **PowerShell** is installed (it comes pre-installed on most modern Windows systems).
- **Windows Operating System** (this script is designed to run on Windows).
- A working internet connection to send the POST request and retrieve data from the Cenace API.

## How It Works

The script performs the following steps:

1. **Retrieve the Current Date**: The script fetches the current date in `YYYYMMDD` format to name the output files dynamically.
   
2. **Send POST Request**: Using `curl`, the script sends a POST request to the Cenace API (`https://www.cenace.gob.mx/GraficaDemanda.aspx/obtieneValoresTotal`) with a JSON payload for a specific "gerencia".
   
3. **Save Raw JSON Response**: The response is saved as a raw JSON file in the `output` directory.

4. **Parse JSON and Create CSV**: The script uses PowerShell to parse the raw JSON, extract relevant fields (`hora`, `valorDemanda`, `valorGeneracion`, `valorEnlace`, `valorPronostico`), and save the data in a CSV format.

5. **Save CSV File**: The CSV file is saved in the `output` folder with the current date appended to its name.

## How to Use

### 1. Clone or Download the Script
Save the batch script as a `.bat` file (e.g., `cenace_energy_script.bat`).

### 2. Run the Script
To execute the script, simply double-click the `.bat` file or run it from the command prompt. The script will:

- Fetch the current date.
- Send a POST request to the Cenace API.
- Parse the response JSON.
- Generate a CSV file in the `output` folder.

**Example:**

```batch
C:\path\to\your\script\cenace_energy_script.bat
