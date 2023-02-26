//
//  HomeViewController+Binding.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

extension HomeViewController {
    func bind() {
        bindListVideo()
    }
    
    func bindListVideo() {
        viewModel.listVideoChangeHandler = { [weak self] change in
            guard let strongSelf = self else { return }
            switch change {
            case .didChangeNetworkActivityStatus(_):
                strongSelf.tableView.setEmptyMessage("Loading data...")
                break
            case .didSuccess:
                strongSelf.tableView.reloadData()
            case .didError(let error):
                strongSelf.tableView.setEmptyMessage(error.localizedDescription)
                strongSelf.tableView.reloadData()
            }
        }
    }
}
