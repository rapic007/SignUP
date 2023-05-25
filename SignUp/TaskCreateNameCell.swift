import UIKit

class TaskCreateNameCell: UITableViewCell, TaskCreateCell {
    let taskNameLabel = CustomLabel()
    let taskNameTextField = CustomTextField()
    
    var model: TaskCreateNameModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TaskCreateModel) {
        guard let model = model as? TaskCreateNameModel else {
            return
        }
        
        self.model = model
        configureUI()
    }
    
    func configureUI() {

        taskNameLabel.text = model?.title
        taskNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    func setupCell() {
        
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        taskNameLabel.setupLabel(size: 13)
        
        taskNameTextField.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        taskNameTextField.placeholder = "Например, сделать зарядку"
        
        [taskNameLabel, taskNameTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            taskNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskNameLabel.widthAnchor.constraint(equalToConstant: 102),
            

            taskNameTextField.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 9),
            taskNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            taskNameTextField.heightAnchor.constraint(equalToConstant: 44),
            taskNameTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
            
        ])
    }
    @objc func textFieldChanged() {
        model?.taskName = taskNameTextField.text
    }
}
