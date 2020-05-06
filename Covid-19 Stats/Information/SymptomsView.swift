//
//  Symptoms.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct SymptomsView: View {
    var body: some View {
        HStack{
            ForEach(["cough","sneeze","fart"], id: \.self) { item in
                VStack{
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                        .resizable()
                        .scaledToFit()
                    Text(item)
                    }.frame(width: 100, height: 100).padding()
            }
        }
    }
}

struct Symptoms_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
