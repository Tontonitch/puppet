class deepsecurityagent::params {
  $dsmconsoleaddress    = "app.deepsecurity.trendmicro.com"
  $dsmagentaddress      = "agents.deepsecurity.trendmicro.com"
  $dsmheartbeatport     = "443"
  $dsmconsoleport       = "443"
  $dsmtenantid          = ''
  $dsmtenantpassword    = ''
  $policyid             = ''

  case $::osfamily {
    'windows' : {
      $dsa_control      = '%ProgramFiles%/Trend Micro/Deep Security/dsa_control'
      $agentpackage = 'Trend Micro Deep Security Agent'
    }
    'AIX' : {
      $dsa_control      = '/opt/ds_agent/dsa_control'
      $agentpackage = 'ds_agent'
      $agentservice = 'ds_agent'
    }
    'RedHat' : {
      $dsa_control    = '/opt/ds_agent/dsa_control'
      $agentpackage = 'ds_agent'
      $agentservice = 'ds_agent'
    }
    'Debian' : {
      $dsa_control    = '/opt/ds_agent/dsa_control'
      $agentpackage = 'ds-agent'
      $agentservice = 'ds_agent'
    }
    #prior to facter 1.7, facter returns 'Linux' for ::osfamily on amazon linux
    'Linux' : {
      case $::operatingsystem {
         'Amazon': {
            $dsa_control    = '/opt/ds_agent/dsa_control'
            $agentpackage = 'ds_agent'
            $agentservice = 'ds_agent'
	 }
      }
    }
  }
}
