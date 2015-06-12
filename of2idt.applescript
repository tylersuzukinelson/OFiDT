set startDate to current date
set hours of startDate to 0
set minutes of startDate to 0
set seconds of startDate to 0
set endDate to startDate + (23 * hours) + (59 * minutes) + 59

tell application "OmniFocus"
  tell default document
    set completedTasks to a reference to flattened tasks where completion date >= startDate and completion date < endDate
    log count of completedTasks
    set {completedTaskNames} to {name} of completedTasks
    log completedTaskNames
    repeat with N from 1 to count of completedTaskNames
      set command to "./didit-cli-client/didit.rb \"" & {item N of completedTaskNames} & "\""
      do shell script command
    end repeat
  end tell
end tell