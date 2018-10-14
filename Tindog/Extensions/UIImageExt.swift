//
//  UIImageExt.swift
//  Tindog
//
//  Created by Felipe on 10/14/18.
//  Copyright © 2018 Platzi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func roundImage(){
        self.layer.cornerRadius = self.bounds.size.height / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        self.clipsToBounds = true
    }
}
