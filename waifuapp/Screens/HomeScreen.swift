//
//  HomeScreen.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var viewModel = WaifuVM()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView() {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 14) {
                    Picker("Pick your poison 💀", selection: $selectedTab) {
                        Text("SFW").tag(0)
                        Text("NSFW 💦").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 14)
                    
                    // Display content based on the selected tab
                    if selectedTab == 0 {
                        // SFW content
                        ForEach(viewModel.sfwWaifus, id: \.id) { waifu in
                            WaifuCardView(waifu: waifu)
                        }
                    } else {
                        // NSFW content
                        ForEach(viewModel.nsfwWaifus, id: \.id) { waifu in
                            WaifuCardView(waifu: waifu)
                        }
                    }
                }
                .navigationTitle("My Waifus 😻")
            }
            // Call appropriate refresh method based on the selected tab
            .refreshable {
                if selectedTab == 0 {
                    await viewModel.fetchDataSFW()
                } else {
                    await viewModel.fetchDataNSFW()
                }
            }
            .padding()
        }
        .onChange(of: selectedTab) {
            Task {
                if selectedTab == 0 {
                    await viewModel.fetchDataSFW()
                } else {
                    await viewModel.fetchDataNSFW()
                }
            }
        }
        .onAppear {
            Task {
                if selectedTab == 0 {
                    await viewModel.fetchDataSFW()
                } else {
                    await viewModel.fetchDataNSFW()
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}


//                    HStack {
//                        Button("NSFW") {
//                            Task {
//                                await viewModel.fetchDataNSFW()
//                            }
//                        }
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.red)
//                        .cornerRadius(8)
//
//                        Button("Refresh") {
//                            Task {
//                                await viewModel.fetchData()
//                            }
//                        }
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                    }
