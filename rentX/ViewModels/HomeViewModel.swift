//
//  HomeViewModel.swift
//  rentX
//
//  Created by Bruno Gabriel on 18/03/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var cars: [CarModel] = []
    
    init() {
        self.getCars()
    }
    
    func getCars() {
        CarService.shared.getCars { (result) in
            switch result {
                case.success(let carsData):
                    self.cars.append(contentsOf: carsData)
                    print(carsData)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
