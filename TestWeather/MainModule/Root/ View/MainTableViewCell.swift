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
            //profileImageView.image = product?.productImage
            cityName.text = weatherCity?.name
            temperatureInTheCity.text = weatherCity?.condition
        }
    }
    //    private let profileImageView: UIImageView = {
    //        let imageView = UIImageView(frame: .zero)
    //        imageView.contentMode = .center
    //        return imageView
    //    }()
    
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
            cityName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cityName.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            temperatureInTheCity.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            temperatureInTheCity.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
