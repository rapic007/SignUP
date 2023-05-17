import UIKit

class TaskCreateStartCell: UITableViewCell, TaskCreateCell {
    let startLabel = CustomLabel()
    let startTextField = CustomTextField()
    let finishLabel = CustomLabel()
    let finishTextField = CustomTextField()
    
    var model: TaskCreateStartModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TaskCreateModel) {
        guard let model = model as? TaskCreateStartModel else {
            return
        }
        self.model = model
        configureUI()
    }
    
    func configureUI() {
        startLabel.text = model?.startTitle
        finishLabel.text = model?.finishTitle
    }
    
    func setupCell() {
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        startLabel.setupLabel(size: 13)
        
        startTextField.setupDatePicker()
        
        finishLabel.setupLabel(size: 13)
        
        finishTextField.setupDatePicker()
        
        [startLabel, startTextField, finishLabel, finishTextField].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            startLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            startLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            finishLabel.leadingAnchor.constraint(equalTo: startLabel.trailingAnchor, constant: 51),
            finishLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            startTextField.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 9),
            startTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            startTextField.widthAnchor.constraint(equalToConstant: 158),
            startTextField.heightAnchor.constraint(equalToConstant: 44),
            startTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            finishTextField.topAnchor.constraint(equalTo: finishLabel.bottomAnchor,constant: 9),
            finishTextField.leadingAnchor.constraint(equalTo: startTextField.trailingAnchor, constant: 16),
            finishTextField.widthAnchor.constraint(equalToConstant: 158),
            finishTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
        
    }
}
