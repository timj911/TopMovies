//
//  ViewModel.swift
//  TopMovies
//
//  Created by Neo Thobejane  on 2018/10/16.
//  Copyright © 2018 Neo Thobejane . All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var moviesClient : MoviesClient!
    var movies : [NSDictionary]?
    
    func featchMovies(completion: @escaping ()->()){
        moviesClient.featchMovies {
            movies in self.movies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(section : Int) -> Int {
        return movies?.count ?? 0
    }
    
    func titleForItemAtIndexPath(indexPath : IndexPath) -> String {
        return movies?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? "bump"
    }
}
