//
//  ArticleTVC.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import UIKit
import AFDateHelper
import SDWebImage

class ArticleTVC: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var articleIcon:UIImageView!

    var article : Article? {
        didSet {
            
            guard let article = article else {
                return
            }
            
            titleLabel?.text = article.title
            byLineLabel?.text = article.byline
            dateLabel?.text = article.publishedDate
            
            if let urlStr = article.imageUrl {
                let url = URL(string: urlStr)
                //Image Cache using SDWebImage
                articleIcon.sd_setShowActivityIndicatorView(true)
                articleIcon.sd_setIndicatorStyle(.gray)
                articleIcon.sd_setImage(with: url, placeholderImage: Constants.placeholderImage, options: SDWebImageOptions.delayPlaceholder, completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellUI()
    {
        self.titleLabel?.textColor = .Colors.primaryTextColor
        self.byLineLabel?.textColor = .Colors.secondryTextColor
        self.dateLabel?.textColor = .Colors.secondryTextColor
    }
}
