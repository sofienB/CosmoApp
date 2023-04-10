//
//  BluetoothParcer.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 10/04/2023.
//

import CoreBluetooth

struct BluetoothParcer {
    
    var values: [[String]]! { convertValue() }
    
    init(characteristics: [CBCharacteristic]?) {
        self.characteristics = characteristics
    }
    
    // Private
    private var characteristics: [CBCharacteristic]?
    
    private func convertValue() -> [[String]] {
        var trams = [[String]]()
        
        guard let characteristics
        else { return trams }
        
        for characteristic in characteristics {
            if let values = characteristic.value {
                trams.append(values.hexEncodedString())
            }
        }
        
        return trams
    }
}

