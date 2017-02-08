//
//  ViewController.swift
//  OrderManagement
//
//  Created by Rocky on 2/8/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    let urlpath = URL(string: "https://serene-escarpment-78587.herokuapp.com/api/products")
    var productss:[Products] = []
   var products_image:[UIImage] = [UIImage(named: "macbook-pro")!,UIImage(named: "predator")!,UIImage(named: "blackguy")!]
    lazy var productcollectionview:UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        let pcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        pcv.translatesAutoresizingMaskIntoConstraints = false
        pcv.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        pcv.dataSource = self
        pcv.delegate = self
        pcv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        pcv.alwaysBounceVertical = true
        pcv.register(ProductsCell.self, forCellWithReuseIdentifier: "cellid")
        return pcv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       parsejson()
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.title = "Recent Order"
        view.addSubview(productcollectionview)
        
        productcollectionview.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        productcollectionview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productcollectionview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productcollectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
            }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productss.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ucv = productcollectionview.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! ProductsCell
        ucv.backgroundColor = .white
        ucv.delivery_status.text = productss[indexPath.item].delivery_status
        switch productss[indexPath.item].delivery_status
        {
        case "Out For Delivery" :
            ucv.delivery_status.textColor = UIColor(red: 133/255, green: 152/255, blue: 88/255, alpha: 1)
        case "Delayed" :
            ucv.delivery_status.textColor = UIColor.red
        case "Pending Request" :
            ucv.delivery_status.textColor = UIColor.orange
        default:
            break
        }
        ucv.product_name.text = productss[indexPath.item].product_name
        ucv.product_price_amount.text = productss[indexPath.item].price + "  \u{00B7}  " + productss[indexPath.item].amount + " item"
        ucv.estimate_delivery_date.text = productss[indexPath.item].estimate_date
        ucv.order_date.text = "Ordered on " + productss[indexPath.item].order_date
        ucv.product_image.image = products_image[indexPath.item]
        return ucv
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-20, height: view.frame.height/4)
    }
    func parsejson(){
       
        DispatchQueue.global(qos: .background).async {
            var request = URLRequest(url: self.urlpath!)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request){ (data,response,error)
                in
                do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    let jsondict = json?["products"] as! NSArray
                    //let item = jsondict[0] as! [String:String]
                    for item in jsondict
                    {
                        
                   
                        DispatchQueue.main.async {
                            let item = item as! [String:String]
                            self.productss.append(Products(product_id: item["product_id"]!, product_name: item["product_name"]!, price: item["price"]!, order_date: item["order_date"]!,amount:item["amount"]!, estimate_date: item["estimate_delivery_date"]!, delivery_status: item["delivery_status"]!))
                             self.productcollectionview.reloadData()
                        }
                       

                    //print(self.productss[0].price)
                    }
                }
                catch{
                    
                }
                }.resume()
        }
        
    }

}

