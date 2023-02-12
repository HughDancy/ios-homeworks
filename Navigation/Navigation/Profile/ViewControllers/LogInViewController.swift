//
//  LogInViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 07.12.2022.
//

import UIKit

class LogInViewController: UIViewController{
    
    //MARK: - Subview's
    
    private lazy var scrollView: UIScrollView = {
       let scrollVIew = UIScrollView()
        scrollVIew.isScrollEnabled = true
        scrollVIew.bounces = false
        scrollVIew.showsVerticalScrollIndicator = false
        
        return scrollVIew
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.backgroundColor = .systemGray6
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.clipsToBounds = true
        
        return stackView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vkIcon")
        
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or number of phone"
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .systemGray6
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
     let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .systemGray6
        
    return textField
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.text = "Полня логина и пароля не дозаполнены!"
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = .red
        label.isHidden = true
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(red: 0.29, green: 0.52, blue: 0.80, alpha: 1)
        button.addTarget(self, action: #selector(goToProfileView), for: .touchDown)
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
   

        var configuration = UIButton.Configuration.filled()
        configuration.title = "Log In"
        configuration.baseBackgroundColor = UIColor(red: 0.29, green: 0.52, blue: 0.80, alpha: 1)
        button.configuration = configuration
        
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
        tabBarController?.tabBar.isHidden = true
        subscribeKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        scrollView.keyboardDismissMode = .interactive

        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {

        view.addSubview(scrollView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        scrollView.addSubview(imageView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(warningLabel)
        scrollView.addSubview(loginButton)

    }
    
    //MARK: - Button Action
    
    @objc func goToProfileView() {
        let profileVc = ProfileViewController()
        if loginTextField.text == "" && passwordTextField.text == "" || (loginTextField.text?.count ?? 0) < 10 && (passwordTextField.text?.count ?? 0) < 10 {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animation, forKey: "position")
            warningLabel.isHidden = false
        } else if loginTextField.text != "user@mail.com" && passwordTextField.text != "1234"{
            let controller = UIAlertController(title: "Error", message: "Wrong login or password", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel)
            controller.addAction(alertAction)
            present(controller, animated: true)
           
        } else {
            navigationController?.pushViewController(profileVc, animated: true)
        }
        
    }
    
    //MARK: - ScrollView function
    
    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        DispatchQueue.main.async {
            self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:  ks.height - self.view.safeAreaInsets.bottom + 105, right: 0)
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        scrollView.contentInset = .zero
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -16).isActive = true
        
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
        warningLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 12).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -16).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
}




