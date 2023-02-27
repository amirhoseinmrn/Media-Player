//
//  ListVideoServiceProtocol.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation
import Alamofire

protocol ListVideoServiceProtocol {
    var dataRequest: DataRequest? { get set }
    func listVideos(request: ListVideoRequest,
                    _ completion: @escaping (Result<Paginable<VideoModel>>) -> Void)
}
