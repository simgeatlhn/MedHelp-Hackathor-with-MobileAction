//
//  NotificationsListView.swift
//  MedHelp
//
//  Created by simge on 17.12.2022.
//


import SwiftUI

struct NotificationsListView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    @Environment(\.scenePhase) var scenePhase
    @State private var scheduleDate = Date()
    
    var body: some View {
        
        NavigationView {
            VStack {
                if lnManager.isGranted {
                    GroupBox {
                        DatePicker("", selection: $scheduleDate)
                            .datePickerStyle(.graphical)
                    }
                    .frame(width: 400)
                    
                    .padding(.bottom, 8)
                    Button("Hatırlatıcı Oluştur") {
                        Task {
                            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: scheduleDate)
                            let localNotification = LocalNotification(identifier: UUID().uuidString,
                                                                      title: "İlaç Vakti",
                                                                      body: "Tansiyon ilacını almayı unutma ♥️",
                                                                      dateComponents: dateComponents,
                                                                      repeats: false)
                            await lnManager.schedule(localNotification: localNotification)
                        }
                    }
                    .frame(width: 180, height: 60)
                    .background(DarkBlue)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    List {
                        ForEach(lnManager.pendingRequests, id: \.identifier) { request in
                            VStack(alignment: .leading) {
                                Text(request.content.title)
                                HStack {
                                    Text(request.identifier)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    lnManager.removeRequest(withIdentifier: request.identifier)
                                }
                            }
                        }
                    }
                } else {
                    Button("Enable Notifications") {
                        lnManager.openSettings()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Takvim")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        lnManager.clearRequests()
                    } label: {
                        Image(systemName: "clear.fill")
                            .imageScale(.large)
                            .cornerRadius(20)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .active {
                Task {
                    await lnManager.getCurrentSettings()
                    await lnManager.getPendingRequests()
                }
            }
        }
    }
}

struct NotificationsListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsListView()
            .environmentObject(LocalNotificationManager())
    }
}

