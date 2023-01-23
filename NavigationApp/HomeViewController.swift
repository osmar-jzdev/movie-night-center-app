//
//  HomeViewController.swift
//  NavigationApp
//
//  Created by Osmar Juarez on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var cardView: UIImageView!
    
    let movieDataManager = MovieDataManager()
    let genereDataManaer = GenereDataManager()
    var selectedGenere = ""
    
    @IBOutlet var GenereCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //movieDataManager.fetch(generes: defaultGenere)
        genereDataManaer.fetch()
        GenereCollectionView.dataSource = self
    }
    
    @IBAction func viewDetailButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailSegue", sender: Self.self)
    }
    
    /**
     With this method we tell de controller how many cells we need in our collection view created
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genereDataManaer.genereCount()
    }
    
    /**
     With this method we tell the controller what we need to display in the cell inside of the collection view created.
     We previusly created a custom collection view cell with two atributes:
     -One to display the genere (a label)
     -One to display an icon realetd to the genere (an image)
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genereCollectionViewCell", for: indexPath) as! GenereCollectionViewCell
        let genereInfo = genereDataManaer.genereAt(index: indexPath.row).genere
        cell.genereLabel.text = genereInfo
        cell.genereIconImage.image =  UIImage(named: genereInfo)
        return cell
    }
    
    /**
     Whit this method we can add  more funtionality to a cell when is selected
     */
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         //let cell = collectionView.cellForItem(at: indexPath)
         selectedGenere = genereDataManaer.genereValue(index: indexPath.row)
         performSegue(withIdentifier: "detailSegue", sender: Self.self)
    }
    
    /**
     With this method we can send information to the next screen connected with some segue id defined
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.receivedGenere = selectedGenere
    }
}
