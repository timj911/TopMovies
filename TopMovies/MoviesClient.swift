import UIKit

class MoviesClient: NSObject {
    
    func featchMovies(completion: @escaping ([NSDictionary]?)->()){
        
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json";
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            if error != nil {
                completion(nil)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                    completion(movies)
                    return
                }
            }
        }
        
        task.resume()
    }
}
