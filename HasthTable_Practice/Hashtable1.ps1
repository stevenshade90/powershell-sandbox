$users = @{
stevsh = 'Steve Shade';
timsh = 'Tim Shade';
jefsh = 'Jeff Shade';
}

Write-Host 'Here are your users:'
$users

[Bool]$torf = $users['stevsh'].Equals($users['timsh'])
Write-Host "Is Users[0] the same as Users[1]? => $torf"
$users.GetType().name