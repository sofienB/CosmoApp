//
//  CardView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import SwiftUI

struct CardView: View {
    let device: Device
    let imageName: String
    //let cardViewModel: CardViewModel

    var body: some View {
        VStack() {
            Image(imageName)
                .resizable()
                .scaledToFill()
                //.frame(width: 120.0, height: 100.0)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 80)
                .clipped()
            Text(device.product ?? device.model.rawValue)
                .font(.custom("Avenir", size: 16))
                .fontWeight(.bold)
                .padding(.bottom,11)
        }
        .background(.quaternary)
        .cornerRadius(10)
        .foregroundColor(.blue)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let device = Device(macAddress: "F3E1F23D4D",
                            firmwareVersion: "1.2.4",
                            product: "Ride")
        
        CardView(device: device,
                 imageName: "ride")
            .previewLayout(.fixed(width: 100, height: 120))
    }
}
