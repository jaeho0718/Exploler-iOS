//
//  PlantImageBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import UIImageColors

struct PlantImageBlock: View {
    @Binding var colors: UIImageColors?
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
                .onAppear { loadColors(uiImage: uiImage) }
        } else if let imageURL,
                  let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image.resizable().aspectRatio(contentMode: .fill)
                    .onAppear { loadColors(image: image) }
            } placeholder: {
                PlantImagePlaceholder()
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        } else {
            PlantImagePlaceholder()
        }
    }
    
    @MainActor 
    private func loadColors(image: Image) {
        let renderer = ImageRenderer(content: image)
        guard let uiImage = renderer.uiImage else { return }
        self.colors = uiImage.getColors()
    }
    
    @MainActor
    private func loadColors(uiImage: UIImage) {
        self.colors = uiImage.getColors()
    }
}

#Preview {
    PlantImageBlock(colors: .constant(nil))
}
