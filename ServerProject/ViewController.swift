//
//  ViewController.swift
//  ServerProject
//
//  Created by Denis Snezhko on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //  MARK: - Elements
    private var textFieldLogin: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Логин:"
//        text.isse
        return text
    }()
    
    private var textFieldLoginInput: SDCTextField = {
        let text = SDCTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "UserName"
        text.allowsEditingTextAttributes = false
        return text
    }()
    
    private var textFieldPassword: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Пароль:"
        return text
    }()
    
    private var textFieldPasswordInput: SDCTextField = {
        let text = SDCTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Password"
        text.adjustsFontSizeToFitWidth = true
        text.isSecureTextEntry = true
        text.allowsEditingTextAttributes = false
        return text
    }()
    
    private var stackViewLogin: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 18
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var stackViewPassword: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let checkBox: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.isSelected = true
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.addTarget(self, action: #selector(checkBoxPassword), for: .touchUpInside)
        return button
    }()

    //  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldLoginInput.delegate = self
        self.textFieldPasswordInput.delegate = self
        self.textFieldPasswordInput.maxLength = 10
        self.textFieldLoginInput.maxLength = 12
        setupView()
        setupHierarchy()
        setupLayouts()
    }
    
    //  MARK: - Private functions
    private func setupView() {
        view.backgroundColor = .cyan
    }
    
    private func setupLayouts() {
        textFieldPasswordInput.frame.size.width = 250
        NSLayoutConstraint.activate([
            stackViewLogin.leadingAnchor.constraint(equalTo: view.centerXAnchor,
                                                    constant: -view.frame.size.width / 5
                                                   ),
            stackViewLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackViewPassword.leadingAnchor.constraint(equalTo: stackViewLogin.leadingAnchor),
            stackViewPassword.topAnchor.constraint(equalTo: stackViewLogin.bottomAnchor, constant: 10),
            
//            checkBox.centerXAnchor.constraint(equalTo: stackViewPassword.centerXAnchor, constant: 0),
//            checkBox.leadingAnchor.constraint(equalTo: stackViewPassword.leadingAnchor,constant: 0)
        ])
    }
    
    private func setupHierarchy() {
        view.addSubview(stackViewLogin)
        view.addSubview(stackViewPassword)
        
        
        stackViewLogin.addArrangedSubview(textFieldLogin)
        stackViewLogin.addArrangedSubview(textFieldLoginInput)
        stackViewPassword.addArrangedSubview(textFieldPassword)
        stackViewPassword.addArrangedSubview(textFieldPasswordInput)
        stackViewPassword.addArrangedSubview(checkBox)
    }
    
    @IBAction func checkBoxPassword(sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            textFieldPasswordInput.isSecureTextEntry = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            textFieldPasswordInput.isSecureTextEntry = true
        }
        sender.isSelected.toggle()
    }
}

//  MARK: - Extensions
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Verify all the conditions
        if let sdcTextField = textField as? SDCTextField {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        return false
    }
}
