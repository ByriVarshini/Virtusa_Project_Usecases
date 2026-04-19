import os
from datetime import datetime

# input and output file names
log_file_name = "server.log"
today_date = datetime.now().strftime("%Y-%m-%d")
output_file_name = f"security_alert_{today_date}.txt"

# dictionary to count error types
error_count = {
    "ERROR": 0,
    "CRITICAL": 0,
    "FAILED LOGIN": 0
}

# list to store important lines
alert_lines = []

# read the log file
with open(log_file_name, "r") as file:
    for line in file:
        line = line.strip()

        # check for keywords
        if "ERROR" in line:
            error_count["ERROR"] += 1
            alert_lines.append(line)

        elif "CRITICAL" in line:
            error_count["CRITICAL"] += 1
            alert_lines.append(line)

        elif "FAILED LOGIN" in line:
            error_count["FAILED LOGIN"] += 1
            alert_lines.append(line)

# write filtered data to new file
with open(output_file_name, "w") as file:
    file.write("Security Alert Report\n")
    file.write(f"Date: {today_date}\n\n")

    file.write("Summary:\n")
    for key, value in error_count.items():
        file.write(f"{key}: {value}\n")

    file.write("\nDetailed Logs:\n")
    for line in alert_lines:
        file.write(line + "\n")

# print file size to confirm creation
file_size = os.path.getsize(output_file_name)

print("Report generated successfully.")
print("Output file:", output_file_name)
print("File size:", file_size, "bytes")
