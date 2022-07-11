//
//  CarService.swift
//  rentX
//
//  Created by Bruno Gabriel on 20/03/22.
//

import Foundation
import SwiftUI

class CarService {
    static let shared = CarService()
    
    var componentURL = URLComponents()
    
    init() {
        componentURL.scheme = "http"
        componentURL.host = "192.168.0.56"
        componentURL.port = 3333
    }
   
    func getCars(completion: @escaping (Result<[CarModel], Error>) -> Void) {
        
        componentURL.path = "/cars"
        
        guard let validURL = componentURL.url else {
            print("URL Creation failed")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            guard let carsData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let cars = try JSONDecoder().decode([CarModel].self, from: carsData)
                completion(.success(cars))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
            
        }.resume()
    }
}

