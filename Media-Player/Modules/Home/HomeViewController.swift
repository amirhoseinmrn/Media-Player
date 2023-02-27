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
        setEmptyMessage()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == " " || searchText.isEmpty {
            viewModel.listVideoResponse = nil
            viewModel.query = nil
            viewModel.listVideoService.dataRequest?.cancel()
            tableView.reloadData()
            setEmptyMessage()
            return
        }
        viewModel.query = searchText
        viewModel.listVideoResponse = nil
        viewModel.getListVideo(isRefresh: true)
        tableView.reloadData()
    }
    
    func setEmptyMessage() {
        tableView.setEmptyMessage("There is no video\n Please search in searchbar...")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
