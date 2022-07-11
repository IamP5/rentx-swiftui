//
//  ScheduleView.swift
//  rentX
//
//  Created by Bruno Gabriel on 08/04/22.
//

import SwiftUI

struct ScheduleView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedDate: Date = Date()
    var todayDate = Date()
    
    let car: CarModel
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Button(
                    action: {
                        presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                )
        
                Text("Escolha uma \ndata de início e \nfim do aluguel")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 40)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("DE")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(ThemeColors.TEXT_DETAIL)
                        
                        
                        Text(self.selectedDate.formatted(date: .numeric, time: .omitted))
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
    
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(ThemeColors.TEXT_DETAIL)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("ATÉ")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(ThemeColors.TEXT_DETAIL)
                        
                        Text("18/06/2022")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
            .offset(y: -10)
            .padding(.horizontal, 30)
            .background(ThemeColors.BACKGROUND_SECONDARY)
            
            VStack {
                DatePicker(
                    "calendar",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                    .datePickerStyle(.graphical)
                    .padding()
                    .accentColor(ThemeColors.MAIN)
                
                NavigationLink(destination: HomeView(), label: {
                    Text("Confirmar")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(ThemeColors.MAIN)
                        .cornerRadius(12)
                })
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ScheduleView_Previews: PreviewProvider {
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
        NavigationView {
            ScheduleView(car: car)
        }
    }
}
