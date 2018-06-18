Feature: Validate Spok CTI Service - Spok CTI Client install

  Scenario: Validate Spok CTI Client files
    Given install directory "C:\\Program Files (x86)\\Amcom"
    Given install items
    """
    [
      { "Type":"File","Location":"bin\\amcom_util.dll" },
      { "Type":"File","Location":"bin\\amcom_crypt.dll" },
      { "Type":"File","Location":"bin\\amcom_log.dll" },
      { "Type":"File","Location":"bin\\amcom32.dll" },
      { "Type":"File","Location":"bin\\cti_service_lib.dll" },
      { "Type":"File","Location":"bin\\libeay32.dll" },
      { "Type":"File","Location":"bin\\LUA Script Test.exe" },
      { "Type":"File","Location":"bin\\phone_server.exe" },
      { "Type":"File","Location":"bin\\spok_cti_service_trace.exe" },
      { "Type":"File","Location":"bin\\SpokCTIClient.lnk" },
      { "Type":"File","Location":"bin\\ssleay32.dll" },
      { "Type":"File","Location":"bin\\TAPI_device_info.exe" },
      { "Type":"File","Location":"bin\\LUA Script Test.exe" },
      { "Type":"File","Location":"bin\\TAPI_spy.exe" },
      { "Type":"File","Location":"bin\\tb20.exe" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\log4net.dll" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\Microsoft.Diagnostics.Tracing.EventSource.dll" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\Microsoft.Diagnostics.Tracing.EventSource.xml" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\PhoneButtonConfig.config" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\RabbitMQ.Client.dll" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\Spok_Connection.dll" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\Spok_CSTA2OAI.dll" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\SpokCTIClient.exe" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\SpokCTIClient.exe.config" },
      { "Type":"File","Location":"bin\\Spok CTI Client\\SpokCTIClientConfiguration.exe" },
      { "Type":"File","Location":"CTI_Service\\acd_function_script.lua" },
      { "Type":"File","Location":"CTI_Service\\agent_state_script.lua" },
      { "Type":"File","Location":"CTI_Service\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Avaya AES\\acd_function_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Avaya AES\\agent_state_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Avaya AES\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Cisco\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Dees CSI-380 (M5000 series phones)\\acd_function_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Dees CSI-380 (M5000 series phones)\\agent_state_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Dees CSI-380 (M5000 series phones)\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel CTIA (M3000 series phones)\\acd_function_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel CTIA (M3000 series phones)\\agent_state_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel CTIA (M3000 series phones)\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel M2250 Console\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel MCA (M2000 series phones)\\acd_function_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel MCA (M2000 series phones)\\agent_state_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Nortel MCA (M2000 series phones)\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Snom (Broadworks)\\app_specific_script.lua" },
      { "Type":"File","Location":"CTI_Service\\Lua Samples\\Snom (Interactive Intelligence)\\app_specific_script.lua" },
      { "Type":"File","Location":"Phone Server\\phone_server_aes.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_alcatel_call_model.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_alcatel_phone_model.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_cisco.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_csi380.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_dde.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_gen2cti.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_gen2cti_gencct.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_gen2cti_GenMitai.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_gencct.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_genmitai.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_m2250.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_mca.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_phone.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_siemens.cfg" },
      { "Type":"File","Location":"Phone Server\\phone_server_snom.cfg" }
    ]
    """
    Then validate files


  Scenario: Validate Spok CTI Client directories
    Given install directory "C:\Program Files (x86)\Amcom"
    Given install items
    """
    [
      { "Type":"Directory","Location":"bin" },
      { "Type":"Directory","Location":"bin\\Spok CTI Client" },
      { "Type":"Directory","Location":"CTI_Service" },
      { "Type":"Directory","Location":"Phone Server" },
      { "Type":"Directory","Location":"CTI_Service\\Trace" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Avaya AES" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Cisco" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Dees CSI-380 (M5000 series phones)" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Nortel CTIA (M3000 series phones)" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Nortel M2250 Console" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Nortel MCA (M2000 series phones)" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Snom (Broadworks)" },
      { "Type":"Directory","Location":"CTI_Service\\Lua Samples\\Snom (Interactive Intelligence)" },
      { "Type":"Directory","Location":"trace" }
    ]
    """
    Then validate directories



#  Scenario: Validate registry settings
#    Then validate registry settings
#    """
#    {
#      [
#        { "Root":"HKLM", "Key":"SOFTWARE\Amcom\Settings", "Value":"" }
#      ]
#    }
#    """