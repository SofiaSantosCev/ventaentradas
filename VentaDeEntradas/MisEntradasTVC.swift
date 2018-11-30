
import UIKit

class MisEntradasTVC: UITableViewController {

    var entradas = [Entrada]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entradas.append(Entrada(name: "Viña Rock", date: "4/05/2019", city: "Madrid"))
        tableView.rowHeight = 100
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


}
