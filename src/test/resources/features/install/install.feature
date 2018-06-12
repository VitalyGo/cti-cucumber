Feature: Validate Spok CTI Service - Spok CTI Client install

  Scenario: Validate Spok CTI Client files
    Given install directory ""
    Then validate files
    """
    {
      [
        { "File":"bin\\amcom_util.dll" }
        { "File":"bin\\amcom_crypt.dll" }
        { "File":"bin\\amcom_log.dll" }
        { "File":"bin\\amcom32.dll" }
        { "File":"bin\\libeay32.dll" }
        { "File":"bin\\ssleay32.dll" }
        { "File":"bin\\TAPI_device_info.exe" }
        { "File":"bin\\LUA Script Test.exe" }
        { "File":"bin\\" }
        { "File":"bin\\" }
        { "File":"bin\\" }

      ]
    }
    """


  Scenario: Validate registry settings
    Given feature ""
    Then validate registry settings
    """
    {
      [
        { "Root":"HKLM", "Key":"SOFTWARE\Amcom\Settings", "Value":"" }
      ]
    }
    """