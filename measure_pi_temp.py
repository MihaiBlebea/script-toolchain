import subprocess
import re
from time import sleep
import sys

def measure():
    regex = r"[0-9]*\.[0-9]*"
    res = subprocess.check_output("/opt/vc/bin/vcgencmd measure_temp", shell = True)
    match = re.findall(regex, str(res))[0]
    return float(match)
    
def print_watch(output):
    sys.stdout.write("\rtemp is {}°C".format(output))
    sys.stdout.flush()


if __name__ == "__main__":
    if len(sys.argv) == 1:
        seconds = 10
    else:
        seconds = int(sys.argv[1])

    while True:
        temp = measure()
        print_watch(temp)
        sleep(seconds)