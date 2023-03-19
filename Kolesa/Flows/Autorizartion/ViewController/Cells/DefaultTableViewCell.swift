//
//  KolesaLogoTableViewCell.swift
//  Kolesa
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

final class DefaultTableViewCell: UITableViewCell {
    override class func description() -> String {
        return "DefaultCollectionViewCell"
    }
    
    private lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.image = .init(named: "kolesa.logo")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var phoneNumberTextField: RegistrationTextField = {
        let tf = RegistrationTextField(placeholder: "Введите номер телефона")
        tf.delegate = self
        tf.addTarget(self, action: #selector(isEmptyTextField), for: .allEditingEvents)
        return tf
    }()
    
    lazy var nextButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 8
        button.backgroundColor = .kolesaGray
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeConstraints()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func makeConstraints(){
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.left.right.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
        }
    }
    private func setupViews() {
        contentView.addSubviews([logoImageView, phoneNumberTextField, nextButton])
        contentView.backgroundColor = .white
        
    }
    @objc func isEmptyTextField() {
        if phoneNumberTextField.text!.count > 0 {
            nextButton.backgroundColor = .kolesaBlue
        }
        else {
            nextButton.backgroundColor = .kolesaGray
        }
    }
    
}

extension DefaultTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.kolesaBlue.cgColor
        return true
    }
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        phoneNumberTextField.layer.borderColor = UIColor.kolesaGray.cgColor
    }
    
    
    
}

