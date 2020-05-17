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
            HeaderView(items: .constant([]), isLoading: .constant(false))
            Spacer()
            VStack(alignment: .leading) {
                ZStack{
                SymptomsView()
                    HStack {
                        Image(systemName: "chevron.compact.left")
                        Spacer()
                        Image(systemName: "chevron.compact.right")
                    }.padding(.bottom)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .font(.system(size: 80))
                }.padding(.bottom)
                VStack(alignment: .leading){
                    Text("Disclaimer:").font(.title).underline().padding(.bottom)
                    Text("There are many other symptoms and this is not and exhaustive list.\n\nPlease make sure that you check the link below for more accurate and often updates.")
                    
                    Button(action: {
                        UIApplication.shared.open(URL(string:
                            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019")!)
                    }) {
                        Text("See more information at www.who.int").padding(.top)
                    }
                }.padding()
                Divider()
                VStack {
                    Text("You may force a data refresh by double tapping the title while on the Stats view.")
                }.padding()
            }
            Spacer()
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
