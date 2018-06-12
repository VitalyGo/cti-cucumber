Feature: CTI Spok Manager Service

  Scenario: Validate Spok Query service settings
    Given reset "query" config
    Given cti config
    """
    {
      "ClusterConfiguration": {
          "hosts": [{
              "Host": "aut-ctisrv2",
              "SSSN": "aut-ctisrv2",
              "Delay": 60
          }],
          "Name": "Spok-Careconnect-CTI",
          "Delay": 60,
          "RL": true,
          "SSDir": "%ProgramData%\\Spok",
          "SSLog": "SpokCTI.log",
          "SQDir": "%ProgramData%\\Spok",
          "SQLog": "SpokSystemQueryService.log"
      },
      "ServerServiceConfiguration": {
          "Type": "MOCKNEC",
          "Connect": true,
          "IP": "127.0.0.1",
          "Port": 60300,
          "Timeout": 5000,
          "ISC": {
              "NEC_LMC_IP": "",
              "NEC_LMC_PORT": ""
          }
      },
      "SystemQueryServiceConfiguration": {
          "Port": 5672,
          "Queue": "0.0",
          "Interval": 10,
          "Type": "RabbitMQ",
          "LBIP": "127.0.0.1"
      }
    }
    """
    When send cti config
    Then validate "query" config

  Scenario: Validate Spok CTI Server service settings
    Given reset "cti-server" config
    Given cti config
      """
      {
        "ClusterConfiguration": {
            "hosts": [{
                "Host": "aut-ctisrv2",
                "SSSN": "aut-ctisrv2",
                "Delay": 60
            }],
            "Name": "Spok-Careconnect-CTI",
            "Delay": 60,
            "RL": true,
            "SSDir": "%ProgramData%\\Spok",
            "SSLog": "SpokCTI.log",
            "SQDir": "%ProgramData%\\Spok",
            "SQLog": "SpokSystemQueryService.log"
        },
        "ServerServiceConfiguration": {
            "Type": "MOCKNEC",
            "Connect": true,
            "IP": "127.0.0.1",
            "Port": 60300,
            "Timeout": 5000,
            "ISC": {
                "NEC_LMC_IP": "",
                "NEC_LMC_PORT": ""
            }
        },
        "SystemQueryServiceConfiguration": {
            "Port": 5672,
            "Queue": "0.0",
            "Interval": 10,
            "Type": "RabbitMQ",
            "LBIP": "127.0.0.1"
        }
      }
      """
    When send cti config
    Then validate "cti-server" config

  Scenario: Validate Consul Settings
    Given reset "consul" config
    Given cti config
    """
    {
      "ClusterConfiguration": {
          "hosts": [{
              "Host": "aut-ctisrv2",
              "SSSN": "aut-ctisrv2",
              "Delay": 60
          }],
          "Name": "Spok-Careconnect-CTI",
          "Delay": 60,
          "RL": true,
          "SSDir": "%ProgramData%\\Spok",
          "SSLog": "SpokCTI.log",
          "SQDir": "%ProgramData%\\Spok",
          "SQLog": "SpokSystemQueryService.log"
      },
      "ServerServiceConfiguration": {
          "Type": "MOCKNEC",
          "Connect": true,
          "IP": "127.0.0.1",
          "Port": 60300,
          "Timeout": 5000,
          "ISC": {
              "NEC_LMC_IP": "",
              "NEC_LMC_PORT": ""
          }
      },
      "SystemQueryServiceConfiguration": {
          "Port": 5672,
          "Queue": "0.0",
          "Interval": 10,
          "Type": "RabbitMQ",
          "LBIP": "127.0.0.1"
      }
    }
    """
    When send cti config
    Then validate "consul" config

  Scenario: Validate LMC IP and LMC Port
    Given cti config
    """
    {
      "ClusterConfiguration": {
          "Hosts": [{
              "Host": "aut-ctisrv2",
              "SSSN": "aut-ctisrv2",
              "Delay": 60
          }],
          "Name": "Spok-Careconnect-CTI",
          "Delay": 60,
          "RL": true,
          "SSDir": "%ProgramData%\\Spok",
          "SSLog": "SpokCTI.log",
          "SQDir": "%ProgramData%\\Spok",
          "SQLog": "SpokSystemQueryService.log"
      },
      "ServerServiceConfiguration": {
          "Type": "NEC",
          "Connect": true,
          "IP": "127.0.0.1",
          "Port": 60300,
          "Timeout": 5000,
          "ISC": {
              "NEC_LMC_IP": "[LMC_IP]",
              "NEC_LMC_PORT": "[LMC_Port]"
          }
      },
      "SystemQueryServiceConfiguration": {
          "Port": 5672,
          "Queue": "0.0",
          "Interval": 10,
          "Type": "RabbitMQ",
          "LBIP": "127.0.0.1"
      }
    }
    """
    When send cti config
    Then validate LMC registry address and port

  Scenario: Answer call and hangup
  Given somehting
  When make call to "34333"
  Then cti service answer

#  Scenario: Validate Consul is running
#    Then validate "Consul" is "Running"
#
#  Scenario: Validate Spok System Query Service is running
#    Then validate "SpokSystemQueryService" is "Running"
#
#  Scenario: Validate Spok CTI Server service is running
#    Then validate "SpokCTIServerService" is "Running"