//
//  ArticlesVC.swift
//  NY-Times-Most-Popular-Articles
//
//  Created by Mouayyad Taja on 21/01/2022.
//

import UIKit
import SwifterSwift

class ArticlesVC: BaseVC {

    //Outlets
    @IBOutlet weak var tableView: UITableView?
    
    //Properties
    private lazy var viewModel : ArticlesViewModel = {
        return ArticlesViewModel(dataSource: self.dataSource)
    }()
    private lazy var dataSource : ArticlesDataSource = {
        return ArticlesDataSource(onSelectItem: self.openArticleDetails(article:))
    }()
    
    //MARK: Initialize view model
    func prepareViewModel(){
        //Observe data
        setupObservable()
        
        //Get data
        getData()
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set navigation title
        self.navigationItem.title = "NY Times Most Popular"
        
        prepareViewModel()
    }
    
    //MARK: Setup UI
    override func setupViews(){
        setupTableView()
        createStateView(view: tableView)
    }

    //Prepare table view properities
    func setupTableView(){
        guard let tableView = tableView else {return}
        tableView.delegate = self.dataSource
        tableView.dataSource = self.dataSource
        tableView.register(nibWithCellClass: ArticleTVC.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.refreshControl = self.ref
        self.ref.isEnabled = false
    }
    
    
    //Observe data
    func setupObservable(){
        //observe items changes from view model
        self.viewModel.dataSource?.data.addObserver(self) { (items) in
            self.tableView?.refreshControl?.endRefreshing()
            if items.isEmpty {
                //Show state view empty
                self.stateView?.setStateNoDataFound()
            }else {
                //hide state view
                self.stateView?.setDataAvailable()
            }
            self.tableView?.reloadData()
        }
        
        //observe error change from view model
        self.viewModel.error.addObserver(self) { (error) in
            self.tableView?.refreshControl?.endRefreshing()
            
            if self.dataSource.data.value.isEmpty {
                //show error state view
                if let message = error?.localizedDescription {
                    self.stateView?.setServerError(title: "Error", message: message, retryAction: self.getData)
                }
            }else {
                //show error alert
                self.showAlert(title: "Error", message: error?.localizedDescription)
            }
        }
    }

    // MARK: - Methods
    func openArticleDetails(article: Article) {
        pushArticleDetailVC(article: article)
    }
    
    // MARK: - GetData
    func getData(){
        
        if !self.ref.isRefreshing {
            //Show loading
            self.stateView?.setStateLoading()
        }
        
        //fetch list items
        self.viewModel.getArticles()
    }
    
    override func getRefreshing() {
        self.getData()
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
