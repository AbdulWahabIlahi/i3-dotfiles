import numpy as np
from scipy.io.wavfile import write
from pydub import AudioSegment
from pydub.playback import play
import tempfile

# Define the DTMF frequencies
DTMF_FREQS = {
    '1': (697, 1209), '2': (697, 1336), '3': (697, 1477),
    '4': (770, 1209), '5': (770, 1336), '6': (770, 1477),
    '7': (852, 1209), '8': (852, 1336), '9': (852, 1477),
    '0': (941, 1336), '*': (941, 1209), '#': (941, 1477)
}

# Function to generate a DTMF tone
def generate_tone(frequencies, duration, sample_rate=44100):
    t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
    tone = np.sin(2 * np.pi * frequencies[0] * t) + np.sin(2 * np.pi * frequencies[1] * t)
    tone = (tone * 32767).astype(np.int16)  # Convert to 16-bit PCM
    return tone

# Sequence to dial
sequence = "99966688 277733 42999"

# Settings
tone_duration = 0.2  # Duration of each tone in seconds
pause_duration = 0.1  # Duration of pause between tones

# Create the full sequence
full_sequence = np.array([], dtype=np.int16)
for char in sequence:
    if char in DTMF_FREQS:
        tone = generate_tone(DTMF_FREQS[char], tone_duration)
        full_sequence = np.concatenate((full_sequence, tone))
        pause = np.zeros(int(44100 * pause_duration), dtype=np.int16)
        full_sequence = np.concatenate((full_sequence, pause))
    else:
        # Add a longer pause for spaces (simulate between numbers)
        pause = np.zeros(int(44100 * pause_duration * 2), dtype=np.int16)
        full_sequence = np.concatenate((full_sequence, pause))

# Write to WAV file in a temporary directory
with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as temp_wav_file:
    write(temp_wav_file.name, 44100, full_sequence)
    wav_file_path = temp_wav_file.name

# Convert WAV to MP3
audio = AudioSegment.from_wav(wav_file_path)
with tempfile.NamedTemporaryFile(delete=False, suffix=".mp3") as temp_mp3_file:
    audio.export(temp_mp3_file.name, format="mp3")
    mp3_file_path = temp_mp3_file.name

# Display the path to the generated MP3 file
print("MP3 file saved at:", mp3_file_path)
