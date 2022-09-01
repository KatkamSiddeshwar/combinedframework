//
//  ApiCaller.swift
//  Combined Framework
//
//  Created by Auriga on 29/08/22.
//

import Foundation
import Combine
import Alamofire
import SwiftyJSON

class ApiCaller {
    
    static let shared = ApiCaller()
    let Api = "https://reqres.in/api/products/3"
    
    private init() { }
    
    func getData() -> Future<[String], Error> {
        return Future<[String], Error> { promixe in
            AF.request(self.Api, method: .get, parameters: [:]).responseData {
                response in
                switch response.result {
                case .success:
                    var model = [String]()
                    let UserJSON : JSON = JSON(response.value!)
                    let color = UserJSON["data"]["color"].stringValue
                    let id = UserJSON["data"]["id"].stringValue
                    let pantone_value = UserJSON["data"]["pantone_value"].stringValue
                    let year = UserJSON["data"]["year"].stringValue
                    let name = UserJSON["data"]["name"].stringValue
                    model.append("Name : " + name)
                    model.append("Id : " + id)
                    model.append("Color : " + color)
                    model.append("Year : " + year)
                    model.append("Pantone Value : " + pantone_value)
                    promixe(.success(model))
                    break
                case .failure(_):
                    return
                }
            }
        }
    }
}
