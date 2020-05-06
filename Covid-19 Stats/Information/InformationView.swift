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
            Spacer()
            SymptomsView()
            VStack(alignment: .leading){
                Text("Other information to come")
                Text("No Idea yet")
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
