import UIKit

//MARK: - CustomTextField
final class CustomTextField: UITextField {
    
//MARK: - Property
    
    var buttonHandler: (() -> Void)?
    
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    private let button = UIButton()
    
    let datePicker = UIDatePicker()
    
    
    init() {
        super.init(frame: .zero)
        setupTextField()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupTextField()
    }
    
    // MARK: - OvverideMethods

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    var isCanPaste: Bool = true
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return isCanPaste
        }
        return super.canPerformAction(action, withSender: sender)
    }

    
    //MARK: - Private Methods
    private func setupTextField() {
        
        delegate = self
        
        textColor = .black
        font = UIFont(name: "lato-regular", size: 16)
        backgroundColor = .white
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        layer.masksToBounds = true
        layer.cornerRadius = 22.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        
    }
    
    func setupLeftSideImage(ImageViewNamed: String) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
        imageView.image = UIImage(named: ImageViewNamed)
       
        let imageViewContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        imageViewContainerView.addSubview(imageView)
        
        leftView = imageViewContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
    
    func setupRightSideButton() {
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 65, height: 44)
        button.setTitle("Забыли?", for: .normal)
        button.titleLabel?.font = UIFont(name: "lato-regular", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        containerView.addSubview(button)
        rightView = containerView
        rightViewMode = .always
        
        
    }
    func eyeButton() {
        textContentType = .oneTimeCode
        isSecureTextEntry = true

        button.frame = CGRect(x: -5, y: 0, width: 24, height: 24)
        button.setImage(UIImage(named: "eyeImage"), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)

        
        let containerView = UIView(frame: CGRect(x: -10, y: 0, width: 35, height: 24))
        containerView.addSubview(button)
        rightView = containerView
        rightViewMode = .always
    }
    
    func setupDatePicker() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        let toolBar = UIToolbar()
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        datePicker.backgroundColor = .white
        
        doneButton.tintColor = .darkGray

        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: true)
        
        padding = UIEdgeInsets(top: 0, left: 46, bottom: 0, right: 20)
        backgroundColor = .white
        setupLeftSideImage(ImageViewNamed: "calendar")
        inputView = datePicker
        inputAccessoryView = toolBar
    }
        
    @objc
    func rightButtonTapped() {
        buttonHandler?()
    }
    
    @objc
    func eyeTapped() {
        isSecureTextEntry.toggle()
    }
    
    @objc
    func doneTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"

        text = dateFormatter.string(from: datePicker.date)
        endEditing(true)
    }
    }

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
