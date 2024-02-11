//
//  CommonLabel.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit

class CommonLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.textColor = .white
        self.font = .systemFont(ofSize: 17, weight: .heavy)
    }
}


