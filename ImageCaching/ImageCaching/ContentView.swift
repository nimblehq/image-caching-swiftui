//
//  ContentView.swift
//  ImageCaching
//
//  Created by Minh Pham on 22/11/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var reloadCounter = 0

    let test200KBImageURL = "https://sample-videos.com/img/Sample-png-image-100kb.png"
    let test500KBImageURL = "https://sample-videos.com/img/Sample-png-image-500kb.png"
    let test1MImageURL = "https://sample-videos.com/img/Sample-png-image-1mb.png"

//    let test100KBImageURL = "https://sample-videos.com/img/Sample-png-image-100kb.png"
//    let test3MImageURL = "https://sample-videos.com/img/Sample-png-image-3mb.png"
//    let test5MImageURL = "https://sample-videos.com/img/Sample-png-image-5mb.png"
//    let test10MImageURL = "https://sample-videos.com/img/Sample-png-image-10mb.png"
//    let test20MImageURL = "https://sample-videos.com/img/Sample-png-image-20mb.png"
//    let test30MImageURL = "https://sample-videos.com/img/Sample-png-image-30mb.png"
    
    var body: some View {
        VStack {
            CachableRemoteImage(url: test200KBImageURL)
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(10)
            CachableRemoteImage(url: test500KBImageURL)
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(10)
            CachableRemoteImage(url: test1MImageURL)
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(10)
            Button("Reload \(reloadCounter)") {
                reloadCounter += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
