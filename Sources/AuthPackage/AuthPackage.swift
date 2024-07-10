// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

public class WebService {
    
    
    public init() {
        
    }
    
    public func fetchAPI<T: Codable>(url: URL, completion: @escaping (T?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else { return completion(nil) }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
