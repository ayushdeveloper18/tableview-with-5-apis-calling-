//
//  ViewController.swift
//  tableview with 5 apis
//
//  Created by Ayush Sharma on 02/07/22.
//

import UIKit

class ViewController: UIViewController {
    var todotask = [ToDoTask]()
    var newyorkData: New?
    var japan: Japan?
    var data1 = [Data1]()
    var welcomeAuthor = [Element]()
    
    let sectionTitle = ["Section 1", "Section 2", "Section 3", "Section 4", "Section 5"]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        firstapi()
        secondapi()
        thirdapi()
        fouthapi()
        fifthapi ()
        
        //  myTableView.separatorStyle =
    }
    
    //MARK: first api japan one from data 5
    
    func firstapi() {
        
        let urls = "https://newsapi.org/v2/everything?q=apple&from=2022-07-01&to=2022-07-01&sortBy=popularity&apiKey=1372066251b44a26941c5d7b0a181508"
        let url = URL(string: urls)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data , response, error in
            guard error == nil else{
                print(error)
                return
            }
            
            guard let response = response else {
                return
                
            }
            guard let data = data else {
                return
            }
            do {
                
                let json = try JSONDecoder().decode(Japan.self, from: data)
                //  print(json)
                self.japan = json
                
            } catch {
                print(error)
                
            }
            
        }.resume()
        
    }
    
    //MARK: second api
    
    func secondapi(){
        let urls = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1372066251b44a26941c5d7b0a181508"
        let url = URL(string: urls)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { [self] data , response, error in
            guard error == nil else{
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let json = try JSONDecoder().decode(New.self, from: data)
                // print(json)
                newyorkData = json
                
                DispatchQueue.main.async {
                    myTableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    
    func thirdapi() {
        
        let urls = "https://api.github.com/users/hadley/orgs"
        let url = URL(string: urls)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { [self] data , response, error in
            guard error == nil else{
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let json = try JSONDecoder().decode([Data1].self, from: data)
                // print(json)
                data1 = json
                
                DispatchQueue.main.async {
                    myTableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    
    func fouthapi(){
        let urls = "https://api.github.com/repositories/19438/commits"
        let url = URL(string: urls)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { [self] data , response, error in
            guard error == nil else{
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let json = try JSONDecoder().decode([Element].self, from: data)
                  print(json)
                welcomeAuthor = json
                
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fifthapi() {
        
        let urls = "https://jsonplaceholder.typicode.com/todos"
        let url = URL(string: urls)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { [self] data , response, error in
            guard error == nil else{
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let json = try JSONDecoder().decode([ToDoTask].self, from: data)
                //print(json)
                todotask  = json
                
                DispatchQueue.main.async {
                    myTableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }.resume()
        
        
    }
    
    
    
}





extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  section == 0 {
            return newyorkData?.articles?.count ?? 0
        }
        else if section == 1 {
            
            return newyorkData?.articles?.count ?? 0
            
        } else if section == 2 {
            
            return data1.count
        }
        else if section == 3 {
            
            return welcomeAuthor.count
        }
        else if section == 4 {
            
            return  todotask.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell   {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
            cell.titleLbl.text = newyorkData?.articles?[indexPath.row].title ?? ""
            cell.selectionStyle = .none
            return cell
        }
        
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
            cell.titleLbl.text = newyorkData?.articles?[indexPath.row].author ?? ""
            
            return cell         }
        
        else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            
            cell.titleLbl.text = data1[indexPath.row].node_id  ?? ""
            //  print(indexPath.row)
            return cell
        }
        
        else if indexPath.section == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            
            cell.titleLbl.text = welcomeAuthor[indexPath.row].url ?? ""
            //  print(indexPath.row)
            
            
            return cell
        }
        
        else if indexPath.section == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            
            cell.titleLbl.text = todotask[indexPath.row].title ?? ""
          
            //  print(indexPath.row)
            
            
            return cell
        }
        
        
        else  {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: myTableView.frame.size.width, height: 50.0))
        view.backgroundColor = .systemBlue
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: myTableView.frame.size.width, height: 50.0))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = sectionTitle[section]
        label.textColor = .white
        view.addSubview(label)
        //label.text = "DataApi \(section + 1)"
        
        return view
        
        
        
        
    }
}


