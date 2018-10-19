//
//  ViewController.swift
//  ExpandableCell
//
//  Created by Mohammad Moein Abdi on 7/27/1397 AP.
//  Copyright © 1397 Mohammd Moein Abdi. All rights reserved.
//

import UIKit
/*
 کنترلر اصلی
 در اینجا دیتاسورس و دلیگیت مربوط به تیبل ویو را اضافه میکنیم.
 */
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    /*
     ساخت آرایه ای از کلاس دیتایی که ساختیم
 */
    let sections: Array<ExpandDataModel> = [ExpandDataModel(sTitle: "آیتم ۱", sRows: ["ردیف ۱ از آیتم ۱","ردیف ۲ از آیتم۱","ردیف ۳ از آیتم ۱","ردیف ۴ از آیتم ۱"]),
                                            ExpandDataModel(sTitle: "section 2", sRows: ["row 1 from s2","row 2 from s2","row 3 from s2","row 4 from s2"]),
                                            ExpandDataModel(sTitle: "item 3", sRows: ["row 1 az s3","row 2 az s3","row 3 az s3"]),
                                            ExpandDataModel(sTitle: "section 4", sRows: ["row 1 s4","row 2 s4","row 3 s4","row 4 s4"]),
                                            ExpandDataModel(sTitle: "section 5", sRows: ["row 1 s5","row 2 s5","row 3 s5","row 4 s5"]),
                                            ExpandDataModel(sTitle: "section 6", sRows: ["row 1 s6","row 2 s6","row 3 s6"])]
    /*
     دلیگیت های مربوط به تیبل ویو:
 */
    
    //تعداد سطر در آیتم
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section].isExpanded == true{
            return sections[section].sectionRows.count + 1
        }
        return 1
    }
    
    //تعداد آیتم
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    //سل برای هر سطر/آیتم
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let secCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
            let model = sections[indexPath.section]
            secCell.textLabel?.text = model.sectionTitle
            return secCell
        }else{
            let indexRow = indexPath.row - 1
            let rowModel = sections[indexPath.section].sectionRows[indexRow]
            let rowCell = tableView.dequeueReusableCell(withIdentifier: "rowCell", for: indexPath)
            rowCell.textLabel?.text = rowModel
            return rowCell
        }
    }
    
    //انتخاب سطر/آیتم در:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if sections[indexPath.section].isExpanded == true{
                self.sections[indexPath.section].isExpanded = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                self.sections[indexPath.section].isExpanded = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
         کار خاصی اینجا لازم نیست انجام بدید
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

