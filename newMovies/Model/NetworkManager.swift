//
//  NetworkManager.swift
//  newMovies
//
//  Created by Angel Martinez on 8/2/23.
//

import Foundation

//Declare observable object to broadcast properties when called across views
class NetworkManager: ObservableObject {
    
    //need a published variable to notify listeners when there is changes
    @Published var movies = [Movies]()

    
    //Create function to get data (downloading only)
    func getData() {
        //if the url exists we want to convert to URL
        if let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=8f56a790145a7d0c4ae3a695fded9527") {
            //Upon success start session
            let session = URLSession(configuration: .default)
            //starts the tasks to receive data from the API
            let task = session.dataTask(with: url) { (data, response, error) in
                //If the url is reachable with no errors then we can proceed to check for data
                if error == nil {
                    //Decode data in JSON file
                    let decoder = JSONDecoder()
                    //If data is found in JSON then continue through the do block
                    if let SafeData = data {
                        do {
                            //results then retrieves all decoded data from JSON
                            let results = try decoder.decode(Results.self, from: SafeData)
                            DispatchQueue.main.async {
                                //Updates the view when there is changes by retrieving data from the JSON upon succession of getting results
                                self.movies = results.results
                            }
                        } catch {
                            //In the catch block we will run the error if the data is not reachable or readable
                            print(error)
                        }
                    }
                }
            }
            //Networking tasks starts here
            task.resume()
        }
    }
}
