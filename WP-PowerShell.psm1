# Copyright 2012 Eric Mann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
        
        WP "home help" "c:\tools\wp-cli" "c:\xampp\htdocs\wordpress"
              
        WP -commands "home help" -cliPath "C:\tools\wp-cli" -wpPath "C:\xampp\htdocs\wordpress"
    #>
	param( 
        [string[]] $commands,
        [string] $cliPath,
        [string] $wpPath = "C:\xampp\htdocs\wp-test"
    )
	
	$scriptPath = Get-PathToCli $cliPath
    
    $cli = Join-Path $scriptPath \wp-cli\wp-cli-boot.php
    
    $commandArray = $commands -split " "
       
    php $cli $commandArray --path=`"$wpPath`"
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