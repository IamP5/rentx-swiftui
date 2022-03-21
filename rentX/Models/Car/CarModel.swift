//
//  CarModel.swift
//  rentX
//
//  Created by Bruno Gabriel on 18/03/22.
//

import Foundation

struct CarModel: Identifiable, Codable {
    var id: String
    var brand: String
    var model: String
    var about: String
    var rent: RentModel
    var fuelType: String
    var thumb: String
    var accessories: [AccessoryModel]
    var photos: [String]
    
    enum CodingKeys: String, CodingKey {
        case
            id,
            brand,
            model = "name",
            about,
            rent,
            fuelType = "fuel_type",
            thumb = "thumbnail",
            accessories,
            photos
    }
}
