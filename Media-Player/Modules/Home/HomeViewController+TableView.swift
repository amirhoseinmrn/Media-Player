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
        let count = viewModel.listVideoResponse?.data.count ?? 0
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
        if let data = viewModel.listVideoResponse?.data[indexPath.row] {
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
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVideoViewController()
        vc.title = "Title \(indexPath.row)"
        navigationController?.pushViewController(vc, animated: true)
    }
}
