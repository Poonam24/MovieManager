//
//  ViewController.swift
//  MovieManager
//
//  Created by Poonam on 18/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter : PresenterInterface?
    var datasource : [Result] = []
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")

        presenter?.fetchMovieList()
    }
}

extension ViewController : ViewInterface {
    func updateView(withUpdatedData: [Result]) {
        self.datasource = withUpdatedData
        print(withUpdatedData.count)
        DispatchQueue.main.async {
            self.tableView.reloadData();
        }
    }
    
    func showError(error: Error) {
        print(error);
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 319;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell else {
            return UITableViewCell()
        }
        cell.presenter = presenter;
        cell.configureCell(data: datasource, indexPath: indexPath.row)
        
        return cell
    }
    
}

extension ViewController : UITableViewDelegate {
    
}
