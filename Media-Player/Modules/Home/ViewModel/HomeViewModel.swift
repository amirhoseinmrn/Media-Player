//
//  HomeViewModel.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

class HomeViewModel: BaseViewModel,
                     ListVideoPO {
    var listVideoService: ListVideoServiceProtocol
    var listVideoResponse: Paginable<VideoModel>?
    var listVideoChangeHandler: ((BaseViewModelChange) -> Void)?
    
    var query: String?
    
    init(listVideoService: ListVideoServiceProtocol = ListVideoService()) {
        self.listVideoService = listVideoService
    }
}

extension HomeViewModel {
    func getListVideo(isRefresh: Bool = false) {
        var page = (listVideoResponse?.page ?? 0) + 1
        if isRefresh { page = 1 }
        guard let query = query else { return }
        let request = ListVideoRequest(page: page, query: query)
        listVideo(request: request, isRefresh: isRefresh)
    }
}
