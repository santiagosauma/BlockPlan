//
//  SwiftUIView.swift
//  BlockPlan
//
//  Created by alumno on 20/03/24.
//

import SwiftUI

struct Square: Identifiable {
    var id = UUID()
    var name: String
}

struct SquaresView: View {
    @State private var squares: [Square] = []
    @State private var isShowingModal = false
    @State private var newName: String = ""

    var body: some View {
        VStack {
            Spacer()
            ForEach(squares) { square in
                Text(square.name)
                    .frame(width: 100, height: 100)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.bottom, 5)
            }
            Button(action: {
                self.isShowingModal = true
            }) {
                Image(systemName: "plus")
                    .frame(width: 100, height: 100)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            .sheet(isPresented: $isShowingModal) {
                // Esta es la hoja modal para ingresar el nombre del nuevo cuadrado
                ModalView(newName: $newName) {
                    // Esta clausura se llama cuando se cierra la hoja modal
                    let newSquare = Square(name: self.newName)
                    self.squares.append(newSquare)
                    self.newName = "" // Resetea el nombre para el próximo uso
                }
            }
        }
    }
}

struct ModalView: View {
    @Binding var newName: String
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nuevo Cuadrado")
            TextField("Nombre del Cuadrado", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Agregar") {
                onDismiss()
            }
        }
        .padding()
    }
}

struct SquaresView_Previews: PreviewProvider {
    static var previews: some View {
        SquaresView()
    }
}

#Preview {
    SwiftUIView()
}
