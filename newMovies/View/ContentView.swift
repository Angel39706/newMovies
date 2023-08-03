//
//  ContentView.swift
//  newMovies
//
//  Created by Angel Martinez on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    //Need observedObject to listen to the network manage
    @ObservedObject var networkManager = NetworkManager()

    
    var body: some View {
        NavigationView {
            List(networkManager.movies){ movies in
                let posterURL = URL(string: "https://image.tmdb.org/t/p/original" + movies.poster_path)
                    HStack(alignment: .top){
                        AsyncImage(url: posterURL) { postImage in
                            postImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                        } placeholder: {
                            Image(systemName: "popcorn.fill")
                        }
                        VStack(alignment: .leading){
                            Text(movies.title)
                                .lineLimit(1)
                            Text(movies.overview)
                                .font(.body)
                            .lineLimit(2)
                        }
                    }
            }
            .listStyle(.plain)
            .navigationTitle("New Releases 🍿")
        }
        //OnAppear is just like UIKit Overload
        .onAppear{
            //Calls getData function to start the network calls
            self.networkManager.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
