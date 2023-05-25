import time
from splinter import Browser


browser = Browser()
browser.visit('http://localhost:59892/#/')   # should be replaced with the url of the code once run
time.sleep(30)                               # gives it time to launch
text = browser.find_by_text('Notes')         # is searching for the Notes button by the text displayed, returns a list of all elements that apply
name = browser.find_by_name('Notes')         # is searching for the Notes button by its name in the code, returns a list of all elements that apply
# these are the only applicable means that could be used to search for elements as other forms are looking for html tags

if text:                                     # checks if the list is empty
    print("button found")
elif name:                                   # checks if the list is empty
    print("button found")
else:
    print("no interactable elements found")
