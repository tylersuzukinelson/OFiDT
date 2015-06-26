set endDate to current date
set startDate to endDate - (23 * hours) - (59 * minutes) - 59

set config_file to "CONFIG"
set api_token to ""
set team_name to ""
set lines_in_file to read config_file using delimiter {linefeed}
repeat with single_line in lines_in_file
  if length of single_line is greater than 0 then
    if (api_token is equal to "") then
      set api_token to single_line
    else if (team_name is equal to "") then
      set team_name to single_line
    else
      exit repeat
    end if
  end if
end repeat

tell application "OmniFocus"
  tell default document
    set completedTasks to a reference to flattened tasks where completion date >= startDate and completion date < endDate
    set completedTaskNames to name of completedTasks
  end tell
end tell

repeat with N from 1 to count of completedTaskNames
  set task_name to {item N of completedTaskNames} as string
  set clean_task_name to gsub(task_name, "\"", "'")
  set command to "curl -H \"Authorization: Token " & api_token & "\" --data \"raw_text=" & clean_task_name & "&team=" & team_name & "\" https://idonethis.com/api/v0.1/dones/"
  do shell script command
end repeat

on gsub(query, original, replacement)
  set AppleScript's text item delimiters to the original
  set the item_list to every text item of query
  set AppleScript's text item delimiters to the replacement
  set query to the item_list as string
  set AppleScript's text item delimiters to ""
  return query
end gsub