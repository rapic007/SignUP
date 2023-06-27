import UIKit

class TaskScreenTableCell: UITableViewCell {
    let view = UIView()
    let nameLabel = CustomLabel()
    let image = UIImageView()
    let timerLabel = CustomLabel()
    let taskInfoLabel = CustomLabel()
    
//    var timerState = true
//    var timer: Timer?
//    var tick = 0
//    var updateLabel : ((String) -> Void)? 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        timerLabel.text = ""
        updateTick(tick: 0)
    }
    
    func setupCell() {
        contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        contentView.addSubview(view)
        
        view.addSubview(nameLabel)
        view.addSubview(image)
        view.addSubview(timerLabel)
        view.addSubview(taskInfoLabel)
        taskInfoLabel.text = "24x 60m 60c"
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        
        nameLabel.setupLabel(size: 15)
        timerLabel.setupLabel(size: 20)
        taskInfoLabel.setupLabel(size: 13)
        
        [nameLabel, view, image, timerLabel, taskInfoLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20 ),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            view.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 14),
            nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.rightAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: -16),
            image.leftAnchor.constraint(equalTo: view.leftAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            timerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            
            taskInfoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            taskInfoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -11),
            taskInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142),
            taskInfoLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
extension TaskScreenTableCell {
    func updateTick(tick: Int) {
        let time = secondsToHoursMinutesSeconds(seconds: tick)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        if tick != 0 {
            timerLabel.text = timeString
        }
    }

    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }

    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

