//
//  ListVideoService.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation
import Alamofire

class ListVideoService: BaseService,
                        ListVideoServiceProtocol {
    var dataRequest: DataRequest?
    
    func listVideos(request: ListVideoRequest,
                    _ completion: @escaping (Result<Paginable<VideoModel>>) -> Void) {
        let url = "https://api.vimeo.com/videos"
        dataRequest?.cancel()
        dataRequest = AF.request(url,
                                 method: .get,
                                 parameters: request.dictionary,
                                 encoding: URLEncoding(destination: .queryString),
                                 headers: header)
        .validate(statusCode: 200..<300)
        .responseData { (response) in
            switch response.result {
            case .success(let data):
                let result: Result<Paginable<VideoModel>> = BaseSerializer.shared.paginableSerialize(data: data)
                completion(result)
            case .failure(let error):
                switch response.error {
                case .explicitlyCancelled:
                    completion(Result<Paginable<VideoModel>>.cancel)
                default:
                    let errorModel = self.checkErrorMessage(response, error: error)
                    let result = Result<Paginable<VideoModel>>.failure(errorModel)
                    completion(result)
                }
            }
        }
    }
}
