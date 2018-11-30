
import UIKit


 struct cellData {
    var opened = Bool()
    var sectionData = String()
 }

class EventosTVC: UITableViewController {

    var eventos = [Evento]()
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(opened: false, sectionData: "hola"),
                         cellData(opened: false, sectionData: "hola"),
                         cellData(opened: false, sectionData: "hola"),
                         cellData(opened: false, sectionData: "hola")]
        tableView.rowHeight = 80
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         if tableViewData[section].opened == true
         {
            return 2
         } else {
            return 1
         }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! EventosTVCell
            
            return cell
         } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! EventosTVCell
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData
            return cell
         }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     {
         if indexPath.row == 0 {
             if tableViewData[indexPath.section].opened == true {
             tableViewData[indexPath.section].opened = false
             let sections = IndexSet.init(integer: indexPath.section)
             tableView.reloadSections(sections, with: .none)
            } else {
             tableViewData[indexPath.section].opened = true
             let sections = IndexSet.init(integer: indexPath.section)
             tableView.reloadSections(sections, with: .none)
            }
        }
    }
 


}
