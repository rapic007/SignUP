import UIKit

class CreatingTaskCell: UITableViewCell {
    
    let everyDayButton = UIButton()
    let onWeekdaysButton = UIButton()
    let monthlyButton = UIButton()
    let everyYearButton = UIButton()
    let onceButton = UIButton()
    let chooseDayButton = UIButton()
    
    let startDatePicker = UIDatePicker()
    let startTextField = CustomTextField()
    
    let finishDatePicker = UIDatePicker()
    let finishTextField = CustomTextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupCell() {
        
        let textField = CustomTextField()
        
        textField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        textField.placeholder = "Например, сделать зарядку"
        textField.backgroundColor = .white
        
        let taskNameLabel = UILabel()
        createLabel(taskNameLabel, text: "Название задачи")
        
        let repeatingPeriodLabel = UILabel()
        createLabel(repeatingPeriodLabel, text: "Переодичность выполнения")
        
        let everyDayView = UIView()
        createSmallView(everyDayView, addLabel: UILabel(), addButton: everyDayButton, text: "Ежедневно")
        buttonPressed(button: everyDayButton)
        
        let onWeekdaysView = UIView()
        createSmallView(onWeekdaysView, addLabel: UILabel(), addButton: onWeekdaysButton, text: "По будням")
        buttonPressed(button: onWeekdaysButton)
  
        let monthlyView = UIView()
        createSmallView(monthlyView, addLabel: UILabel(), addButton: monthlyButton, text: "Ежемесячно")
        buttonPressed(button: monthlyButton)
        
        let everyYearView = UIView()
        createSmallView(everyYearView, addLabel: UILabel(), addButton: everyYearButton, text: "Ежегодно")
        buttonPressed(button: everyYearButton)
        
        let onceView = UIView()
        createSmallView(onceView, addLabel: UILabel(), addButton: onceButton, text: "Один раз")
        buttonPressed(button: onceButton)
        
        let chooseDayView = UIView()
        createSmallView(chooseDayView, addLabel: UILabel(), addButton: chooseDayButton, text: "Выбрать дни недели")
        buttonPressed(button: chooseDayButton)
        
        let startLabel = UILabel()
        createLabel(startLabel, text: "Начало выполнения")
        
        let finishLabel = UILabel()
        createLabel(finishLabel, text: "Конец выполнения")
        
        startDatePicker.preferredDatePickerStyle = .wheels
        startDatePicker.datePickerMode = .date
        startDatePicker.backgroundColor = .white
        
        let startDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(startDoneTapped))
        startDoneButton.tintColor = .darkGray
        
        let startToolBar = UIToolbar()
        startToolBar.sizeToFit()
        startToolBar.setItems([startDoneButton], animated: true)
        
        setupTextField(textFieldName: startTextField, inputView: startDatePicker, toolBar: startToolBar )
        
        finishDatePicker.preferredDatePickerStyle = .wheels
        finishDatePicker.datePickerMode = .date
        finishDatePicker.backgroundColor = .white
        
