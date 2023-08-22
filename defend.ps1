iwr -UseBasicParsing https://my.cqu.edu.au/today
Install-Module -Name PSScriptAnalyser -Force
Invoke-ScriptAnalyzer defend.ps1
[System.Net.HttpWebRequest]::DefaultWebProxy = `New-Object System.Net.WebProxy("http://proxy",$true)
iwr -UseBasicParsing https://my.cqu.edu.au/today
[System.Net.HttpWebRequest]::DefaultWebProxy = `New-Object System.Net.WebProxy($null)
iwr -UseBasicParsing https://my.cqu.edu.au/today