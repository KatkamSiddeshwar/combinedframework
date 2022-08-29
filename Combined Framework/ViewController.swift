//
//  ViewController.swift
//  Combined Framework
//
//  Created by Auriga on 29/08/22.
//

import UIKit
import Combine

class MyCustomCell: UITableViewCell { }

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var observers : [AnyCancellable] = []
    var model = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "cell")
        let nibname = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nibname, forCellReuseIdentifier: "cellbutton")

        // Do any additional setup after loading the view.
        ApiCaller.shared.getData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { value in
                self.model = value
                self.tableView.reloadData()
            })
            .store(in: &observers)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
}

//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellbutton", for: indexPath) as! CustomCell
//        cell.action.sink{ string in
//            print(string)
//        }.store(in: &observers)
//        return cell
