import UIKit

class CustomView: UIView {
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func labelAndButtonView(text: String) {
        let label = CustomLabel()
        let button = UIButton()

        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        
        button.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        button.setImage(UIImage(named: "emptyButton"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        label.setupLabel(size: 15)
        label.text = text
        
        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 7),
            
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.5),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 9.5),
            button.heightAnchor.constraint(equalToConstant: 15),
            button.widthAnchor.constraint(equalToConstant: 15)
            
        ])

    }
    @objc
    func buttonTapped(button: UIButton) {
        if button.currentImage == UIImage(named: "emptyButton") {
            button.setImage(UIImage(named: "selectedButton"), for: .normal)
        } else  {
            button.setImage(UIImage(named: "emptyButton"), for: .normal)
        }
    }
}
