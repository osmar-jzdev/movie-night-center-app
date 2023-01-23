//
//  DetailViewController.swift
//  NavigationApp
//
//  Created by Osmar Juarez on 02/09/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var receivedGenere: String?
    var selectedMovie: Movie?
    
    let movieDataManager = MovieDataManager()
    
    @IBOutlet var tableMoviesByGenere: UITableView!
    
    @IBOutlet var titleTopNavigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDataManager.fetch(generes: receivedGenere!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.movieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "MovieNameCell", for: indexPath) as! MoviesDetailsGenereTableViewCell
        tableCell.labelMovieName.text = movieDataManager.movieAt(index: indexPath.row).title
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movieDataManager.movieAt(index: indexPath.row)
        self.performSegue(withIdentifier: "viewMoreSegue", sender: Self.self)
    }
    
    /**
     With this method we can send information to the next screen connected with some segue id defined
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewMoreViewController
        destination.receivedMovie[0] = "Title: " + selectedMovie!.title
        destination.receivedMovie[1] = "Year: " + selectedMovie!.year
        destination.receivedMovie[2] = "Runtime:" + selectedMovie!.runtime
        for genere in selectedMovie!.genres {
            destination.receivedMovie[3] = destination.receivedMovie[3] + genere
        }
        destination.receivedMovie[4] = "Director: " + selectedMovie!.director
        destination.receivedMovie[5] = "Actors: " + selectedMovie!.actors
        destination.receivedMovie[6] = "Plot: " + selectedMovie!.plot
        destination.receivedMovie[7] = "Poster URL: " + selectedMovie!.posterUrl
    }
}
