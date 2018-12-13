
import UIKit

class EventosTVC: UITableViewController {
    
    var evento = [Evento]() //Array contenedora de eventos.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        //Se añaden los eventos a la lista.
        evento.append(Evento(name: "ViñaRock", date: "20/01/2010", city: "Madrid", price: 60, image: #imageLiteral(resourceName: "vina")))
        evento.append(Evento(name: "Primavera Sound", date: "20/01/2010", city: "Madrid", price: 50, image: #imageLiteral(resourceName: "primavera") ))
        evento.append(Evento(name: "IntroMusic", date: "20/01/2000", city: "Valladolid", price: 35, image: #imageLiteral(resourceName: "intromusic")))
        evento.append(Evento(name: "ViñaRock", date: "20/01/2008", city: "Madrid", price: 40, image: #imageLiteral(resourceName: "vina")))
        evento.append(Evento(name: "ViñaRock", date: "20/01/2010", city: "Madrid", price: 60, image: #imageLiteral(resourceName: "vina")))
        evento.append(Evento(name: "Primavera Sound", date: "20/01/2010", city: "Madrid", price: 50, image: #imageLiteral(resourceName: "primavera") ))
        evento.append(Evento(name: "IntroMusic", date: "20/01/2000", city: "Valladolid", price: 35, image: #imageLiteral(resourceName: "intromusic")))
        evento.append(Evento(name: "ViñaRock", date: "20/01/2008", city: "Madrid", price: 40, image: #imageLiteral(resourceName: "vina")))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Asigna la longitud de la lista a la cantidad de elementos que tenga el array evento.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evento.count
    }
    
    //Asigna la información de cada evento a cada celda.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! EventosTVCell
        cell.name.text = evento[indexPath.row].name
        cell.city.text = evento[indexPath.row].city
        cell.date.text = evento[indexPath.row].date
        cell.price = evento[indexPath.row].price
        cell.imageEvent?.image = evento[indexPath.row].image
        return cell
    }
    
    /*
     Cambia los valores de las variables de la pantalla CompraVC. Asigna los datos del evento seleccionado a los campos.
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CompraVC {
            let destination = segue.destination as! CompraVC
            let evento = sender as! EventosTVCell
            
            destination.textname = evento.name.text!
            destination.price = evento.price
            destination.city = evento.city.text!
            destination.date = evento.date.text!
            destination.image = (evento.imageEvent?.image)!
            
        }
    }
}
