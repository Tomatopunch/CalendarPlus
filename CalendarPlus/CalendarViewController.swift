//
//  CalendarViewController.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-22.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendarView: FSCalendar!
    
    @IBOutlet weak var UIImageIcon: UIImageView!
    @IBOutlet weak var UILabelWindDirection: UILabel!
    @IBOutlet weak var UILabelWindSpeed: UILabel!
    
    @IBOutlet weak var UILabelWeatherDescription: UILabel!
    
    @IBOutlet weak var UILabelPosition: UILabel!
    @IBOutlet weak var UILabelTemp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        calendarView.dataSource = self
        fetchJsonData()
    }
    
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
                    self.UILabelTemp.text = "\(temperature)°"
                    self.UILabelPosition.text = city
                    self.UILabelWindSpeed.text = "\(windSpeed) m/s"
                    self.UILabelWeatherDescription.text = weatherDescription
                    self.UIImageIcon.image = UIImage(named: icon)
                    
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            //end of running
        }.resume()
        

    }
    

    //MARK: - toTextualDescription
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



extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    // FSCalendarDelegate
    /*
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return "yeet"
    }
 *//*
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateSelected = Calendar.current.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: self.calendarView.currentPage)
        print(dateSelected)
        
        
    }
    */
  

}

