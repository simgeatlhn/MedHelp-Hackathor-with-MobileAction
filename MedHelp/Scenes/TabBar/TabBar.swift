//
//  TabBar.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI

struct TabBar: View {
    @StateObject var lnManager = LocalNotificationManager()
    var body: some View {
        TabView {
            HomeView(pills: MedHelpModel.allPill)
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "ellipsis.bubble")
                }
            NotificationsListView()
                .environmentObject(lnManager)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .accentColor(mainColor)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(MedHelpViewModel())
    }
}
