//
//  jsonData.swift
//  CosmoAppTests
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

let deviceJSONAllKeys = """
  {
     "macAddress":"4921201e38d5",
     "model":"RIDE",
     "product":"RIDE",
     "firmwareVersion":"2.2.2",
     "serial":"BC892C9C-047D-8402-A9FD-7B2CC0048736",
     "installationMode":"helmet",
     "brakeLight":false,
     "lightMode":"OFF",
     "lightAuto":false,
     "lightValue":42
  }
"""

let deviceJSONSomeKeys = """
  {
     "macAddress":"4921201e38d5",
     "model":"RIDE",
     "firmwareVersion":"2.2.2",
     "brakeLight":false,
     "lightAuto":false,
     "lightValue":42
  }
"""
let deviceJSONMissingExpectedKeys = """
  {
     "model":"RIDE",
     "firmwareVersion":"2.2.2",
     "brakeLight":false,
     "lightAuto":false,
     "lightValue":42
  }
"""
let deviceJSONNoOptionalKeys = """
  {
     "macAddress":"4921201e38d5",
     "firmwareVersion":"2.2.2"

  }
"""
let devicesJSON = """
{
   "devices":[
      {
         "macAddress":"4921201e38d5",
         "model":"RIDE",
         "product":"RIDE",
         "firmwareVersion":"2.2.2",
         "serial":"BC892C9C-047D-8402-A9FD-7B2CC0048736",
         "installationMode":"helmet",
         "brakeLight":false,
         "lightMode":"OFF",
         "lightAuto":false,
         "lightValue":0
      },
      {
         "macAddress":"abfceb5c5ffd",
         "model":"RIDE",
         "product":"RIDE_LITE",
         "firmwareVersion":"2.4.4",
         "serial":"FBF827FE-94AE-0A16-37D1-1CA8420CFDA3",
         "installationMode":"helmet",
         "brakeLight":false,
         "lightMode":"BOTH",
         "lightAuto":true,
         "lightValue":25
      },
      {
         "macAddress":"bcfceb5c5gge",
         "model":"RIDE",
         "product":"RIDE",
         "firmwareVersion":"2.9.1",
         "serial":"GCG938GH-94AE-0A16-48E2-1CA8420CECZ2",
         "installationMode":"seat",
         "brakeLight":true,
         "lightMode":"WARNING",
         "lightAuto":false,
         "lightValue":50
      },
      {
         "macAddress":"C4711BD2-E11F-1A26-42B6-FB0C0FB74A41",
         "model":"VISION",
         "firmwareVersion":"v4.2.1b",
         "serial":"0000146001",
         "brakeLight":false,
         "lightMode":"OFF",
         "lightAuto":false,
         "lightValue":0
      },
      {
         "macAddress":"D1:7A:0E:EC:81:F6",
         "model":"RIDE",
         "product":"RIDE",
         "firmwareVersion":"2.6.1",
         "installationMode":"seat",
         "brakeLight":true,
         "lightMode":"POSITION",
         "lightAuto":true,
         "lightValue":75
      },
      {
         "macAddress":"D2:7B:0F:ED:82:F7",
         "model":"REMOTE",
         "product":"REMOTE_V1",
         "firmwareVersion":"1.3.1",
         "installationMode":"helmet",
         "brakeLight":false,
         "lightAuto":false,
         "lightValue":0
      }
   ]
}
"""
