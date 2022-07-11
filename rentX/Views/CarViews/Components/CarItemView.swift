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
                    .foregroundColor(ThemeColors.TEXT_DETAIL)
                Text(car.model)
                    .foregroundColor(ThemeColors.TITLE)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(car.rent.period)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Text("R$\(car.rent.price)")
                            .foregroundColor(ThemeColors.MAIN)
                    }
                    
                    Spacer()
                    
                    Image(car.getAccessoryImage(accessoryType: car.fuelType))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(20)
            .frame(maxWidth: 140, maxHeight: .infinity)
            
            Spacer()
            
            ZStack {
                AsyncImage(
                    url: URL(string: car.thumb),
                    transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .transition(.scale(scale: 0.6, anchor: .center))
                    case .failure:
                        Image(systemName: "wifi.slash")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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
