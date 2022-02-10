#!/usr/bin/env python

import time
import sys
import os


from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


def usage():
    msg = '''
Usage: simple-test.py sleep-time chrome|firefox|MicrosoftEdge version-number hub-url

    Example: simple-test.py 10 chrome 91.0 'http://my-server:4444/wd/hub'
'''
    print(msg)

def browser_log(msg, browser, version_number):
    print(f"{os.getpid()}::{browser}:{version_number} - {msg}")

### Process args
if len(sys.argv) != 5:
    print(len(sys.argv))
    print("Invalid number of arguments", file=sys.stderr)
    usage()
    sys.exit(1)

sleep_time = int(sys.argv[1])
browser = sys.argv[2]
version_number = str(sys.argv[3])
hub_url = str(sys.argv[4])


### Specify which browser I want to use
desired_cap = {
    'browserName': browser,
    'browserVersion': version_number,
    "selenoid:options": {
        "enableVNC": True,
        "enableVideo": True
    }
}

### Connect
driver = webdriver.Remote(
    command_executor=hub_url,
    desired_capabilities=desired_cap)

browser_log("Navigate to Wikipedia", browser, version_number)
driver.get("https://en.wikipedia.org/wiki/Main_Page")

time.sleep(sleep_time)

browser_log("Make sure the title bar sez Wikipedia", browser, version_number)
assert "Wikipedia" in driver.title

browser_log("Type in a search term", browser, version_number)
elem = driver.find_element_by_name("search")
elem.send_keys("The IT Crowd")
time.sleep(7)

browser_log("Submit the search form", browser, version_number)
elem.submit()

browser_log("Give you time to catch up", browser, version_number)
time.sleep(sleep_time)

browser_log("Assert the title of the resulting page", browser, version_number)
assert "The IT Crowd - Wikipedia" in driver.title

browser_log("Cleanup", browser, version_number)
driver.quit()
