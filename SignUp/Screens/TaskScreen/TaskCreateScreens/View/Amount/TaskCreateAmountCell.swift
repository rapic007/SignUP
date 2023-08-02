import UIKit

class TaskCreateAmountCell: UITableViewCell, TaskCreateCell {
    
    let amountLabel = CustomLabel()
    let amountTextField = CustomTextField()
    let plusButton = CustomButton()
    let minusButton = CustomButton()
    var counter: Int = 0
    
    var model: TaskCreateAmountModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TaskCreateModel) {
        guard let model = model as? TaskCreateAmountModel else {
            return
        }
        self.model = model
        configureUI()
    }
    
    func configureUI() {
        amountLabel.text = model?.title
    }
    
    func setupCell() {
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        amountLabel.setupLabel(size: 13)
        
        amountTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        amountTextField.placeholder = "0"
        amountTextField.keyboardType = .numberPad
        amountTextField.isCanPaste = false
        amountTextField.addTarget(self, action: #selector(amountTextFieldChanged), for: .editingChanged)
        
        plusButton.smallButton(imageName: "plus")
        minusButton.smallButton(imageName: "minus")
        plusButton.layer.backgroundColor = .none
        minusButton.layer.backgroundColor = .none
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        [amountLabel, amountTextField, plusButton, minusButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            amountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            amountLabel.widthAnchor.constraint(equalToConstant: 131),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 9),
            amountTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -173),
            amountTextField.heightAnchor.constraint(equalToConstant: 44),
            amountTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            minusButton.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor),
            minusButton.leftAnchor.constraint(equalTo: amountTextField.rightAnchor, constant: 10),
            minusButton.heightAnchor.constraint(equalToConstant: 24),
            minusButton.widthAnchor.constraint(equalToConstant: 24),
            
            plusButton.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor),
            plusButton.leftAnchor.constraint(equalTo: amountTextField.rightAnchor, constant: 44),
            plusButton.heightAnchor.constraint(equalToConstant: 24),
            plusButton.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    @objc
    func plusButtonTapped() {
        guard let intText = Int(amountTextField.text!) else {
            return
        }
        counter = intText
        counter += 1
        amountTextField.text = String(counter)
        amountTextFieldChanged()
        
    }
    @objc
    func minusButtonTapped() {
        guard let intText = Int(amountTextField.text!) else {
            return
        }
        counter = intText
        counter -= 1
        if counter <= 0 {
            counter = 0
        }
        
        amountTextField.text = String(counter)
        amountTextFieldChanged()
    }
    @objc
    func amountTextFieldChanged() {
        guard let amount = amountTextField.text else {
            return
        }
        model?.amount = "\(amount) раз"
    }
    
}
