//
//  ArticlesTableViewCell.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    //MARK: Variables

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var mediaImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
