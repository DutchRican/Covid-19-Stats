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
            HeaderView()
            Spacer()
            VStack(alignment: .leading){
                Text("Data for the pie charts was sourced from the excellent work found here:")
                Button("cov19.cc"){
                    UIApplication.shared.open(URL(string: "https://cov19.cc/")!)
                }.padding([.top, .bottom])
                Text("This application is merely consuming their API that allows access to the data.").padding(.top)
            }.padding([.leading, .trailing])
            
            Divider().padding(.bottom)
            VStack(alignment: .leading){
                    Text("Images for the symptoms were sourced from:")
                    
                    Button("Goats and Soda article"){
                        UIApplication.shared.open(URL(string: "https://www.npr.org/sections/goatsandsoda/2020/05/06/850707907/from-loss-of-smell-to-covid-toes-what-experts-are-learning-about-symptoms")!)
                    }.padding(.top)
                }.padding([.leading, .trailing])
            
            Spacer()
            VStack{
                Button("The source code for this application is available"){
                    UIApplication.shared.open(URL(string: "https://github.com/DutchRican/Covid-19-Stats")!)
                }
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
