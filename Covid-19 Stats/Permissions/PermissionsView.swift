//
//  PermissionsView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/7/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct PermissionsView: View {
    var body: some View {
        VStack{
            HeaderView(items: .constant([]), isLoading: .constant(false))
            Spacer()
            VStack(alignment: .leading){
                Text("Data for the pie charts was sourced from the excellent work found here:")
                    .padding(.top)
                Button("cov19.cc"){
                    UIApplication.shared.open(URL(string: "https://cov19.cc/")!)
                }.font(.title)
                Text("This application is merely consuming their API that allows access to the data.").padding([.top, .bottom])
            }
            
            Divider()
            VStack(alignment: .leading){
                Text("Images for the symptoms were sourced from:")
                    .padding(.top)
                
                Button("Goats and Soda article"){
                    UIApplication.shared.open(URL(string: "https://www.npr.org/sections/goatsandsoda/2020/05/06/850707907/from-loss-of-smell-to-covid-toes-what-experts-are-learning-about-symptoms")!)
                }.font(.title)
            }
            Divider()
            Spacer()
            VStack{
                Button("Here's the Source Code"){
                    UIApplication.shared.open(URL(string: "https://github.com/DutchRican/Covid-19-Stats")!)
                }.font(.title)
            }
            Spacer()
        }
    }
}

struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}
