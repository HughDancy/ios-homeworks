//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Киселев on 29.11.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    let identifier = "header"
    
    var statusText = ""
    
    //MARK: - Subview's
    
    private lazy var image: UIImageView = {
        let picture = UIImageView()
        
        picture.layer.cornerRadius = 60
        picture.clipsToBounds = true
        picture.layer.borderWidth = 3
        picture.layer.borderColor = UIColor.white.cgColor
        picture.isUserInteractionEnabled = true
        picture.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startAnimation)))
        
        let image = UIImage(named: "picture")
        picture.image = image
        picture.contentMode = .scaleAspectFill
        
        return picture
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Corey Taylor"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.textColor = .gray
        
        return label
    }()
    
    lazy var button: UIButton = {
        var button = UIButton(type: .system)
        
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        button.isEnabled = true
        
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemGray
        button.alpha = 0.0
        button.addTarget(self, action: #selector(cancelAnitmation), for: .touchDown)
        
        return button
    }()
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        
        view.backgroundColor = .lightGray
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Helvetica", size: 15)
        
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var backdropView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: -100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100))
        view.backgroundColor = .black
        view.alpha = 0.0
        
        return view
    }()
    
    private lazy var pictureCenter = image.center
    private lazy var pictureBounds = image.bounds
    
    //MARK: - Initial
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        buttonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(nameLabel)
        addSubview(shadowView)
        addSubview(button)
        addSubview(statusLabel)
        addSubview(textField)
        addSubview(backdropView)
        addSubview(cancelButton)
        addSubview(image)
    }
    
    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        image.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -32).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -30).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.bottomAnchor.constraint(equalTo: shadowView.topAnchor, constant: -16).isActive = true
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: shadowView.heightAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: shadowView.widthAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
    }
    
    private func buttonSetup() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Set status"
        
        button.configuration = configuration
    }
    
    //MARK: - Button Actions
    
    @objc func printStatus() {
        if statusText == "" {
            statusLabel.text = "Wiating for something.."
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
            textField.layer.add(animation, forKey: "position")
        } else {
            statusLabel.text = statusText
            print(statusLabel.text ?? "")
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc func startAnimation() {
        
        pictureCenter = image.center
        pictureBounds = image.bounds
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [self] in
            self.image.center = self.backdropView.center
            backdropView.alpha = 0.7
            image.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
            DispatchQueue.main.async {
                let animation = CABasicAnimation(keyPath: "cornerRadius")
                animation.duration = 0.5
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
                animation.fromValue = self.image.layer.cornerRadius
                animation.toValue = 0
                self.image.layer.add(animation, forKey: nil)
                self.image.layer.cornerRadius = 0
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) { [self] in
                cancelButton.alpha = 1
            }
        }
    }
    
    @objc func cancelAnitmation() {
        UIView.animate(withDuration: 0.3) { [self] in
            cancelButton.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
                backdropView.alpha = 0.0
                image.layer.borderWidth = 3
                image.layer.cornerRadius = 60
                image.center = pictureCenter
                image.bounds = pictureBounds
            }
        }
    }
}
