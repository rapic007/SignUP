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
        
        var indicatorColor: UIColor
        
        switch model.status {
        case .today:
            indicatorColor = .yellow
        case .failed:
            indicatorColor = .red
        case .success:
            indicatorColor = .green
        case .future:
            indicatorColor = .clear
        }
        indicatorView.backgroundColor = indicatorColor
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
        indicatorView.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            indicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 10),
            indicatorView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
}

