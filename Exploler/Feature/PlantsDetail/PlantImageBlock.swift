//
//  PlantImageBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantImageBlock: View {
    var imageData: Data?
    var imageURL: String?
    
    var body: some View {
        if let imageData,
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        } else if let imageURL,
                  let url = URL(string: imageURL) {
            AsyncImage(url: url) { phase in
                phase.image?.resizable().aspectRatio(contentMode: .fill)
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        } else {
            EmptyView()
        }
    }
}

#Preview {
    PlantImageBlock()
}
