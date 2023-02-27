//
//  HomeViewController+TableView.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = viewModel.listVideoResponse?.data
        let count = data?.count ?? 0
        if data == nil {
            return count
        } else {
            tableView.restore()
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellBuilder = HomeCellBuilder()
        let cell = tableCellBuilder.build(type: .video,
                                          tableView: tableView,
                                          indexPath: indexPath)
        if let data = viewModel.listVideoResponse?.data[indexPath.row] {
            cell.config(data: data)
        }
        loadNewData(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func loadNewData(indexPath: IndexPath) {
        let dataCount = viewModel.listVideoResponse?.data.count ?? 0
        let totalItems = viewModel.listVideoResponse?.total ?? 0
        if indexPath.row == dataCount - 1 {
            if totalItems > dataCount {
                viewModel.getListVideo()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        searchBar.endEditing(true)
        guard let data = viewModel.listVideoResponse?.data[indexPath.row] else { return }
        let detailVideoViewModel = DetailVideoViewModel(data: data)
        let vc = DetailVideoViewController(viewModel: detailVideoViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
