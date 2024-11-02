# import subprocess

# def get_default_sink_index():
#     result = subprocess.run(['pactl', 'info'], stdout=subprocess.PIPE)
#     lines = result.stdout.decode().split('\n')
#     for line in lines:
#         if 'Default Sink' in line:
#             default_sink_name = line.split()[-1]
#             result = subprocess.run(['pactl', 'list', 'sinks'], stdout=subprocess.PIPE)
#             sinks = result.stdout.decode().split('\n')
#             for idx, sink_line in enumerate(sinks):
#                 if default_sink_name in sink_line:
#                     while idx < len(sinks):
#                         if 'Sink #' in sinks[idx]:
#                             return sinks[idx].split('#')[1].strip()
#                         idx += 1
#     return None

# def get_sink_inputs():
#     result = subprocess.run(['pactl', 'list', 'sink-inputs'], stdout=subprocess.PIPE)
#     return result.stdout.decode().split('\n')

# def find_current_app(sink_inputs, default_sink_index):
#     current_app = None
#     input_index = None
#     found_sink = False
#     for idx, line in enumerate(sink_inputs):
#         if 'Sink Input' in line:
#             input_index = line.split('#')[-1].strip()
#         if f'Sink: {default_sink_index}' in line and input_index is not None:
#             print(f"Matched Sink Input #{input_index} with default sink")  # Debug print
#             found_sink = True
#             for i in range(1, 50):  # Expand range to 50 lines
#                 if idx + i < len(sink_inputs):
#                     print(sink_inputs[idx + i])  # Debug print each line within range
#                     if 'application.name' in sink_inputs[idx + i]:
#                         current_app = sink_inputs[idx + i].split('"')[1]
#                         print(f"Found application name: {current_app}")  # Debug print
#                         return current_app
#     if not found_sink:
#         print("No matching sink found")  # Debug print
#     return None

# def main():
#     default_sink_index = get_default_sink_index()
#     if default_sink_index:
#         sink_inputs = get_sink_inputs()
#         current_app = find_current_app(sink_inputs, default_sink_index)
#         if current_app:
#             print(f"Playing: {current_app}")
#         else:
#             print("No audio playing")
#     else:
#         print("No default sink found")

# if __name__ == "__main__":
#     main()

# # print("Alag Asmaan Acoustic")