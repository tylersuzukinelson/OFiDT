# Configuration

In the same directory as ```ofidt.applescript```, create a file called ```CONFIG```. On the first line of this ```CONFIG``` file, please paste your iDoneThis API token (https://idonethis.com/api/token/). On the second line of this ```CONFIG``` file, please paste the name of the team to which you would like your Dones to be sent.

After the ```CONFIG``` file has been set up, you can run the script in your terminal using ```osascript ofidt.applescript```.

# Automation

I use crontab to automatically run this script at 6 PM every day. To do the same, add the following to your crontab (```crontab -e```):

  00 18 * * * osascript /path/to/your/ofidt/folder/ofidt.applescript