//
//  Indicator.swift
//  Durgaprasad_Task
//
//  Created by ItsDp on 31/03/20.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit

final class Indicator {
    static let shared = Indicator()
    
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()
    
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = .whiteLarge
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = UIColor.white
    }
    
    func show(){
        DispatchQueue.main.async( execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.indicator)
        })
    }
    
    func hide(){
        DispatchQueue.main.async( execute: {
            self.blurImg.removeFromSuperview()
            self.indicator.removeFromSuperview()
        })
    }
}
