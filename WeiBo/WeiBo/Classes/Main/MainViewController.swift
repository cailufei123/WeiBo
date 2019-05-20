//
//  MainViewController.swift
//  WeiBo
//
//  Created by cailufei on 2019/5/16.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
private lazy var composeBtn = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
       super.viewDidLoad()

        
    setComposeBtn()
//        test();
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        setupTabbarItems()
    }
    
    
   
    
    
    
    
    func test(){
        //       //1.获取josn文件路径
        //        guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else{
        //             print("没有获取到对应的文件路径")
        //            return
        //        }
        //
        //
        //
        //        // 2.读取json文件中的内容
        //
        //
        //        guard let jsonData = NSData(contentsOfFile: jsonPath) else {
        //             print("没有获取到json文件中数据")
        //            return
        //        }
        //     let anyObject = nsdataToJSON(data: jsonData)
        //
        //        guard let dictArray = anyObject as? [[String : AnyObject]] else {
        //
        //            return
        //        }
        //          print(dictArray)
        //
        //
        //
        //        for dict in dictArray {
        //            // 4.1.获取控制器的对应的字符串
        //
        //            guard let vcName = dict["vcName"] as? String else {
        //                continue
        //            }
        //
        //            // 4.2.获取控制器显示的title
        //            guard let title = dict["title"] as? String else {
        //                continue
        //            }
        //
        //            // 4.3.获取控制器显示的图标名称
        //            guard let imageName = dict["imageName"] as? String else {
        //                continue
        //            }
        //            // 4.4.添加子控制器
        //            addChildViewController(vcName: vcName, title: title, imageName: imageName)
        //        }
    }
    
    
    
    func addChildViewController(vcName : String,title : String,imageName : String) {
          // 0.获取命名空间
       guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{
            print("没有获取命名空间")
            return
        }
      guard  let chilVcClass = NSClassFromString(nameSpace + "." + vcName) else{
            print("没有获取命名空间")
            return
        }
        
        guard let childVcType = chilVcClass as? UIViewController.Type else{
            return
        }
          // 3.创建对应的控制器对象
        let chilVc = childVcType.init()
//        chilVc.tabBarItem.title = title
           chilVc.title = title
        chilVc.tabBarItem.image = UIImage(named: imageName)
         chilVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
           // 5.包装导航栏控制器
        let childNav = UINavigationController(rootViewController: chilVc)
       
        addChild(childNav)
    }
    
    
    
    
    
    
    
    

    func nsdataToJSON(data: NSData) -> AnyObject? {
       //如果在调用系统的木一个方法是，该方法左后有一个throws 说明该方法会抛出异常，那么对该方法进行处理
        
        //swift 有三种方法处理 try手动捕捉异常
     //swift 有三种方法处理 try？手动捕捉异常
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch {
            print(error)
        }
        
    return nil
//         let anyObject =   try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
//    
//        return anyObject as AnyObject?
       
       
    }
}
//MARK:---=
extension MainViewController{
    private func setComposeBtn(){
//        
//        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
//        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .selected)
//        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
//        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .selected)
//
//        composeBtn.sizeToFit()
        tabBar.addSubview(composeBtn)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
    }
    
    private func setupTabbarItems(){
        guard let itemArrs = tabBar.items else{
            return
        }
        for i in 0..<itemArrs.count {
            
            let item = itemArrs[i]
            if i == 2{
                item.isEnabled = false
                continue
            }
            
        }
    }
  
}

