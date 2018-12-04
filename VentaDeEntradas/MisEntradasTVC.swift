
import UIKit

var entradas = [Entrada]()

class MisEntradasTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entradas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EntradasTVCell
        cell.name.text = entradas[indexPath.row].name
        cell.city.text = entradas[indexPath.row].city
        cell.date.text = entradas[indexPath.row].date
    
        return cell
    }
    
    static func SaveTicket(name: String, city: String, date: String){
        entradas.append(Entrada(name: name, date: date, city: city))
    }
}
