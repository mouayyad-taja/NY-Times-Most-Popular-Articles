//
//  ArticleDetailVC.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import UIKit
import SDWebImage

class ArticleDetailVC: BaseVC {
    
    //Outlets
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var descLabel:UILabel!
    @IBOutlet weak var articleIcon:UIImageView!

    //Properties
    private var viewModel : ArticleDetailViewModel?
    
    //MARK: Initialize view model
    func initialize(article: Article){
        self.viewModel = ArticleDetailViewModel(article: article)
    }
    
    func prepareViewModel(){
        //Observe data
        setupObservable()
    }
    
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set navigation title
//        self.navigationItem.title = "NY Times Most Popular"
        
        prepareViewModel()
    }
    
    //MARK: Setup UI
    override func setupViews(){
        self.titleLabel?.textColor = .Colors.primaryTextColor
        self.byLineLabel?.textColor = .Colors.secondryTextColor
        self.dateLabel?.textColor = .Colors.secondryTextColor
        self.descLabel?.textColor = .Colors.primaryTextColor
    }

    
    //Observe data
    func setupObservable(){
        //observe items changes from view model
        self.viewModel?.item.addAndNotify(self) { [weak self](article) in
            guard let self = self, let article = article else {return}
            self.fillData(article: article)
        }
        
    }
    
    func fillData(article: Article){
        titleLabel?.text = article.title
        byLineLabel?.text = article.byline
        dateLabel?.text = article.publishedDate
        descLabel?.text = article.abstract
        
        if let urlStr = article.largeImageUrl {
            let url = URL(string: urlStr)
            //Image Cache using SDWebImage
            articleIcon.sd_setShowActivityIndicatorView(true)
            articleIcon.sd_setIndicatorStyle(.medium)
            articleIcon.sd_setImage(with: url, placeholderImage: Constants.placeholderImage, options: SDWebImageOptions.delayPlaceholder, completed: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIViewController {
    func pushArticleDetailVC(article: Article){
        let vc = ControllerManager.main.articleDetailVC
        vc.initialize(article: article)
        self.navigationController?.pushViewController(vc, completion: nil)
    }
}
