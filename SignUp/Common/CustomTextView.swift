import UIKit

class CustomTextView: UITextView {
    
    init() {
        super.init(frame: .zero, textContainer: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTextView() {
        textColor = UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.82, green: 0.353, blue: 0.133, alpha: 1)]
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        isEditable = false
        textAlignment = .center
    }
    
    func setAttributeWithURL(Url: String, attribute: String) -> NSMutableAttributedString  {
        let attributeWithURL: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "lato-regular", size: 15)!,
            NSAttributedString.Key.link: URL(string: Url)!
        ]
        let attributedString = NSMutableAttributedString(string: attribute, attributes: attributeWithURL)
        return attributedString
    }
    func setAttributeWithoutURL(attribute: String) -> NSMutableAttributedString {
        let attributeWithoutURL: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "lato-regular", size: 15)!,
        ]
        let attributeString = NSMutableAttributedString(string: attribute, attributes: attributeWithoutURL)
        return attributeString
    }
}
