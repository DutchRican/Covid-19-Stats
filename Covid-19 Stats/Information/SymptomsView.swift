//
//  Symptoms.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct SymptomsView: View {
    typealias symptomType = (image: String, title: String)
    let symptoms: [symptomType] = [(image: "chills", title: "Chills"), (image: "cough", title: "Cough"),(image: "fever", title: "Fever"),(image: "sneeze", title: "Sneezing"),(image: "low_energy", title: "Low Energy"),(image: "short_breath", title: "Shortness of breath")]
    var body: some View {
        HStack{
            ScrollView(.horizontal, content: {
                HStack {
                ForEach(symptoms, id: \.title) { (image, title) in
                    VStack{
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text(title)
                            .font(.caption)
                    }
                    }
                }}
            )
        }
    }
}

struct Symptoms_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
