$networkname = "also dingus"

$state = $(netsh wlan show interfaces | findstr "State") | Out-String
$notconnected = $state.Contains("disconnected") -or $state.Contains("authenticating") `
  -or $state.Contains("associating")

while ($notconnected) {
  netsh wlan connect $networkname
  Start-Sleep -s 4
  $state = $(netsh wlan show interfaces | findstr "State") | Out-String
  if ($state.Contains("associating")) {
    Start-Sleep -s 2
  }
  $state = $(netsh wlan show interfaces | findstr "State") | Out-String
  $notconnected = $state.Contains("disconnected") -or $state.Contains("authenticating") `
    -or $state.Contains("associating")
}