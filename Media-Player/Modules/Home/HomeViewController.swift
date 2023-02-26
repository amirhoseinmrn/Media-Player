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
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        HomeTableViewCell.register(for: tableView)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.searchData = []
            viewModel.isSearch = false
            tableView.reloadData()
            return
        }
        let data = viewModel.listVideoResponse?.data ?? []
        let searchData = data.filter {
            let name = $0.name ?? ""
            return name.lowercased().contains(searchText.lowercased())
        }
        viewModel.searchData = searchData
        viewModel.isSearch = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
