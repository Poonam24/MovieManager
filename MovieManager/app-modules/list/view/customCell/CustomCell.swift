//
//  CarCell.swift
//  CarListing
//
//  Created by Poonam on 14/12/21.
//

import Foundation
import UIKit

class CustomCell : UITableViewCell {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var overViewText: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
    var resultData : [Result]?
    
    weak var presenter : PresenterInterface?
    
    
    @IBAction func addToPlaylist(_ sender: UIButton) {
        let tag = sender.tag
        guard let resultData = resultData else {
            return
        }
        _  = resultData[tag];
        //updatePlayList(item);
        
    }
    
   // func updatePlayList()
    
    func configureCell(data : [Result], indexPath : Int) {

        resultData = data
        favoriteButton.tag = indexPath
        let dataToBePopulated =  data[indexPath]

        title.text = dataToBePopulated.title
        overViewText.text = "Rating - \(dataToBePopulated.vote_average)"
        dateTime.text = "Playlist1"
        
        let imageURLString = Image_BaseURL + dataToBePopulated.poster_path;
        guard let imageURL = URL.init(string: imageURLString) else {
            return
        }
        loadImage(forId: dataToBePopulated.id , imageURL : imageURL)

        self.detailView.bringSubviewToFront(favoriteButton)

    }

    func loadImage(forId: Int, imageURL :URL) {

        HttpClient.shared.downloadImage(forId : forId, imageURL: imageURL) { [weak self] (data, error) in
            if(error == nil) {
                guard let data = data else {
                    return
                }
                let image = UIImage.init(data: data)
                DispatchQueue.main.async {
                    self?.customImageView.image = image
                }
            }
        }
    }
}



