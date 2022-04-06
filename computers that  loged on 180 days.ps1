 $time=[datetime]::Today.AddDays(-180)
 Get-ADComputer -Filter {LastLogonDate -gt $time } -prop *|select name,LastLogonDate | Export-Csv -Path c:\LastLogon180.csv 