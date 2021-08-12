param (
    $UserEmail = $UserEmail,
    $UserName = $UserName,
    $CalendarArtifactPath = $CalendarArtifactPath,
    $CalendarRepoPath = $CalendarRepoPath,
    $CalendarRuleArtifactPath = $CalendarRuleArtifactPath,
    $CalendarRuleRepoPath = $CalendarRuleRepoPath     
)

Write-Host "CONFIGURE USER EMAIL AND USER NAME"

git config --global user.email "$($UserEmail)"
git config --global user.name "$($UserName)"

git checkout main

Write-Host "ADD CALENDARS"

git add $($CalendarArtifactPath)
git mv -f $($CalendarArtifactPath) $($CalendarRepoPath)
git commit -m "Calendar.xml committed to ImportDataConsoleApp"

Write-Host "ADD CALENDARRULES"

git add $($CalendarRuleArtifactPath)
git mv -f $($CalendarRuleArtifactPath) $($CalendarRuleRepoPath)
git commit -m "CalendarRule.xml committed to ImportDataConsoleApp"

Write-Host "PUSH CALENDARS AND CALENDARRULES"

git push origin main

Write-Host "CALENDAR AND CALENDAR RULE XML SUCCESSFULLY PUSHED IN ADO"