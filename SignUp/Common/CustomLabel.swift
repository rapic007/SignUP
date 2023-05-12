import UIKit

final class CustomLabel: UILabel {
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(size: CGFloat) {
        font = UIFont(name: "lato-regular", size: size)
        textColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
    }
    
}
