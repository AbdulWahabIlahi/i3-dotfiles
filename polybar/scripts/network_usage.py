# import psutil
# import time
# import json
# import os

# def get_network_usage():
#     net_io = psutil.net_io_counters()
#     return net_io.bytes_sent, net_io.bytes_recv

# def save_usage(data, file_path="network_usage.json"):
#     with open(file_path, "w") as f:
#         json.dump(data, f)

# def load_usage(file_path="network_usage.json"):
#     if os.path.exists(file_path):
#         with open(file_path, "r") as f:
#             data = json.load(f)
#     else:
#         data = {"bytes_sent": 0, "bytes_recv": 0, "total_sent": 0, "total_recv": 0, "timestamp": time.time()}
    
#     if "total_sent" not in data:
#         data["total_sent"] = 0
#     if "total_recv" not in data:
#         data["total_recv"] = 0
    
#     return data

# def calculate_usage(initial_data, current_data):
#     bytes_sent = current_data[0] - initial_data["bytes_sent"]
#     bytes_recv = current_data[1] - initial_data["bytes_recv"]
#     return bytes_sent, bytes_recv

# def main():
#     file_path = "network_usage.json"
#     initial_data = load_usage(file_path)
#     current_data = get_network_usage()

#     usage_sent, usage_recv = calculate_usage(initial_data, current_data)

#     initial_data["total_sent"] += usage_sent
#     initial_data["total_recv"] += usage_recv
#     initial_data["bytes_sent"] = current_data[0]
#     initial_data["bytes_recv"] = current_data[1]

#     save_usage(initial_data, file_path)

#     print(f"Upload: {initial_data['total_sent'] / (1024 * 1024):.2f} MB, Download: {initial_data['total_recv'] / (1024 * 1024):.2f} MB")

# if __name__ == "__main__":
#     main()
