$Credential = Get-Credential
Connect-AzureAD -Credential $Credential | out-null
Connect-MsolService -Credential $Credential 

Write-Host `n 

Write-Host "O tenant " -ForegroundColor White -NoNewline; Write-Host (Get-AzureADTenantDetail | Select-Object -ExpandProperty DisplayName) -ForegroundColor Green -NoNewline; Write-Host "" [(Get-AzureADTenantDetail | Select-Object -Expand VerifiedDomains | Select-Object -ExpandProperty name -First 1)] -ForegroundColor Gray -NoNewline; Write-Host " possui:" -ForegroundColor White -NoNewline; Write-Host `n 

#Para realizar a contagem de usuário
$users = (get-msoluser).Count
Write-Host "            $users usuários" `n

#Para realizar a contagem de grupos
$groups = (get-msolgroup).Count
Write-Host "            $groups grupos" `n

#Para realizar a contagem de dispositivos 
$devices = (get-msoldevice -all).Count
Write-Host "            $devices dispositivos" `n 

#Soma dos objetos encontrados
Write-Host Totalizando ($users + $groups + $devices) objetos `n -ForegroundColor Yellow -NoNewline