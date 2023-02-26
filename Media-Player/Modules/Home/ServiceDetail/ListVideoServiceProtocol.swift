//
//  ListVideoServiceProtocol.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

protocol ListVideoServiceProtocol {
    func listVideos(request: ListVideoRequest,
                    _ completion: @escaping (Result<Paginable<VideoModel>>) -> Void)
}
