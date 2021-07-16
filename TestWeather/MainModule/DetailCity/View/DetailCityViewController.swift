//
//  DetailCityViewController.swift
//  TestWeather
//
//  Created by Oleg on 7/16/21.
//

import UIKit

class DetailCityViewController: UIViewController, DetailCityViewControllerViewProtocol {
    
    var presenter: DetailCityViewControllerPresenterProtocol?
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .center
        return imageView
    }()
    
    private let labelTemp: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelCondition: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
        addConstraints()
        setUpDescription()
    }
    
    private func addSubviews() {
        view.addSubview(labelCondition)
        view.addSubview(labelTemp)
        view.addSubview(weatherIcon)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            labelTemp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTemp.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            labelCondition.topAnchor.constraint(equalTo: labelTemp.bottomAnchor, constant: 10),
            labelCondition.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setUpDescription() {
        labelTemp.text = "\(presenter?.weatherCity?.temp ?? 0)˚C"
        labelCondition.text = "\((presenter?.weatherCity?.conditionString) ?? "")"
    }
}