        let finishDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(finishDoneTapped))
        finishDoneButton.tintColor = .darkGray
        
        let finishToolBar = UIToolbar()
        finishToolBar.sizeToFit()
        finishToolBar.setItems([finishDoneButton], animated: true)
        
        setupTextField(textFieldName: finishTextField, inputView: finishDatePicker, toolBar: finishToolBar)
        
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        [textField, taskNameLabel, repeatingPeriodLabel, everyDayView, onWeekdaysView, monthlyView, everyYearView,
         onceView, chooseDayView, startLabel, finishLabel, startTextField, finishTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            taskNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskNameLabel.widthAnchor.constraint(equalToConstant: 102),
            
            textField.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 9),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            repeatingPeriodLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32),
            repeatingPeriodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            repeatingPeriodLabel.widthAnchor.constraint(equalToConstant: 295),
            
            everyDayView.topAnchor.constraint(equalTo: repeatingPeriodLabel.bottomAnchor, constant: 13),
            everyDayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            everyDayView.heightAnchor.constraint(equalToConstant: 35),
            everyDayView.widthAnchor.constraint(equalToConstant: 128),
            
            onWeekdaysView.leadingAnchor.constraint(equalTo: everyDayView.trailingAnchor, constant: 12),
            onWeekdaysView.centerYAnchor.constraint(equalTo: everyDayView.centerYAnchor),
            onWeekdaysView.heightAnchor.constraint(equalToConstant: 35),
            onWeekdaysView.widthAnchor.constraint(equalToConstant: 124),
            
            monthlyView.topAnchor.constraint(equalTo: everyDayView.bottomAnchor, constant: 9),
            monthlyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            monthlyView.widthAnchor.constraint(equalToConstant: 135),
            monthlyView.heightAnchor.constraint(equalToConstant: 35),
            
            everyYearView.centerYAnchor.constraint(equalTo: monthlyView.centerYAnchor),
            everyYearView.centerXAnchor.constraint(equalTo: onWeekdaysView.centerXAnchor),
            everyYearView.widthAnchor.constraint(equalToConstant: 118),
            everyYearView.heightAnchor.constraint(equalToConstant: 35),
            
            onceView.topAnchor.constraint(equalTo: monthlyView.bottomAnchor, constant: 9),
            onceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            onceView.widthAnchor.constraint(equalToConstant: 114),
            onceView.heightAnchor.constraint(equalToConstant: 35),
            
            chooseDayView.leadingAnchor.constraint(equalTo: onceView.trailingAnchor, constant: 12),
            chooseDayView.centerYAnchor.constraint(equalTo: onceView.centerYAnchor),
            chooseDayView.widthAnchor.constraint(equalToConstant: 194),
            chooseDayView.heightAnchor.constraint(equalToConstant: 35),
            
            startLabel.topAnchor.constraint(equalTo: onceView.bottomAnchor, constant: 32),
            startLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            finishLabel.leadingAnchor.constraint(equalTo: startLabel.trailingAnchor, constant: 51),
            finishLabel.topAnchor.constraint(equalTo: chooseDayView.bottomAnchor, constant: 32),
            
            
            startTextField.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 9),
            startTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            startTextField.widthAnchor.constraint(equalToConstant: 158),
            startTextField.heightAnchor.constraint(equalToConstant: 44),
            
            finishTextField.topAnchor.constraint(equalTo: finishLabel.bottomAnchor,constant: 9),
            finishTextField.leadingAnchor.constraint(equalTo: startTextField.trailingAnchor, constant: 16),
            finishTextField.widthAnchor.constraint(equalToConstant: 158),
            finishTextField.heightAnchor.constraint(equalToConstant: 44),
            
            everyDayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1600),
        ])
    }
    
    func createLabel(_ label: UILabel, text: String) {
        label.font = UIFont(name: "lato-regular", size: 13)
        label.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        label.text = text
    }
    
    func createSmallView(_ view: UIView, addLabel: UILabel, addButton: UIButton, text: String) {
        
        addLabel.text = text
        addLabel.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        addLabel.font = UIFont(name: "lato-regular", size: 15)
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        addButton.setImage(UIImage(named: "emptyButton"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.addSubview(addLabel)
        view.addSubview(addButton)
        
      
        NSLayoutConstraint.activate([
            
            addLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            addLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            addLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 7),
           
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.5),
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 9.5),

            addButton.heightAnchor.constraint(equalToConstant: 15),
            addButton.widthAnchor.constraint(equalToConstant: 15)
        ])

    }
    func buttonPressed(button: UIButton) {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped(button: UIButton) {
        if button.currentImage == UIImage(named: "emptyButton") {
            button.setImage(UIImage(named: "selectedButton"), for: .normal)
        } else  {
            button.setImage(UIImage(named: "emptyButton"), for: .normal)
        }
    }
    
    func setupTextField(textFieldName: CustomTextField, inputView: UIDatePicker, toolBar: UIToolbar) {
        textFieldName.padding = UIEdgeInsets(top: 0, left: 46, bottom: 0, right: 20)
        textFieldName.backgroundColor = .white
        textFieldName.setupLeftSideImage(ImageViewNamed: "calendar")
        textFieldName.inputView = inputView
        textFieldName.inputAccessoryView = toolBar
    }
        
    @objc
    func startDoneTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        self.startTextField.text = dateFormatter.string(from: startDatePicker.date)
        endEditing(true)
    }
    
    @objc
    func finishDoneTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        self.finishTextField.text = dateFormatter.string(from: finishDatePicker.date)
        endEditing(true)
    }
}
