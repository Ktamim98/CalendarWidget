//
//  WeatherService.swift
//  WeatherWidgetExtension
//
//  Created by Tamim Khan on 13/7/23.
//

import SwiftUI


class WeatherService{
    let url = URL(string: "https://api.lil.software/weather?latitude=37.7569385&longitude=-122.4733143")!
    
    
    func getWeather(completion: @escaping (Result<[Weather], Error>) -> Void){
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            completion(.success(self.getWeatherResponse(fromData: data!)))
        }.resume()
    }
    
    private func getWeatherResponse(fromData data: Data) -> [Weather]{
        let weatherData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        if let weatherD = weatherData{
            return weatherD.forecast
        }
        return [Weather(name: "error", temperature: 0, unit: "", description: "Error")]
    }
}
