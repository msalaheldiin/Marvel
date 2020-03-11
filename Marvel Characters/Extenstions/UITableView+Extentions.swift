//
//  UITableView+Extentions.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/8/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
extension UITableView{
    func registerNib <Cell : UITableViewCell>(cell : Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell : UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell =  self.dequeueReusableCell(withIdentifier: identifier) as? Cell else { fatalError("Error")}
        return cell
    }
}
