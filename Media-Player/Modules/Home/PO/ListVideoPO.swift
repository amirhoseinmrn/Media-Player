//
//  ListVideoPO.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

protocol ListVideoPO: AnyObject {
    var listVideoService: ListVideoServiceProtocol { get }
    var listVideoResponse: Paginable<VideoModel>? { get set }
    var listVideoChangeHandler: ((BaseViewModelChange) -> Void)? { get set }
    func listVideo(request: ListVideoRequest, isRefresh: Bool)
}

extension ListVideoPO {
    func listVideo(request: ListVideoRequest, isRefresh: Bool) {
        emit(.didChangeNetworkActivityStatus(true))
        listVideoService.listVideos(request: request) { [weak self](result) in
            guard let strongSelf = self else { return }
            strongSelf.emit(.didChangeNetworkActivityStatus(false))
            switch result {
            case .success(let response):
                if isRefresh {
                    strongSelf.listVideoResponse = response
                } else {
                    strongSelf.listVideoResponse?.page = response.page
                    strongSelf.listVideoResponse?.perPage = response.perPage
                    strongSelf.listVideoResponse?.total = response.total
                    strongSelf.listVideoResponse?.data.append(contentsOf: response.data)
                }
                strongSelf.emit(.didSuccess)
            case .failure(let error):
                strongSelf.emit(.didError(error))
            case .cancel:
                strongSelf.emit(.cancel)
            }
        }
    }
    
    func emit(_ change: BaseViewModelChange) {
        listVideoChangeHandler?(change)
    }
}
