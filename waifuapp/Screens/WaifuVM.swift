//
//  HomeScreenViewModel.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import Foundation

class WaifuVM: ObservableObject {
    
    @Published var sfwWaifus: [Waifu] = []
    @Published var nsfwWaifus: [Waifu] = []
    
    
    // MARK: Fetch the data from URL
    func fetchDataSFW() async {
        do {
            let fetchDataSFW = try await APIService().fetchDataSFW()
            DispatchQueue.main.async {
                self.sfwWaifus = fetchDataSFW
            }
        } catch {
            print("DEUBG: Error fetching SFW data: \(error.localizedDescription)")
        }
    }
    
    func fetchDataNSFW() async {
        do {
            let fetchDataNSFW = try await APIService().fetchDataNSFW()
            DispatchQueue.main.async {
                self.nsfwWaifus = fetchDataNSFW
            }
        } catch {
            print("DEBUG: Error fetching NSFW data: \(error.localizedDescription)")
        }
    }
}
