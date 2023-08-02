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
                HStack{
                    Image(systemName: "popcorn.fill")
                        .resizable()
                        .frame(width: 60,height: 60)
                    VStack{
                        Text(movies.title)
                            .font(.title3)
                            .frame(alignment: .leading)
                        Text(movies.overview)
                            .font(.body)
                        .lineLimit(2)                    }
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
