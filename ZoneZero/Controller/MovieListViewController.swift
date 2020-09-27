//
//  MovieListViewController.swift
//  ZoneZero
//
//  Created by Bilgihan Köse on 24.09.2020.
//

import UIKit

class MovieListViewController: UIViewController {
    
   let movieArray = MovieList()
    
    
    //MARK: -Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}


