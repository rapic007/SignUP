//
//  DayCell.swift
//  SignUp
//
//  Created by Влад  on 28.03.23.
//

import UIKit



class DayCell: UICollectionViewCell {
    
    private let dayNameLabel = UILabel()
    private let dayNumberLabel = UILabel()
    private let indicatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindCell(model: DayCellModel) {
        
        dayNumberLabel.text = "\(model.dayNumber)"
        dayNumberLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        
        dayNameLabel.text = "\(model.dayName)"
        dayNameLabel.textColor = UIColor(red: 0.62, green: 0.616, blue: 0.643, alpha: 1)
    }
    
    private func setup() {
        
        contentView.addSubview(dayNumberLabel)
        dayNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayNumberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dayNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(dayNameLabel)
        dayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayNameLabel.centerXAnchor.constraint(equalTo: dayNumberLabel.centerXAnchor),
            dayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        contentView.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.backgroundColor = .red
        indicatorView.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            indicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 10),
            indicatorView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
}
struct DayCellModel {
    let dayName: String
    let dayNumber: Int
}

struct WorkWithDate {
    
    static func getData(daysCount: Int) -> [DayCellModel] {
        var result = [DayCellModel]()
    
        
        let calendar = Calendar.current
        let today = Date()
    
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "E"
        
        let CurrentDay = calendar.date(byAdding: .day, value: 0, to: today)
        let dayInWeek = dateFormatter.string(from: CurrentDay!)

        let components = calendar.dateComponents([.day], from: CurrentDay!)
        let model = DayCellModel(dayName: dayInWeek, dayNumber: components.day ?? -1)
        result.append(model)
        
    
        for step in 1...daysCount {
            
            let newDatePlusDay = calendar.date(byAdding: .day, value: step, to: today)!
            let componentsPlus = calendar.dateComponents([.day], from: newDatePlusDay)
            let dayInWeek = dateFormatter.string(from: newDatePlusDay)
            let modelPLus = DayCellModel(dayName: dayInWeek, dayNumber: componentsPlus.day ?? -1)
            result.append(modelPLus)
            
            let newDateMinusDay = calendar.date(byAdding: .day, value: -step, to: today)!
            let componentsMinus = calendar.dateComponents([.day], from: newDateMinusDay)
            let dayInWeekMinus = dateFormatter.string(from: newDateMinusDay)
            let minusModel = DayCellModel(dayName: dayInWeekMinus, dayNumber: componentsMinus.day ?? -1)
            
            result.insert(minusModel, at: 0)
            
            
        }
        
        return result
    }
}
