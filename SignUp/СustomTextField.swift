//
//  СustomTextField.swift
//  SignUp
//
//  Created by Влад  on 11.03.23.
//

import UIKit

//MARK: - CustomTextField
final class CustomTextField: UITextField {
    
//MARK: - Private Property
    private let padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    
    //MARK: - Initializers
    init(placeholher: String) {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupTextField(placeholder: self.placeholder)
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
    // как сделать так что бы они были не у всех
    
    //MARK: - Private Methods
    private func setupTextField(placeholder: String?) {
        
        textColor = .black
        font = UIFont(name: "lato-regular", size: 16)
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        layer.masksToBounds = true
        layer.cornerRadius = 22.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        
    }
}
