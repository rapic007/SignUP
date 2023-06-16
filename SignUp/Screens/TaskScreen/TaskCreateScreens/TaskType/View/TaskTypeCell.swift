import UIKit

class TaskTypeCell: UITableViewCell {
    
    
    let taskImage = UIImageView()
    let view = UIView()
    var taskNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "lato-regular", size: 15)
        label.textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
        return label
    }()
    var taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "lato-regular", size: 13)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.62, green: 0.616, blue: 0.643, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSell() {
        contentView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.layer.cornerRadius = 25
        
        
        [taskImage, taskNameLabel, taskDescriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
            
            
        }
        NSLayoutConstraint.activate([
            taskImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            taskImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            taskImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            taskImage.heightAnchor.constraint(equalToConstant: 48),
            taskImage.widthAnchor.constraint(equalToConstant: 47),
            
            taskNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            taskNameLabel.leadingAnchor.constraint(equalTo: taskImage.trailingAnchor, constant: 8),
            taskNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor),
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: taskImage.trailingAnchor, constant: 8),
            taskDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            taskDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),


        ])
    }
    func configure(taskCell: TaskCell) {
        taskImage.image = taskCell.imageName
        taskNameLabel.text = taskCell.taskName
        taskDescriptionLabel.text = taskCell.taskDescription
    }
}

