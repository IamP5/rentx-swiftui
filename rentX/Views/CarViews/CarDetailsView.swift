//
//  CarDetailsView.swift
//  rentX
//
//  Created by Bruno Gabriel on 27/03/22.
//

import SwiftUI

struct CarDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCarImage: Int = 0
    
    let car: CarModel
    let columns: [GridItem] = [
        GridItem(.fixed(110)),
        GridItem(.fixed(110)),
        GridItem(.fixed(110))
    ]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(
                        action: {
                            presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                    )
                    
                    Spacer()
                    
                    ForEach(car.photos.indices) { index in
                        Circle()
                            .fill(.black.opacity(index == selectedCarImage ? 1 : 0.3))
                            .frame(width: 10, height: 6)
                    }
                }
                .padding(.horizontal, 32)
            }
            .frame(maxHeight: 20, alignment: .top)
            .padding(.top)
            .background(.white)
            
            VStack {
                ZStack {
                    TabView(selection: $selectedCarImage) {
                        ForEach(0..<car.photos.count, id: \.self) { url in
                            AsyncImage(
                                url: URL(string: car.photos[url]),
                                transaction: Transaction(animation: .easeInOut)
                            ) { phase in
                            switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .transition(.scale(scale: 0.4, anchor: .center))
                                case .failure:
                                    Image(systemName: "wifi.slash")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                    .tabViewStyle(.page)
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(car.brand)
                            .font(.system(size: 14))
                            
                        Text(car.model)
                            .font(.system(size: 24, weight: .medium))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(car.rent.period)
                            .font(.system(size: 14))
                            
                        Text("R$ \(car.rent.price)")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: 260, alignment: .top)
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(car.accessories.indices) { index in
                        VStack {
                            Image(car.getAccessoryImage(accessoryType: car.accessories[index].type))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28, height: 28)
                                .colorMultiply(.black)
                            
                            Text(car.accessories[index].name)
                        }
                    }
                    .frame(width: 110, height: 92)
                    .background(ThemeColors.LINE)
                }
                .frame(maxWidth: .infinity, maxHeight: 192, alignment: .top)
                .padding(.top)
                
                Text(car.about)
                    .padding(.vertical)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            
            
            
            VStack(alignment: .center) {
                NavigationLink(destination: ScheduleView(car: car), label: {
                    Text("Escolher período do aluguel")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(ThemeColors.MAIN)
                        .cornerRadius(12)
                })
                    .frame(width: 327, height: 56)
                    .navigationTitle("")
                    .navigationBarHidden(true)
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .top)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func handleConfirm() {
        
    }
}

struct CarDetailsView_Previews: PreviewProvider {
    static var car: CarModel = CarModel(
        id: "1",
        brand: "Audi",
        model: "R5 S Coupé",
        about: "Este é automóvel desportivo. Surgiu do lendário touro de lide indultado na praça Real Maestranza de Sevilla. É um belíssimo carro para quem gosta de acelerar.",
        rent: RentModel(period: "Ao dia", price: 250),
        fuelType: "gasosa",
        thumb: "https://storage.googleapis.com/golden-wind/ignite/react-native/thumbnails/1.png",
        accessories: [
            AccessoryModel(type: "speed", name: "250km/h"),
            AccessoryModel(type: "acceleration", name: "3.8s"),
            AccessoryModel(type: "turning_diameter", name: "800 HP"),
            AccessoryModel(type: "electric_motor", name: "Elétrico"),
            AccessoryModel(type: "exchange", name: "Auto"),
            AccessoryModel(type: "seats", name: "5 pessoas")
        ],
        photos: [
            "https://storage.googleapis.com/golden-wind/ignite/react-native/images/1.png",
            "https://storage.googleapis.com/golden-wind/ignite/react-native/images/2.png",
            "https://storage.googleapis.com/golden-wind/ignite/react-native/images/3.png"
        ])
    
    static var previews: some View {
        CarDetailsView(car: car)
    }
}
