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
  set command to "" & {POSIX path of current_path} & "didit-cli-client/didit.rb \"" & {item N of completedTaskNames} & "\""
  do shell script command
end repeat