//
//  WaifuCardView.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import SwiftUI

struct WaifuCardView: View {
    
    let waifu: Waifu
    
    var body: some View {
        AsyncImage(url: waifu.imageURL) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    WaifuCardView(waifu: Waifu(imageID: 1, url: "https://cdn.waifu.im/7207.jpg"))
}
