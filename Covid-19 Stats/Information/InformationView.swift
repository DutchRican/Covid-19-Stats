//
//  InformationView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack {
            HeaderView()
            VStack(alignment: .leading) {
                Spacer()
                SymptomsView()
                VStack(alignment: .leading){
                    Text("Other symptoms may include: ")
                    Text("Loss of smell, headaches, muscle pains")
                    
                    Button(action: {
                        UIApplication.shared.open(URL(string:
                            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019")!)
                    }) {
                        Text("See more information at www.who.int").padding(.top)
                    }
                }.padding()
                Spacer()
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
