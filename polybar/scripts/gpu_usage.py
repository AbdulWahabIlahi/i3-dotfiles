# #!/usr/bin/env python3
# import pynvml
# import sys

# def get_gpu_usage():
#     try:
#         pynvml.nvmlInit()
#         device_count = pynvml.nvmlDeviceGetCount()
        
#         output = []
#         for i in range(device_count):
#             handle = pynvml.nvmlDeviceGetHandleByIndex(i)
#             util = pynvml.nvmlDeviceGetUtilizationRates(handle)
#             output.append(f"GPU {i}: {util.gpu}%")
        
#         pynvml.nvmlShutdown()
#         return ' | '.join(output).strip()
#     except pynvml.NVMLError as nvml_error:
#         return f"NVML Error: {nvml_error}"
#     except Exception as e:
#         return f"Unexpected Error: {e}"

# if __name__ == "__main__":
#     sys.stdout.write(get_gpu_usage())

print("4%")