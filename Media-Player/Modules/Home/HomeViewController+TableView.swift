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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nameOfClass,
                                                 for: indexPath) as? HomeTableViewCell
        cell?.config(indexpath: indexPath)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
