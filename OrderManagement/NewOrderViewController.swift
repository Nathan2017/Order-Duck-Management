//
//  NewOrderViewController.swift
//  OrderManagement
//
//  Created by Rocky on 2/14/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController {
    var inorder:Bool = false
    lazy var createOrderButton:UIButton = {
        let cob = UIButton(type: .system)
        cob.translatesAutoresizingMaskIntoConstraints = false
        cob.setTitle("Create New Order", for: .normal)
        cob.setTitleColor(UIColor(red: 255/255, green: 215/255, blue: 0, alpha: 1), for: .normal)
        cob.backgroundColor = .black
        cob.addTarget(self, action: #selector(createorder), for: .touchUpInside)
        return cob
    }()
    let coverview:UIView = {
        let cv = UIView()
        cv.backgroundColor = UIColor(white: 0.8, alpha: 1)
        //cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    
    }()
    let billinginfo:UIView = {
       let bi = UIView()
       bi.translatesAutoresizingMaskIntoConstraints = false
        bi.backgroundColor = .white
        return bi
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createOrderButton)
        coverview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapp)))
        createOrderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createOrderButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        createOrderButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        createOrderButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func createorder() {
        //inorder = true
        coverview.isHidden = false
        let win = UIApplication.shared.keyWindow
        coverview.frame = (win?.frame)!
        win?.addSubview(coverview)
        coverview.addSubview(billinginfo)
        billinginfo.centerYAnchor.constraint(equalTo: coverview.centerYAnchor).isActive = true
        billinginfo.centerXAnchor.constraint(equalTo: coverview.centerXAnchor).isActive = true
        billinginfo.widthAnchor.constraint(equalToConstant: 300).isActive = true
        billinginfo.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    func tapp() {
        coverview.isHidden = true
    }

}
