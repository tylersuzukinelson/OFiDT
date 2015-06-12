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
  end tell
end tell