//
//  ViewMoreViewController.swift
//  NavigationApp
//
//  Created by Osmar Juarez on 02/09/22.
//

import UIKit

class ViewMoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var receivedMovie = ["Title: ", "Year: ", "Runtime:", "Genere/s: ",
                         "Director: ", "Actors: ", "Plot: ", "Poster URL: "]
    let movieDataManager = MovieDataManager()
    
    @IBOutlet var movieInfoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "movieInfoCell", for: indexPath) as! MoviesDetailsGenereTableViewCell
        tableCell.labelMovieDetail.text = receivedMovie[indexPath.row]
        
        tableCell.contentView.setNeedsLayout()
        tableCell.contentView.layoutIfNeeded()
        return tableCell
    }
}
