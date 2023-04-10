import UIKit
import Foundation

typealias Bits = [UInt8]

var vBits = [UInt8]()
vBits = [1, 3, 54, 243]

var characteristics: Data? = Data(vBits)

private func convertValue() -> [Bits] {
    var trams = [Bits]()
    
   // guard let characteristics
   // else { return trams }
    
    if let values = characteristics {
        trams.append(Bits(values))
    }

    
    return trams
}

extension Data {
    func hexEncodedString() -> [String] {
        return map { String(format: "%02X", $0).uppercased() }
    }
}


print(convertValue())
print(characteristics?.hexEncodedString())
