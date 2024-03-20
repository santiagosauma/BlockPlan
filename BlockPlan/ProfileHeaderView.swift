//
//  ProfileHeaderView.swift
//  BlockPlan
//
//  Created by alumno on 20/03/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("Bitmoji")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text("Javier Cisneros")
                    .font(.headline)
                Text("¡Bienvenido!")
                    .font(.title)
            }
            Spacer()
        }
    }
}

#Preview {
    ProfileHeaderView()
}
