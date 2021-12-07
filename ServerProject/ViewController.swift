//
//  ViewController.swift
//  ServerProject
//
//  Created by Denis Snezhko on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var textFieldLogin: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Логин:"
        text.allowsEditingTextAttributes = false
        return text
    }()
    
    private var textFieldLoginInput: SDCTextField = {
        let text = SDCTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "UserName"
//        text.maxLength = 10
        text.allowsEditingTextAttributes = false
        return text
    }()
    
    private var textFieldPassword: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Пароль:"
        text.allowsEditingTextAttributes = false
        return text
    }()
    
    private var textFieldPasswordInput: SDCTextField = {
        let text = SDCTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Password"
        text.allowsEditingTextAttributes = false
        return text
    }()
    
    private var stackViewLogin: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
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
        stackViewLogin.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.frame.size.width / 5).isActive = true
        stackViewLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        stackViewPassword.leadingAnchor.constraint(equalTo: stackViewLogin.leadingAnchor).isActive = true
        stackViewPassword.topAnchor.constraint(equalTo: stackViewLogin.bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupHierarchy() {
        view.addSubview(stackViewLogin)
        view.addSubview(stackViewPassword)

        stackViewLogin.addArrangedSubview(textFieldLogin)
        stackViewLogin.addArrangedSubview(textFieldLoginInput)
        stackViewPassword.addArrangedSubview(textFieldPassword)
        stackViewPassword.addArrangedSubview(textFieldPasswordInput)
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
