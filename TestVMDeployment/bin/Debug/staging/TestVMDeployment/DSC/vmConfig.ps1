Configuration Main
{

Param ( [string] $nodeName )

	Import-DscResource -ModuleName PSDesiredStateConfiguration
	Import-DscResource -ModuleName ComputerManagementDsc
	Import-DscResource -ModuleName StorageDsc
	Import-DscResource -ModuleName xPendingReboot

Node $nodeName
  {
	  LocalConfigurationManager {
		  RebootNodeIfNeeded = $true
	}
	  xPendingReboot RB {
		  Name = 'Rebootit'
		  }
		# System Settings
		TimeZone EST {
			IsSingleInstance = 'Yes'
			TimeZone = 'Eastern Standard Time'
			DependsOn = '[xPendingReboot]RB'
		}

		# Baseline Folders
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

	OpticalDiskDriveLetter CDROM {
        DiskId = 1
        DriveLetter = 'Z'
        Ensure = 'Present'
        DependsOn = '[xPendingReboot]RB'
    }

	Disk DataDrive {
		  DiskId = '2'
		  DriveLetter = 'E'
		  FSFormat = 'NTFS'
		  FSLABEL = 'test'
		  PartitionStyle = 'GPT'
		DependsOn = "[OpticalDiskDriveLetter]CDROM"
	}

	WaitForVolume DataVolume {
		  DriveLetter = 'E'
		  RetryCount = 20
		  RetryIntervalSec = 20
		  DependsOn = '[Disk]DataDrive'
	  }

	  File NewFolder {
		DestinationPath = "E:\testfolder"
        Ensure = 'Present'
        Type = 'Directory'
        DependsOn = '[WaitForVolume]DataVolume'
	  }
  }
}