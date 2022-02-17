//
//  HeaderLabel.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 13.02.2022.
//

import UIKit
class HeaderLabel: UILabel {
    init(header: String) {
        super.init(frame: .zero)
        text = header
        font = .boldSystemFont(ofSize: 18)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
