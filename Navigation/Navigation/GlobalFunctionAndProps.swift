//
//  GlobalFunctionAndProps.swift
//  Navigation
//
//  Created by Борис Киселев on 03.12.2022.
//

import Foundation
import UIKit

func createButton(conf: UIButton.Configuration, title: String, color: UIColor, radius: CGFloat, clipToBounds: Bool) -> UIButton {
    
    let button = UIButton()
    button.layer.cornerRadius = radius
    button.clipsToBounds = clipToBounds
    
    var config = conf
    config.title = title
    config.baseBackgroundColor = color
    button.configuration = config
    
    return button
}

func createTextField(withText placeholder: String, secureText: Bool) -> UITextField {
    let textField = UITextField()
   
   
    textField.textColor = .black
//    textField.backgroundColor = .systemGray6
//    textField.layer.borderWidth = 0.5
//    textField.layer.borderColor = UIColor.lightGray.cgColor
//    textField.autocapitalizationType = .none
//    textField.font?.withSize(16)
//    textField.layer.cornerRadius = 10
    
    
    
    textField.placeholder = placeholder
    textField.isSecureTextEntry = secureText
    
    return textField
}

let loginPlaceHOlders = ["Email or number of phone", "Password"]
