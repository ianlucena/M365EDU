#Credencial para acesso dos módulos
$Credential = Get-Credential
Connect-AzureAD -Credential $Credential | out-null
Connect-MsolService -Credential $Credential 

Write-Host `n 

#Qual tenant está sendo verificado
Write-Host "O tenant " -ForegroundColor White -NoNewline; Write-Host (Get-AzureADTenantDetail | Select-Object -ExpandProperty DisplayName) -ForegroundColor Green -NoNewline; 
Write-Host "" [(Get-AzureADTenantDetail | Select-Object -Expand VerifiedDomains | Select-Object -ExpandProperty name -First 1)] -ForegroundColor Gray -NoNewline;
Write-Host " possui:" -ForegroundColor White -NoNewline; Write-Host `n 


#Contagem dos usuários
$users = (get-msoluser).Count
Write-Host "            $users usuários" `n

#Contagem dos grupos
$groups = (get-msolgroup).Count
Write-Host "            $groups grupos" `n

#Contagem dos dispositivos 
$devices = (get-msoldevice -all).Count
Write-Host "            $devices dispositivos" `n 

#Soma dos objetos
Write-Host Totalizando ($users + $groups + $devices) objetos `n -ForegroundColor Yellow -NoNewline
