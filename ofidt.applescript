set endDate to current date
set startDate to endDate - (23 * hours) - (59 * minutes) - 59

tell application "Finder"
    set current_path to container of (path to me) as alias
end tell

tell application "OmniFocus"
  tell default document
    set completedTasks to a reference to flattened tasks where completion date >= startDate and completion date < endDate
    set completedTaskNames to name of completedTasks
  end tell
end tell

repeat with N from 1 to count of completedTaskNames
  set task_name to {item N of completedTaskNames} as string
  set clean_task_name to gsub(task_name, "\"", "'")
  set command to "$rvm_path/wrappers/OFiDT/ruby " & {POSIX path of current_path} & "didit-cli-client/didit.rb \"" & clean_task_name & "\""
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