//
//  FavoritesViewController.swift
//  NavigationApp
//
//  Created by Osmar Juarez on 02/09/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let posters = ["0", "1", "2", "3", "4"]
    

    @IBOutlet var favoritePosterImage: UIImageView!
    
    @IBOutlet var posterPageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posterPageControl.numberOfPages = posters.count
        favoritePosterImage.image = UIImage(named: posters.first!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func posterPageControlAction(_ sender: UIPageControl) {
        favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
    }
    
    @IBAction func leftSwipeDone(_ sender: Any) {
        if posterPageControl.currentPage == 4 {
            posterPageControl.currentPage = 0
        } else {
            posterPageControl.currentPage = posterPageControl.currentPage + 1
        }
        favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
    }
    
    @IBAction func rightSwipeDone(_ sender: Any) {
        if posterPageControl.currentPage == 0 {
            posterPageControl.currentPage = posters.count - 1
        } else {
            posterPageControl.currentPage = posterPageControl.currentPage - 1
        }
        favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
    }
}
