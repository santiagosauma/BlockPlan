//
//  MainTabView.swift
//  BlockPlan
//
//  Created by alumno on 20/03/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            WorkspacesView()
                .tabItem {
                    Image("Configuracion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("Workspaces")
                }
            
            CustomBlockView()
                .tabItem {
                    Image("customIcon")
                    Text("Bloque Personalizado")
                }
            
            CalendarView()
                .tabItem {
                    Image("calendarIcon")
                    Text("Calendario")
                }
            
            SettingsView()
                .tabItem {
                    Image("settingsIcon")
                    Text("Configuración")
                }
        }
    }
}

struct WorkspacesView: View {
    var body: some View {
        Text("Contenido de Workspaces")
    }
}

struct CustomBlockView: View {
    var body: some View {
        Text("Contenido de Bloque Personalizado")
    }
}

struct CalendarView: View {
    var body: some View {
        Text("Contenido de Calendario")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Contenido de Configuración")
    }
}

#Preview {
    MainTabView()
}
