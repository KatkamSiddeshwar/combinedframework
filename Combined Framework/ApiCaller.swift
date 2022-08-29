//
//  ApiCaller.swift
//  Combined Framework
//
//  Created by Auriga on 29/08/22.
//

import Foundation
import Combine

class ApiCaller {
    
    static let shared = ApiCaller()
    
    private init() { }
    
    func getData() -> Future<[String], Error> {
        return Future<[String], Error> { promixe in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                promixe(.success(["AurigaIT", "Apple", "Microsoft"]))
            }
        }
    }
}
