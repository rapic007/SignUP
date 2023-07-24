import UIKit

class TaskCreateTimerCell: UITableViewCell, TaskCreateCell {
    let taskDurationLabel = CustomLabel()
    let hoursTextField = CustomTextField()
    let minutesTextField = CustomTextField()
    let secondsTextField = CustomTextField()
    var time: (String, String, String) = ("", "", "")
    
    var model: TaskCreateTimerModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TaskCreateModel) {
        guard let model = model as? TaskCreateTimerModel else {
            return
        }
        
        self.model = model
        configureUI()
    }
    
    func configureUI() {

        taskDurationLabel.text = model?.title
        hoursTextField.addTarget(self, action: #selector(hoursTextFieldChanged), for: .editingChanged)
        minutesTextField.addTarget(self, action: #selector(minutesTextFieldChanged), for: .editingChanged)
        secondsTextField.addTarget(self, action: #selector(secondsTextFieldChanged), for: .editingChanged)
    }
    
    func setupCell() {
        
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        taskDurationLabel.setupLabel(size: 13)
        
        hoursTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        hoursTextField.placeholder = "0 час"
        hoursTextField.keyboardType = .numberPad
        hoursTextField.isCanPaste = false
        
        minutesTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        minutesTextField.placeholder = "0 мин"
        minutesTextField.keyboardType = .numberPad
        secondsTextField.isCanPaste = false
        
        secondsTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        secondsTextField.placeholder = "0 сек"
        secondsTextField.keyboardType = .numberPad
        secondsTextField.isCanPaste = false
        
        [taskDurationLabel, hoursTextField, minutesTextField, secondsTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
            
        }
        NSLayoutConstraint.activate([
            
            taskDurationLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            taskDurationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskDurationLabel.widthAnchor.constraint(equalToConstant: 209),
            

            hoursTextField.topAnchor.constraint(equalTo: taskDurationLabel.bottomAnchor, constant: 9),
            hoursTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hoursTextField.heightAnchor.constraint(equalToConstant: 44),
            hoursTextField.widthAnchor.constraint(equalToConstant: 85),
            hoursTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            minutesTextField.centerYAnchor.constraint(equalTo: hoursTextField.centerYAnchor),
            minutesTextField.leadingAnchor.constraint(equalTo: hoursTextField.trailingAnchor, constant: 12),
            minutesTextField.heightAnchor.constraint(equalToConstant: 44),
            minutesTextField.widthAnchor.constraint(equalToConstant: 85),
            
            secondsTextField.centerYAnchor.constraint(equalTo: hoursTextField.centerYAnchor),
            secondsTextField.leadingAnchor.constraint(equalTo: minutesTextField.trailingAnchor, constant: 12),
            secondsTextField.heightAnchor.constraint(equalToConstant: 44),
            secondsTextField.widthAnchor.constraint(equalToConstant: 85)
        ])
    }
    @objc
    func hoursTextFieldChanged() {
        guard let hoursString = hoursTextField.text else {
            return
        }
        guard let hoursInt = Int(hoursString) else {
            return
        }
        
        switch hoursInt {
        case 1..<23:
            time.0 = ("\(hoursInt) ч ")
        case 24..<Int.max:
            time.0 = "23 ч "
        default:
            time.0 = "0 ч "
        }
        let timeString = time.0 + time.1 + time.2
        model?.time = timeString
    }
    
    @objc
    func minutesTextFieldChanged() {
        
            guard let minutesString = minutesTextField.text else {
                return
            }
            guard let minutesInt = Int(minutesString) else {
                return
            }
            
            switch minutesInt {
            case 1..<60:
                time.1 = "\(minutesInt) мин "
            case 60..<Int.max:
                time.1 = "60 мин "
            default:
                time.1 = "0 мин "
            }
        let timeString = time.0 + time.1 + time.2
        model?.time = timeString
        }
    @objc
    func secondsTextFieldChanged() {
        guard let secondsString = secondsTextField.text else {
            return
        }
        guard let secondsInt = Int(secondsString) else {
            return
        }
        
        switch secondsInt {
        case 1..<60:
            time.2 = "\(secondsInt) сек"
        case 60..<Int.max:
            time.2 = "60 сек"
        default:
            time.2 = "0 сек"
        }
        let timeString = time.0 + time.1 + time.2
        model?.time = timeString
    }

}

