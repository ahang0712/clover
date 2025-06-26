# output.py

from utils import write_file

def save_response(path, response, elapsed_time): # Save the response to a file
    write_file(path, response + f"\nElapsed Time: {elapsed_time} seconds\n", mode='a')
