//
//  PartyTableViewCell.swift
//  Party Rock Manison
//
//  Created by Mark Rabins on 11/22/16.
//  Copyright © 2016 self.edu. All rights reserved.
//

import UIKit

class PartyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        // TODO: set image from URL
    }

}
