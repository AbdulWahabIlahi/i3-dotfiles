# import subprocess

# def get_gpu_load():
#     try:
#         result = subprocess.run(
#             ['nvidia-smi', '--query-gpu=utilization.gpu', '--format=csv,noheader,nounits'],
#             capture_output=True,
#             text=True
#         )
#         gpu_load = result.stdout.strip()
#         return f"{gpu_load}%"
#     except Exception as e:
#         return f"Error: {e}"

# if __name__ == "__main__":
#     print(get_gpu_load())
