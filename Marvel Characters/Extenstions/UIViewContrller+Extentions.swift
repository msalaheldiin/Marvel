//
//  UIViewContrller+Extentions.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/11/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

extension UIViewController{
 func cancelbutton(){
      let btnCancel = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
      btnCancel.setTitle("Cancel", for: .normal)
      btnCancel.setTitleColor(.red, for: .normal)
      btnCancel.layer.masksToBounds = true
      btnCancel.addTarget(self, action: #selector(cancelBtnPressed), for: .touchUpInside)
      navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnCancel)
     }
  @objc func cancelBtnPressed(){
      self.navigationController?.popViewController(animated: true)
     }
}
