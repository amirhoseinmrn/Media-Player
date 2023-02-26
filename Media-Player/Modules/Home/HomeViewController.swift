//
//  HomeViewController.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    lazy var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        bind()
        viewModel.getListVideo(isRefresh: true)
    }
    
    func setupSearchBar() {
        searchBar.placeholder = "Search your video..."
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        HomeTableViewCell.register(for: tableView)
    }
}
