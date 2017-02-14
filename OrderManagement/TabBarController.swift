//
//  TabBarController.swift
//  OrderManagement
//
//  Created by Rocky on 2/8/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nav1 = UINavigationController(rootViewController:NewOrderViewController())
        nav1.tabBarItem.title = "Shop"
        nav1.tabBarItem.image = UIImage(named: "shop")
        
        
        let layout = UICollectionViewFlowLayout()
        let nav2 = UINavigationController(rootViewController: ViewController(collectionViewLayout: layout))
        nav2.tabBarItem.title = "Cart"
        nav2.tabBarItem.image = UIImage(named: "Cart")
        
        viewControllers = [nav1,nav2]
    }


}
