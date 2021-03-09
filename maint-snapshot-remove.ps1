#Connect to vcenter

Connect-VIServer -Server <YOUR VCENTER DNS ADDRESS>

$vms = Get-VM  | Get-Snapshot | select vm

 foreach ($vm in $vms) {
Get-VM | Get-Snapshot | Where-Object {$_.Created -lt (Get-Date)} | Remove-Snapshot -confirm:$false
}
