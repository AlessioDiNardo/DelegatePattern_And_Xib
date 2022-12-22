//
//  MovieTableViewCell.swift
//  ProtocolDelegate_Cell
//
//  Created by Alessio Di Nardo on 20/12/22.
//

import Foundation
import UIKit

// MARK: protocol created
protocol MovieTableViewCellProtocol: AnyObject {
    func movieLiked(_ sender: MovieTableViewCell, isLiked: Bool)
}

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnUnlike: UIButton!
    
    //delegate variable create for protocol
    weak var delegate: MovieTableViewCellProtocol?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: call protocol method when user click on like button
    @IBAction func movieLiked(_ sender: UIButton) {
        delegate?.movieLiked(self, isLiked: true)
    }
    
    //MARK: call protocol method when user click on unlike button
    @IBAction func movieUnliked(_ sender: Any) {
        delegate?.movieLiked(self, isLiked: false)
    }
    
}
