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
        let isSearch = viewModel.isSearch
        let searchCount = viewModel.searchData.count
        let dataCount = viewModel.listVideoResponse?.data.count ?? 0
        let count = isSearch ? searchCount : dataCount
        if viewModel.listVideoResponse == nil {
            return count
        } else if count == 0 {
            tableView.setEmptyMessage("There is no Data\n Refresh to get new Video")
        } else {
            tableView.restore()
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nameOfClass,
                                                 for: indexPath) as? HomeTableViewCell
        if let data = indexPathData(indexPath: indexPath) {
            cell?.config(data: data)
        }
        loadNewData(indexPath: indexPath)
        return cell ?? UITableViewCell()
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
    
    func indexPathData(indexPath: IndexPath) -> VideoModel? {
        let isSearch = viewModel.isSearch
        if isSearch {
            let searchData = viewModel.searchData[indexPath.row]
            return searchData
        } else if let data = viewModel.listVideoResponse?.data[indexPath.row] {
            return data
        }
        return nil
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        searchBar.endEditing(true)
        guard let data = indexPathData(indexPath: indexPath) else { return }
        let detailVideoViewModel = DetailVideoViewModel(data: data)
        let vc = DetailVideoViewController(viewModel: detailVideoViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
