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
    
    func getAccessoryImage(accessoryType: String) -> String {
        switch accessoryType {
            case "speed":
                return "speed"
            case "acceleration":
                return "acceleration"
            case "turning_diameter":
                return "force"
            case "gasoline_motor":
                return "gasoline"
            case "electric_motor":
                return "energy"
            case "hybrid_motor":
                return "hybrid"
            case "exchange":
                return "exchange"
            case "seats":
                return "people"
            default:
                return "car"
        }
    }
}
