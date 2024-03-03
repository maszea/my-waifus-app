//
//  HomeScreenViewModel.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import Foundation

class WaifuVM: ObservableObject {
    
    @Published var waifus: [Waifu] = []
    
    // MARK: Fetch the data from URL
    func fetchData() async {
        do {
            let fetchData = try await APIService().fetchData()
            DispatchQueue.main.async {
                self.waifus = fetchData
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}
