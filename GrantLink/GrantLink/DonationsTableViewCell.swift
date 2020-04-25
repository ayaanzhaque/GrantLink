//
//  DonationsTableViewCell.swift
//  GrantLink
//
//  Created by Viraaj Reddi on 4/25/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class DonationsTableViewCell: UITableViewCell {

        @IBOutlet var myImageVIew: UIImageView!
    
    @IBOutlet var myLabel: UILabel!
    
    static let identifier = "donationsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "donationsCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String) {
        myLabel.text = title
        myImageVIew.image = UIImage(systemName: imageName)
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
