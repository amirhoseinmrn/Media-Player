//
//  DetailVideoViewModel.swift
//  Media-Player
//
//  Created by amir on 2/27/23.
//

import Foundation

class DetailVideoViewModel: BaseViewModel {
    var data: VideoModel
    
    init(data: VideoModel) {
        self.data = data
    }
}
