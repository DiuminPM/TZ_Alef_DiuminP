//
//  InsertableTextField.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 16.02.2022.
//

import UIKit

class InsetTextField: UITextField {
    var insets: UIEdgeInsets

    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: .zero)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("not intended for use from a NIB")
    }

    // text position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
         return super.textRect(forBounds: bounds.inset(by: insets))
    }
 
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return super.editingRect(forBounds: bounds.inset(by: insets))
    }
}

extension UITextField {

    class func textFieldWithInsets() -> UITextField {
        return InsetTextField(insets: UIEdgeInsets(top: 22, left: 0, bottom: 0, right: 0))
    }

}
