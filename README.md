# Configuration

In the same directory as ```ofidt.applescript```, create a file called ```CONFIG```. On the first line of this ```CONFIG``` file, please paste your iDoneThis API token (https://idonethis.com/api/token/). On the second line of this ```CONFIG``` file, please paste the name of the team to which you would like your Dones to be sent.

After the ```CONFIG``` file has been set up, you can run the script in your terminal using ```osascript ofidt.applescript```.

# Automation

If you would like to automate this script, set up a launch daemon to run the following:

    osascript /your/chosen/installation/path/OFiDT/ofidt.applescript

The included ```com.tylersuzukinelson.ofidt.plist``` file is an example launch daemon file you can use to run the script. Please make sure to change the path to the file in this file before you use it though!