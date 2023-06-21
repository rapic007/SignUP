import UIKit

class TaskCreateTimerCell: UITableViewCell, TaskCreateCell {
    let taskDurationLabel = CustomLabel()
    let hoursTextField = CustomTextField()
    let minutesTextField = CustomTextField()
    let secondsTextField = CustomTextField()

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
//        hoursTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    func setupCell() {
        
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        taskDurationLabel.setupLabel(size: 13)
        
        hoursTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        hoursTextField.placeholder = "0 час"
        
        minutesTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        minutesTextField.placeholder = "0 мин"
        
        secondsTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        secondsTextField.placeholder = "0 сек"
        
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
    @objc func textFieldChanged() {
//        model?.taskName = hoursTextField.text
    }
    

}
