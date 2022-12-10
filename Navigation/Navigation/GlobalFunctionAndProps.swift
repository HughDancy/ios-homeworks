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

let loginPlaceHOlders = ["Email or number of phone", "Password"]
