//
//  IterableTextField.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 16.02.2022.
//

import UIKit

class InsertableTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

