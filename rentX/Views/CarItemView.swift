//
//  CarItemView.swift
//  rentX
//
//  Created by Bruno Gabriel on 10/03/22.
//

import SwiftUI

struct CarItemView: View {
    let car: CarModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(car.brand)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Text(car.model)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(car.rent.period)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Text("R$\(car.rent.price)")
                    }
                    
                    Text("I")
                        .padding(.horizontal, 10)
                }
            }
            .padding(20)
            
            Spacer()
            
            AsyncImage(url: URL(string: car.thumb))
                .imageScale(.small)
        }
        .frame(width: 340, height: 130)
        .background(.white)
        .cornerRadius(6)
    }
}

struct CarItemView_Previews: PreviewProvider {
    static var car1: CarModel = CarModel(id: "1", brand: "Audi", model: "R5 S Coupé", about: "blablabla", rent: RentModel(period: "Day", price: 250), fuelType: "gasosa", thumb: "https://storage.googleapis.com/golden-wind/ignite/react-native/thumbnails/1.png", accessories: [], photos: [])
    
    static var car2: CarModel = CarModel(id: "2", brand: "Porsche", model: "Panamera", about: "blablabla", rent: RentModel(period: "Day", price: 300), fuelType: "gasosa", thumb: "https://storage.googleapis.com/golden-wind/ignite/react-native/thumbnails/2.png", accessories: [], photos: [])
    
    static var previews: some View {
        Group {
            CarItemView(car: car1)
            CarItemView(car: car2)
        }
        .previewLayout(.sizeThatFits)
    }
}
