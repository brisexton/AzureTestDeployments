Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration
Import-DscResource -ModuleName ComputerManagementDsc

Node $nodeName
  {
	TimeZone EST {
		IsSingleInstance = 'Yes'
		TimeZone = 'Eastern Standard Time'
	}
  }
}