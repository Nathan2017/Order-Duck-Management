//
//  ViewController.swift
//  OrderManagement
//
//  Created by Rocky on 2/8/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    let urlpath = URL(string: "https://serene-escarpment-78587.herokuapp.com/api/products")
    var productss:[Products] = []
   var imagecache:NSCache<AnyObject, AnyObject> = {
      let ic = NSCache<AnyObject, AnyObject>()
      return ic
   }()
    override func viewDidLoad() {
        super.viewDidLoad()
       parsejson()
        collectionView?.register(ProductsCell.self, forCellWithReuseIdentifier: "cellid")
      collectionView?.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
       collectionView?.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        navigationItem.title = "Recent Order"
        
            }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productss.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ucv = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! ProductsCell
        ucv.backgroundColor = .white
        ucv.delivery_status.text = productss[indexPath.item].delivery_status
        switch productss[indexPath.item].delivery_status
        {
        case "Out For Delivery" :
            ucv.delivery_status.textColor = UIColor(red: 133/255, green: 152/255, blue: 88/255, alpha: 1)
        case "Delayed" :
            ucv.delivery_status.textColor = UIColor.red
        case "Delivered" :
            ucv.delivery_status.textColor = UIColor.black
        case "Pending Request" :
            ucv.delivery_status.textColor = UIColor.orange
        default:
            break
        }
        ucv.product_name.text = productss[indexPath.item].product_name
        ucv.product_price_amount.text = productss[indexPath.item].price + "  \u{00B7}  " + productss[indexPath.item].amount + " item"
        ucv.estimate_delivery_date.text = productss[indexPath.item].estimate_date
        ucv.order_date.text = "Ordered on " + productss[indexPath.item].order_date
      if let cacheimage = imagecache.object(forKey: productss[indexPath.item].image_url as AnyObject) as? UIImage {
         ucv.product_image.image = cacheimage
      }
      else
      {
        let url = URL(string: productss[indexPath.item].image_url)
      DispatchQueue.global(qos: .background).async {
         do{
            let data = try Data(contentsOf: url!)
            DispatchQueue.main.async {
               let im = UIImage(data: data)
               self.imagecache.setObject(im!, forKey: self.productss[indexPath.item].image_url as AnyObject)
               ucv.product_image.image = im
            }
            
         }
         catch{
            
         }
      }
      }
        return ucv
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-20, height: view.frame.height/4)
    }
   
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      self.navigationController?.pushViewController(DetailViewController(), animated: true)
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 10
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
                    for item in jsondict
                    {
                        
                   
                        DispatchQueue.main.async {
                            let item = item as! [String:String]
                           self.productss.append(Products(product_id: item["product_id"]!, product_name: item["product_name"]!, price: item["price"]!, order_date: item["order_date"]!,amount:item["amount"]!, estimate_date: item["estimate_delivery_date"]!, delivery_status: item["delivery_status"]!,image_url: item["image_url"]!))
                             self.collectionView?.reloadData()
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

