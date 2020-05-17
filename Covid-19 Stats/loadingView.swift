//
//  loadingView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/17/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct loadingView: UIViewRepresentable {
    let shouldAnimate: Bool
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator =  UIActivityIndicatorView(style: .large)
        indicator.transform = CGAffineTransform(scaleX: 4, y: 4)
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        }
    }
}

struct loadingView_Previews: PreviewProvider {
    static var previews: some View {
        loadingView(shouldAnimate: true)
    }
}
