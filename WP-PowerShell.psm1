# Copyright 2012 Eric Mann
# 

Function WP 
{
    <#
    .SYNOPSIS
        Main initializer of the WP CLI system.
    .DESCRIPTION
        Passes through commands to the WP CLI scripts.
    .EXAMPLE
        WP "home help"
        
        WP "home help" "c:\xampp\php"
        
        WP "home help" -cliPath "C:\xampp\php"
        
        WP -commands "home help" -cliPath "C:\xampp\php"
    #>
	param( 
        [string] $commands,
        [string] $cliPath
    )
	
	$scriptPath = Get-PathToCli $cliPath
    
    $cli = Join-Path $scriptPath \wp-cli\wp-cli-boot.php
    
    php $cli $commands
}

Function Get-PathToCli
{
    <#
    .SYNOPSIS
        Get the path to WP CLI.
    .DESCRIPTION
        Attempt to detect the path where WP CLI is installed by checking
        several known potential locations.
    .EXAMPLE
        Get-PathToCli
        
        Get-PathToCli "C:\xampp\htdocs\wp-cli\src\php"
    #>
    param(
        [string] $userPath
    )
    
    if ( $userPath -ne "" ) {
        return $userPath
    }
    
    $path = Join-Path $PSScriptRoot wp-cli\src\php -Resolve
    
    return $path
}