$containerName = 'bc165'
$credential = Get-Credential -Message 'Using UserPassword authentication. Please enter credentials for the container.'
$auth = 'UserPassword'
$artifactUrl = Get-BcArtifactUrl -type 'Sandbox' -version '16.5' -country 'ca' -select 'Latest'
$licenseFile = 'c:\navision\bc16-5.flf'
New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -imageName 'bc165image' `
    -assignPremiumPlan `
    -licenseFile $licenseFile `
    -memoryLimit 8G `
    -updateHosts `
    -includeAL
	
Setup-BcContainerTestUsers -containerName $containerName -Password $credential.Password -credential $credential
