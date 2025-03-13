import os
import pandas as pd
import requests
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

api_endpoint = "https://api-endpoint-lqrn.onrender.com/"

try:
    response = requests.get(api_endpoint)
    response.raise_for_status()  # Raise an error for bad status codes
    data_json = response.json()
    print("Received JSON data:", data_json)  # Debug output

    # Process the JSON response into a DataFrame
    if not isinstance(data_json, (list, dict)):
        # If the JSON is a scalar, wrap it in a dict
        data = pd.DataFrame([{'value': data_json}])
    elif isinstance(data_json, dict):
        # If the dict has a nested key (like "data"), use that as the data
        if 'data' in data_json:
            nested = data_json['data']
            if isinstance(nested, dict):
                data = pd.DataFrame([nested])
            else:
                data = pd.DataFrame(nested)
        else:
            # Otherwise, wrap the entire dict in a list
            data = pd.DataFrame([data_json])
    else:
        # If it's already a list, create the DataFrame directly
        data = pd.DataFrame(data_json)

    csv_output_path = 'ml_file.csv'
    data.to_csv(csv_output_path, index=False)
    print(f"Data saved to {csv_output_path} successfully!")
except Exception as e:
    print("An error occurred:", e)
