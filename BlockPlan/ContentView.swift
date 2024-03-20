import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PlaceViewModel()
    @State private var isShowingModal = false
    @State private var newName: String = ""

    let colors = [Color(hex: "#9FCFE6"), Color(hex: "#E69FBD"), Color(hex: "#9FE6AA"), Color(hex: "#E6D69F")]

    var body: some View {
        VStack {
            ProfileHeaderView().padding()
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(viewModel.places.indices, id: \.self) { index in
                    let place = viewModel.places[index]
                    Button(action: {
                    }) {
                        VStack {
                            Spacer()
                            Text(place.name)
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(Color.primary)
                        }
                        .frame(height: 100)
                        .background(colors[index % colors.count])
                        .cornerRadius(10)
                    }
                }
                Button(action: {
                    self.isShowingModal = true
                }) {
                    Image(systemName: "plus")
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground))
        .sheet(isPresented: $isShowingModal) {
            AddPlaceModalView(newName: $newName, isShowingModal: $isShowingModal) {
                self.viewModel.addPlace(name: self.newName, category: .personalLife)
                self.newName = ""
            }
        }
    }
}

struct AddPlaceModalView: View {
    @Binding var newName: String
    @Binding var isShowingModal: Bool
    var onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            TextField("Nombre del Cuadrado", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Agregar") {
                onDismiss()
                isShowingModal = false
            }
            .padding()

            Button("Volver") {
                isShowingModal = false
            }
            .padding()
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
