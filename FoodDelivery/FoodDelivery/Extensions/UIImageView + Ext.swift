//
//  UIImageView + Ext.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 4.04.23.
//

import UIKit

extension UIImageView {

   func downloadedFrom(link:String) {
    guard let url = URL(string: link) else { return }
    URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
      guard let data = data , error == nil, let image = UIImage(data: data) else { return }
      DispatchQueue.main.async { () -> Void in
        self.image = image
      }
    }).resume()
  }

}
