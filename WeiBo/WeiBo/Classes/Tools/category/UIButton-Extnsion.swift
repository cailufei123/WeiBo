//
//  UIButton-Extnsion.swift
//  WeiBo
//
//  Created by cailufei on 2019/5/20.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
extension UIButton{
    //在swfit中class开头的相当于OC中的+开头的方法
    class func createButton (imageName : String,bgImageName : String) -> UIButton{
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        return btn
    }
   
    // convenience : 便利,使用convenience修饰的构造函数叫做便利构造函数
    //便利构造函数通常对系统类构造函数的扩充
    /*
     遍历构造函数的特点
     1.遍历构造函数通常都是写在extension里面，遍历构造函数通常写在extension里面
     2.遍历构造函数init前面需要加载convenience，遍历构造函数init里面需要加载concvenience
     3.在遍历构造函数中需要明确的调用self.init() 在遍历构造函数中需要明确的调用self.init（）
     */
    convenience init(imageName : String,bgImageName : String){
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
    
}
