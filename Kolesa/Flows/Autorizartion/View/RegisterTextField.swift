//
//  RegisterTextField.swift
//  Kolesa
//
//  Created by Dinmukhamed on 13.03.2023.
//

import Foundation
import UIKit


final class RegistrationTextField: UITextField {
    
    private let edgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
    
    init(placeholder: String){
        super.init(frame: .zero)
        setupTF(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.inset(by: edgeInsets)
    }
    
    private func setupTF(placeholder: String){

        self.placeholder = placeholder
        layer.borderColor = UIColor(red: 206/255,
                                       green: 206/255,
                                       blue: 206/255,
                                       alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
    }
}
