//
//  WeatherService.swift
//  WeatherTrands
//
//  Created by Mac on 1/15/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import Alamofire


class WeatherService{
    
    func downloadData(withURL url: String, withCompletion completion: @escaping (_ data:[[String]]?,_ error:Error?) -> Void) {
        
        
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            Alamofire.request(url, method: .get).responseData(queue: DispatchQueue.global(qos: .userInitiated)
                , completionHandler: { (response) in
                    
                    if let error = response.result.error {
                        completion(nil, error)
                        return
                    }
                    
                    guard let data = response.data else {
                       // completion handler with error
                        // create our own error
                        //completion(nil, error)
                        return
                    }
                    
                    guard let texttData = String(data: data, encoding: String.Encoding.utf8) else {
                        return
                    }
                    
                    do {
                        let parsedTextData = try Parser.parse(textData: texttData)
                        
                        DispatchQueue.main.async {
                            completion(parsedTextData,nil)
                        }
                        
                    } catch let error as NSError {
                        print(error)
                    }
                    
            })
            
        }
        
        
    }
}
