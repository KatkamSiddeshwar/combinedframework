//
//  CustomCell.swift
//  Combined Framework
//
//  Created by Auriga on 29/08/22.
//

import UIKit
import Combine

class CustomCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    let action = PassthroughSubject<String, Never>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        action.send("cool button was tapped")
    }
}
