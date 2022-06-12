//
//  ServiceManager.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import Foundation
import Alamofire
import PromiseKit

protocol ServiceManager {
    func callPostApi<T: Decodable>(_ url: String, methodType : MethodType, paramters: [String: Any]?) -> Promise<T>
    // Option Methods
    func checkAndCancelForTheRequest(_ url: String)
}

extension ServiceManager  {
    func checkAndCancelForTheRequest(_ url: String) {
        print("checkAndCancelForTheRequest Called")
    }
}

struct DefaultServiceManager: ServiceManager {
    
    static let shared = DefaultServiceManager()
    
    func checkAndCancelForTheRequest(_ url: String) {
        Alamofire.Session.default.session.getAllTasks { (tasks) in
            if tasks.count > 0 {
                for task in tasks {
                    if let str = task.originalRequest?.url?.absoluteString {
                        if str.localizedCaseInsensitiveContains(url){
                            task.cancel()
                        }
                    }
                }
            }
        }
    }
    
    func callPostApi<T: Decodable>(_ url: String, methodType: MethodType, paramters: [String : Any]?) -> Promise<T> {
        
        return Promise<T> { seal in
            
            AF.request(url, method: HTTPMethod(rawValue: methodType.rawValue), parameters: paramters, encoding: JSONEncoding.default, headers:HTTPHeaders.init(header)).responseDecodable(of: T.self, completionHandler: { (response) in
                guard response.response != nil else {
                    if let error = response.error {
                        seal.reject(error)
                    } else {
                        seal.reject(RuntimeError(MessageConstants.someThingWentWrong))
                    }
                    return
                }
                
                switch response.result {
                case let .success(value):
                    seal.fulfill(value)
                case let .failure(error):
                    seal.reject(error)
                }
            })
            .resume()
        }
    }
}

// MARK: - Method Type
enum MethodType: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}
