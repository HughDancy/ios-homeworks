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

let login = "user@mail.com"
let password = "1234"

extension String{
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
       }  
}

protocol TapLike: AnyObject {
    func toTap()
}
