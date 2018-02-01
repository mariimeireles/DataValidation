//
//  CustomButton.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/1/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.isEnabled = false
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1
            } else {
                self.alpha = 0.3
            }
        }
    }
    
}
