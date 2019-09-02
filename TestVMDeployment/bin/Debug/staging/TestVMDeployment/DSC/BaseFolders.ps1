Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
  {
		#Baseline Folders
        File AutomationFolder {
            DestinationPath = "C:\Automation"
            Ensure = 'Present'
            Type = 'Directory'
        }
        File AutoCredFolder {
            DestinationPath = "C:\Automation\credentials"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
        File AutoLogsFolder {
            DestinationPath = "C:\Automation\logs"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
        File AutoMachineConfigFolder {
            DestinationPath = "C:\Automation\machineconfig"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
        File AutoPSmodulesFolder {
            DestinationPath = "C:\Automation\psmodules"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
        File AutoResourcesFolder {
            DestinationPath = "C:\Automation\resources"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
        File AutoScriptsFolder {
            DestinationPath = "C:\Automation\scripts"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
        File AutoTempFolder {
            DestinationPath = "C:\Automation\temp"
            Ensure = 'Present'
            Type = 'Directory'
            DependsOn = '[File]AutomationFolder'
        }
  }
}