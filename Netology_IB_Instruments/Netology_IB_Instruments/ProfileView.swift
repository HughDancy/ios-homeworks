//
//  ProfileView.swift
//  Netology_IB_Instruments
//
//  Created by Борис Киселев on 26.11.2022.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let image = UIImage(named: "image")
        imageView.image = image
        labelOne.text = "Всеволод"
        labelOne.backgroundColor = .systemOrange
        labelTwo.text = "17.09.1976"
        labelTwo.backgroundColor = .systemGreen
        labelThree.text = "Псков"
        labelThree.backgroundColor = .systemPurple
    }
}
