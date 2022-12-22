//
//  ViewController.swift
//  ProtocolDelegate_Cell
//
//  Created by Alessio Di Nardo on 20/12/22.
//

import UIKit

struct MovieInformation {
    let poster: String
    let name: String
    let releaseDate: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MovieTableViewCellProtocol {

    //MARK: Outlets
    @IBOutlet weak var movieTableView: UITableView!
    
    // array of structure
    var movieInfo: [MovieInformation] = []
    
    // movie details create
    var avengerDetail: MovieInformation = MovieInformation(poster: "avengers-4", name: "Avengers", releaseDate: "3 May 2019")
    var starwarsDetail: MovieInformation = MovieInformation(poster: "star-wars", name: "Star Wars", releaseDate: "20 December 2019")
    var wonderWomanDetail: MovieInformation = MovieInformation(poster: "batman", name: "Batman", releaseDate: "1 November 2019")
    
    // attributes for attributed string
    let myAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 18)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // movie details added into the array of structure
        movieInfo.append(avengerDetail)
        movieInfo.append(starwarsDetail)
        movieInfo.append(wonderWomanDetail)
        
        movieTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        //movieTableView.register(CustomTableViewCell(), forCellReuseIdentifier: "CustomTableViewCell")
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        movieTableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0,1,2:

            cell.imgPoster.image = UIImage(named: movieInfo[indexPath.row].poster)
            cell.lblName.text = movieInfo[indexPath.row].name
            cell.lblRelease.text = movieInfo[indexPath.row].releaseDate
            
            cell.delegate = self
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
            else {
                return UITableViewCell()
            }
            return cell
        default:
            break
        }
        return cell
    }
    
    //MARK: check movie is like or unliked
    func movieLiked(_ sender: MovieTableViewCell, isLiked: Bool) {
        
        //fetch tapped indexPath
        guard let tappedIndexPath = movieTableView.indexPath(for: sender) else { return }
        
        //MARK: alert values set and call
        let alertTitle = NSMutableAttributedString(string: isLiked ? "Like" : "Unlike")
        let strLike = NSMutableAttributedString(string: isLiked ? "You liked " : "You disliked ")
        let strMovieName = NSMutableAttributedString(string: movieInfo[tappedIndexPath.row].name, attributes: myAttributes)
        
        let strMovie = NSMutableAttributedString(string: " movie")
        
        strLike.append(strMovieName)
        strLike.append(strMovie)
        
        let alertMsg = strLike
        
        //MARK: selected cell fetch
        //let cell = movieTableView.cellForRow(at: tappedIndexPath) as! MovieTableViewCell
        //MARK: set button image based on liked or unliked
        /*
        if isLiked {
            cell.btnLike.setImage(UIImage(named: "icon_liked"), for: .normal)
            cell.btnUnlike.setImage(UIImage(named: "icon_dislike"), for: .normal)
        } else {
            cell.btnUnlike.setImage(UIImage(named: "icon_disliked"), for: .normal)
            cell.btnLike.setImage(UIImage(named: "icon_like"), for: .normal)
        }
         */
        
        displayAlert(title: alertTitle, msg: alertMsg)
    }
    
    //MARK: setup alert
    func displayAlert(title: NSMutableAttributedString, msg: NSMutableAttributedString) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        //alert.setValue(msg, forKey: "attributedTitle")
        alert.setValue(msg, forKey: "attributedMessage")
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

