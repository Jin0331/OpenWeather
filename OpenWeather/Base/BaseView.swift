//
//  BaseView.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit

class BaseView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView() 
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {
        backgroundColor = .black
    }
}
