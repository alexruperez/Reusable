/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit


// MARK: Reusable support for UITableViewCell

extension UITableViewCell: NibReusable {}

public extension UITableViewCell {
    /**
     Register a NIB-Based `UITableViewCell` subclass (conforming to `NibReusable`) in an UITableView
     
     - parameter tableView: the `UITableView` where register the cell
     
     - seealso: `registerNib(_:,forCellReuseIdentifier:)`
     */
    final func registerReusableNib<T: UITableView>(tableView: T) {
        tableView.registerNib(self.dynamicType.nib, forCellReuseIdentifier: reuseIdentifier!)
    }
    
    /**
     Register a Class-Based `UITableViewCell` subclass (conforming to `Reusable`) in an UITableView
     
     - parameter tableView: the `UITableView` where register the cell
     
     - seealso: `registerClass(_:,forCellReuseIdentifier:)`
     */
    final func registerReusableClass<T: UITableView>(tableView: T) {
        tableView.registerClass(self.dynamicType, forCellReuseIdentifier: reuseIdentifier!)
    }
    
    /**
     Returns a reusable `UITableViewCell` object for the class inferred by the return-type
     
     - parameter indexPath: The index path specifying the location of the cell.
     - parameter cellType: The cell class to dequeue
     
     - returns: A `Reusable`, `UITableViewCell` instance
     
     - note: The `cellType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     - seealso: `dequeueReusableCellWithIdentifier(_:,forIndexPath:)`
     */
    final func dequeueReusableCell<T: UITableView>(indexPath indexPath: NSIndexPath, tableView: T) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!, forIndexPath: indexPath)
    }
}
