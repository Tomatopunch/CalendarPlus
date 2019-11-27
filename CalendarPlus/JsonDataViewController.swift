//
//  JsonDataViewController.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-23.
//  Copyright © 2019 Project_E. All rights reserved.
//
import Foundation
import UIKit


struct OpenWeatherAPI: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let pressure, humidity, tempMin: Int
    let tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}



class JsonDataViewController: UIViewController {
    
    @IBOutlet weak var UIImageIcon: UIImageView!
    @IBOutlet weak var UILabelWindDirection: UILabel!
    @IBOutlet weak var UILabelWindSpeed: UILabel!
    @IBOutlet weak var UILabelWeatherDescription: UILabel!
    @IBOutlet weak var UILabelPosition: UILabel!
    @IBOutlet weak var UILabelTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJsonData()
        
    
    }
    
    
    // MARK: - fetchJsonData
    // fetches jsonData from the openweather API.
    func fetchJsonData(){

        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?id=2702979&units=metric&appid=b735e62ad63a9bfca66220a9529e85a7"

        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error)  in

            if error != nil {
                print("Client error")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Status code not OK")
                return
            }
            // running the json data
            guard let data = data else { return }

            do {
                let weatherApi = try JSONDecoder().decode(OpenWeatherAPI.self, from: data)
    
        
                let windDirection = self.toTextualDescription(degree: Double(weatherApi.wind.deg))
                let windSpeed = weatherApi.wind.speed
                let temperature = weatherApi.main.temp
                let city = weatherApi.name
                let weatherDescription = weatherApi.weather[0].main
                let icon = weatherApi.weather[0].icon
                
                
                DispatchQueue.main.async {
                    self.UILabelWindDirection.text = windDirection
                    self.UILabelTemp.text = String(temperature)
                    self.UILabelPosition.text = city
                    self.UILabelWindSpeed.text = String(windSpeed)
                    self.UILabelWeatherDescription.text = weatherDescription
                    self.UIImageIcon.image = UIImage(named: icon)
                    
                }
                

            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }

            //end of running

        }.resume()
        

    }
    
    func setUILabel(weather: OpenWeatherAPI){
        
 
    }
    
    func toTextualDescription(degree: Double) -> String {
        var windDirection = "Degree out of boundry"
        if (degree > 337.5){
            windDirection = "Northerly"
            return windDirection
        }
        if (degree > 292.5) {
            windDirection = "North Westerly"
            return windDirection
        }
        if(degree > 247.5) {
            windDirection = "Westerly"
            return windDirection
        }
        if(degree > 202.5) {
            windDirection = "South Westerly"
            return windDirection
        }
        if(degree > 157.5) {
            windDirection = "Southerly"
            return windDirection
        }
        if(degree > 122.5) {
            windDirection = "South Easterly"
            return windDirection
        }
        if(degree > 67.5) {
            windDirection = "Easterly"
            return windDirection
        }
        if(degree > 22.5) {
            windDirection = "North Easterly"
            return windDirection
        }
        return windDirection
    }
}
