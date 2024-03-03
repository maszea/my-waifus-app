//
//  HomeScreen.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var viewModel = WaifuVM()
    
    var body: some View {
        NavigationView() {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .center, spacing: 14) {
                    ForEach(viewModel.waifus, id: \.id) { waifu in
                        WaifuCardView(waifu: waifu)
                    }
                    
                    Button("Refresh") {
                        Task {
                            await viewModel.fetchData()
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .navigationTitle("My Waifus 😻")
            }
            .padding()
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    HomeScreen()
}
