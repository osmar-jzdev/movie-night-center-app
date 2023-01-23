//
//  MoviesDetailsGenereTableViewCell.swift
//  NavigationApp
//
//  Created by Osmar Juarez on 29/09/22.
//

import UIKit

class MoviesDetailsGenereTableViewCell: UITableViewCell {

    @IBOutlet var labelMovieName: UILabel!
    
    @IBOutlet var labelMovieDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
