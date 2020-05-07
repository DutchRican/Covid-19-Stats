//
//  TabView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem{
                    Image(systemName: "chart.pie.fill")
                    Text("Stats")
            }
            InformationView()
                .tabItem{
                    Image(systemName: "info.circle")
                    Text("information")
            }
            PermissionsView()
                .tabItem{
                    Image(systemName: "exclamationmark.triangle")
                    Text("Copyrights")
            }
        }
    }
}


struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
