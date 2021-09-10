#!/usr/bin/env python

import time
import sys


from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


def usage():
    msg = '''
Usage: simple-test.py sleep-time chrome|firefox version-number

    Example: simple-test.py 10 chrome 91.0
'''
    print(msg)

### Process args
if len(sys.argv) != 4:
    print(len(sys.argv))
    print("Invalid number of arguments", file=sys.stderr)
    usage()
    sys.exit(1)

sleep_time = int(sys.argv[1])
browser = sys.argv[2]
version_number = str(sys.argv[3])


### Specify which browser I want to use
desired_cap = {
    'browserName': browser,
    'browserVersion': version_number,
    "selenoid:options": {
        "enableVNC": True,
        "enableVideo": False
    }
}

### Connect
driver = webdriver.Remote(
    command_executor='http://10.0.1.13:4444/wd/hub',
    desired_capabilities=desired_cap)

### Navigate to Wikipedia
driver.get("https://en.wikipedia.org/wiki/Main_Page")

time.sleep(sleep_time)

# Make sure the title bar sez Wikipedia
assert("Wikipedia" in driver.title)

### Type in a search term
elem = driver.find_element_by_name("search")
elem.send_keys("The IT Crowd")
time.sleep(7)

### Submit the search form
elem.submit()

### Give Tom time to catch up
time.sleep(sleep_time)

### Print the title of the resulting page
print (driver.title)

### Cleanup
driver.quit()
