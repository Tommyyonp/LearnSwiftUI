//
//  DetailFood.swift
//  learnSwift
//
//  Created by Tommy Yon Prakoso on 05/05/22.
//

import SwiftUI

struct DetailFood: View {

    var name: String = "default"
    var price: Int = 0

    var body: some View {
            VStack {
                VStack (alignment: .leading) {
                    VStack (alignment: .leading) {
                        Text(name)
                            .font(.title)
                            .foregroundColor(.blue)
                        Text("\(price)")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 100)
//                .background(Color.red)
                Spacer()
            }
        }
    }

struct DetailFood_Preview: PreviewProvider {
    static var previews: some View {
        DetailFood()
    }
}

