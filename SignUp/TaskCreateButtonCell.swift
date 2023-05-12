import UIKit

class TaskCreateButtonCell: UITableViewCell, TaskCreateCell {
    

    var model: TaskCreateButtonModel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TaskCreateModel) {
        guard let model = model as? TaskCreateButtonModel else {
            return
        }
        self.model = model
    }
    
    func setupCell() {
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        let createButton = UIButton()
        
        
        createButton.setTitle("Создать задачу", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "lato-regular", size: 15)
        createButton.setTitleColor(.white, for: .normal)
        createButton.setTitleColor(.lightGray, for: .highlighted)
        createButton.layer.backgroundColor = UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1).cgColor
        createButton.layer.cornerRadius = 22
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(createButton)
        
        NSLayoutConstraint.activate(
            [
            createButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            createButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            createButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            createButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            createButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
