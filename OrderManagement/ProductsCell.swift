//
//  ProductsCell.swift
//  OrderManagement
//
//  Created by Rocky on 2/8/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

import UIKit

class ProductsCell: UICollectionViewCell {
    let product_image:UIImageView = {
       let pi = UIImageView()
        pi.translatesAutoresizingMaskIntoConstraints = false
        pi.contentMode = .scaleAspectFit
        pi.clipsToBounds = true
     //   pi.backgroundColor = .red
        return pi
    }()
    let product_name:UILabel = {
       let pn = UILabel()
        pn.translatesAutoresizingMaskIntoConstraints = false
      //  pn.backgroundColor = UIColor.blue
        pn.font = UIFont.systemFont(ofSize: 20)
       return pn
    }()
    let product_price_amount:UILabel = {
       let pp = UILabel()
       pp.translatesAutoresizingMaskIntoConstraints = false
       pp.font = UIFont.systemFont(ofSize: 12)
       return pp
    }()
    let order_date:UILabel = {
       let od = UILabel()
        od.translatesAutoresizingMaskIntoConstraints = false
        //od.backgroundColor = UIColor.cyan
        od.font = UIFont.systemFont(ofSize: 11)
         od.textColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        return od
    
    }()
    let delivery_status:UILabel = {
       let ds = UILabel()
       ds.translatesAutoresizingMaskIntoConstraints = false
       ds.font = UIFont.boldSystemFont(ofSize: 12)
        ds.textAlignment = .right
      //  ds.backgroundColor = UIColor.orange
        return ds
    }()
    
    let estimate_delivery_date:UILabel = {
    let edd = UILabel()
    edd.translatesAutoresizingMaskIntoConstraints = false
    //edd.backgroundColor = .green
        edd.font = UIFont.systemFont(ofSize: 11)
        edd.textAlignment = .right
        edd.textColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        return edd
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(product_image)
        addSubview(product_name)
        addSubview(product_price_amount)
        addSubview(order_date)
        addSubview(estimate_delivery_date)
        addSubview(delivery_status)
        
        product_image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        product_image.leftAnchor.constraint(equalTo: leftAnchor,constant:10).isActive = true
        product_image.heightAnchor.constraint(equalTo: heightAnchor,constant:-30).isActive = true
        product_image.widthAnchor.constraint(equalTo: heightAnchor,constant:-40).isActive = true
        
        product_name.topAnchor.constraint(equalTo: product_image.topAnchor).isActive = true
        product_name.leftAnchor.constraint(equalTo: product_image.rightAnchor,constant:10).isActive = true
        product_name.rightAnchor.constraint(equalTo: rightAnchor,constant:-10).isActive = true
        product_name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        product_price_amount.topAnchor.constraint(equalTo: product_name.bottomAnchor,constant:5).isActive = true
        product_price_amount.leftAnchor.constraint(equalTo: product_image.rightAnchor,constant:10).isActive = true
        product_price_amount.rightAnchor.constraint(equalTo: rightAnchor,constant:-10).isActive = true
        product_price_amount.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        order_date.topAnchor.constraint(equalTo: product_price_amount.bottomAnchor,constant:5).isActive = true
        order_date.leftAnchor.constraint(equalTo: product_image.rightAnchor,constant:10).isActive = true
        order_date.rightAnchor.constraint(equalTo: rightAnchor,constant:-10).isActive = true
        order_date.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        estimate_delivery_date.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-10).isActive = true
        estimate_delivery_date.rightAnchor.constraint(equalTo: rightAnchor,constant:-10).isActive = true
        estimate_delivery_date.widthAnchor.constraint(equalToConstant: 50).isActive = true
        estimate_delivery_date.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        delivery_status.bottomAnchor.constraint(equalTo: estimate_delivery_date.topAnchor,constant:-10).isActive = true
        delivery_status.rightAnchor.constraint(equalTo: rightAnchor,constant:-10).isActive = true
        delivery_status.widthAnchor.constraint(equalToConstant: 100).isActive = true
        delivery_status.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
