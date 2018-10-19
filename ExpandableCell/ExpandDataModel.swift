//
//  ExpandDatamodel.swift
//  ExpandableCell
//
//  Created by Mohammad Moein Abdi on 7/27/1397 AP.
//  Copyright © 1397 Mohammd Moein Abdi. All rights reserved.
//

import Foundation

/*.
 دیتا کلاس ما که حاوی اطلاعاتی که می خواهیم نگه داریم میشه
 */
class ExpandDataModel {
    var isExpanded: Bool = false
    let sectionTitle: String
    let sectionRows: [String]
    init(sTitle: String,sRows: [String]) {
        sectionTitle = sTitle
        sectionRows = sRows
    }
}
