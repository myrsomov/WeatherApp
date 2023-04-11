//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Myroslav Somov on 22/2/23.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feels_like
                            .roundDouble() + "°")
                        .font(.system(size:100))
                        .fontWeight(.bold)
                        .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://provinciadealicante.es/wp-content/uploads/2020/06/El-Campello.jpg"))
                    { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                            .cornerRadius(12)

                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.777, brightness: 0.355))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.577, brightness: 0.555))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
