//
//  MyButton.swift
//  Calculate
//
//  Created by 순진이 on 2022/03/18.
//

import Foundation
import UIKit

class MyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(_ title: String, _ bGcolor: UIColor = .darkGray, _ textColor: UIColor = .white) {
        super.init(frame: .zero)
        self.bounds.size = CGSize(width: 80, height: 80)
        layer.cornerRadius = self.bounds.size.width * 0.5
        setTitle(title, for: .normal)
        backgroundColor = bGcolor
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        setTitleColor(textColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
