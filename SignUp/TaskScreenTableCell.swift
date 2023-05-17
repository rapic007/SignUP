import UIKit

class TaskScreenTableCell: UITableViewCell {
    let view = UIView()
    var nameLabel = CustomLabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        contentView.addSubview(view)
        view.addSubview(nameLabel)
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        
        nameLabel.setupLabel(size: 15)
        
        [nameLabel, view].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 14),
            nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30),
        ])
    }
}
