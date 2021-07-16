//
//  MainTableViewCell.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var weatherCity : WeatherModel? {
        didSet {
            guard let weatherCity = weatherCity else { return }
            cityName.text = weatherCity.name
            temperatureInTheCity.text = "\(weatherCity.temp)˚C"
        }
    }
    
    let cityName: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    let temperatureInTheCity: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(cityName)
        contentView.addSubview(temperatureInTheCity)
    }
    
    private func setupLayouts() {
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperatureInTheCity.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout constraints for `cityName` and `temperatureInTheCity`
        NSLayoutConstraint.activate([
            cityName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            cityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            
            temperatureInTheCity.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            temperatureInTheCity.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35)
        ])
    }
}
