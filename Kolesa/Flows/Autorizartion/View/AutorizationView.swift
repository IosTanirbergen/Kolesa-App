//
//  AutorizationView.swift
//  Kolesa
//
//  Created by Dinmukhamed on 13.03.2023.
//
import UIKit
import SnapKit

final class AutorizationView: UIViewController {
    
    lazy var numberTextField: UITextField = {
        
        let TF = RegisterTextField(placeholder: "Введите номер телефона")
        TF.delegate = self
        //        let RV = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        //        RV.addSubview(deleteButton)
        //        TF.rightView = deleteButton
        //        TF.rightViewMode = .always
        TF.addTarget(self, action: #selector(checkTF), for: .allEvents)
        return TF
    }()
    lazy var imageView: UIImageView = {
        
        let IV = UIImageView()
        IV.image = UIImage(named: "kolesa")
        
        return IV
    }()

    lazy var deleteButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "x"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true

        return button
    }()
    lazy var goButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 242/255,
                                             green: 242/255,
                                             blue: 242/255,
                                             alpha: 1)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        initialize()
        makeConstraints()
    }
    private func initialize(){
        view.backgroundColor = .white
        view.addSubview(numberTextField)
        view.addSubview(goButton)
        view.addSubview(imageView)
    }
    private func makeConstraints(){
        numberTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            make.left.right.equalToSuperview().inset(16)
        }
        imageView.snp.makeConstraints { make in
          make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(6)
            make.height.equalTo(20)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
        goButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.top.equalTo(numberTextField.snp.bottom).offset(16)
        }
    }
    @objc func checkTF(){
        if numberTextField.text != nil {

            goButton.backgroundColor = UIColor(red: 42/255,
                                               green: 129/255,
                                               blue: 219/255,
                                               alpha: 1)

        } else {
            goButton.backgroundColor = UIColor(red: 242/255,
                                               green: 242/255,
                                               blue: 242/255,
                                               alpha: 1)
        }
    }
    
        
}

extension AutorizationView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor(red: 42/255,
                                                    green: 129/255,
                                                    blue: 219/255,
                                                    alpha: 1).cgColor
        return true
    }
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
            numberTextField.layer.borderColor = UIColor(red: 242/255,
                                                    green: 242/255,
                                                    blue: 242/255,
                                                    alpha: 1).cgColor
        }
    
}
