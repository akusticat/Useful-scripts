$time=[datetime]::Today.AddDays(-90)
$ADcomputers = Get-ADComputer -Filter {LastLogonDate -gt $time } -prop * #|select name,LastLogonDate |ft -auto

    foreach ($computer in $ADcomputers) {     
         
         $output = @{ 'ComputerName' = $comp }
         $output.UserName = (Get-WmiObject -Class win32_computersystem -ComputerName $computer.name).UserName
         [PSCustomObject]$output
         }

  
  $ADcomputers |select name,LastLogonDate | Export-Csv -Path c:\LastLogon.csv  
 
