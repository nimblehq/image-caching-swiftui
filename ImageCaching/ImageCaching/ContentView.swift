//
//  ContentView.swift
//  ImageCaching
//
//  Created by Minh Pham on 22/11/2023.
//

import SwiftUI

struct ContentView: View {

    let test3MImageURL = "https://sample-videos.com/img/Sample-png-image-3mb.png"
//    let test5MImageURL = "https://sample-videos.com/img/Sample-png-image-5mb.png"
//    let test10MImageURL = "https://sample-videos.com/img/Sample-png-image-10mb.png"
//    let test20MImageURL = "https://sample-videos.com/img/Sample-png-image-20mb.png"
//    let test30MImageURL = "https://sample-videos.com/img/Sample-png-image-30mb.png"
    
    var body: some View {
        VStack {
            CachableRemoteImage(url: test3MImageURL)
                .frame(width: 200, height: 150, alignment: .center)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ContentView()
}
