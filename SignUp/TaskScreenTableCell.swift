import UIKit

class TaskScreenTableCell: UITableViewCell {
    let view = UIView()
    let nameLabel = CustomLabel()
    var imagef = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        contentView.addSubview(view)
        view.addSubview(nameLabel)
        view.addSubview(imagef)
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        nameLabel.setupLabel(size: 15)
        
        [nameLabel, view, imagef].forEach {
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
            
            imagef.topAnchor.constraint(equalTo: view.topAnchor),
            imagef.rightAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: -16),
            imagef.leftAnchor.constraint(equalTo: view.leftAnchor),
            imagef.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
