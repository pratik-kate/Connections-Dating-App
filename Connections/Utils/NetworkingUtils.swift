//
//  NetworkingUtils.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import Foundation

struct NetworkingUtils {
    
    /// Executes the `POST` Api's
    ///
    /// - Parameter url: endpoint url
    /// - Parameter parameters: input paramentes
    ///
    func executePostApi(url: String,
                    parameters: [String : Any],
                    onSuccess: @escaping ([String : AnyObject]) -> Void,
                    onFailure: @escaping () -> Void) {
        
        guard let endPointUrl = URL(string: url) else { return }
        
        // Creating the API request
        var request = URLRequest(url: endPointUrl)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("Request : \(request)")
        
        // Performing API call
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            do {
                
                let data = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                // Converting the given data dictionary to JSON
                if let theJSONData = try? JSONSerialization.data(
                    withJSONObject: data,
                    options: []) {
                    
                    let theJSONText = String(data: theJSONData,
                                             encoding: .ascii)
                    print("Response : \(theJSONText!)")
                }
                
                onSuccess(data)
                
            } catch {
                onFailure()
            }
            
        })
        
        task.resume()
        
    }
    
    /// Executes the `GET` Api's
    ///
    /// - Parameter url: endpoint url
    /// - Parameter heades: api headrs
    ///
    func executeGetApi(url: String,
                       headers: [String: String],
                       onSuccess: @escaping (Data) -> Void,
                       onFailure: @escaping () -> Void) {
        
        guard let endPointUrl = URL(string: url) else { return }
        
        // Preparing the API Request
        var request = URLRequest(url: endPointUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("Request : \(request)")
        
        // Adding the headers to the request
        headers.forEach{ header in
            
            request.addValue(header.value, forHTTPHeaderField: header.key)
            
        }
        
        // Performing the API call
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            do {
                
                let data = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                // Converting the given data dictionary to JSON
                if let theJSONData = try? JSONSerialization.data(
                    withJSONObject: data,
                    options: []) {
                    
                    let theJSONText = String(data: theJSONData,
                                             encoding: .ascii)
                    print("Response : \(theJSONText!)")
                    
                    onSuccess(theJSONData)
                }
            
            } catch {
                onFailure()
            }
            
        })
        
        task.resume()
        
    }
    
    /// Downloads the images
    ///
    /// - Parameter url: image url
    ///
    func downloadImage(from url: URL,
                       completion: @escaping (Data) -> Void) {
        
        performDataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            completion(data)
        }
    }
    
    /// Handles the data tasks
    func performDataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
