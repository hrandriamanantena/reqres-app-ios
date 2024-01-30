//
//  ReqresAppApp.swift
//  ReqresApp
//
//  Created by r.n. hermann on 30/01/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct ReqresAppApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView(store: Store(initialState: UserReducer.State()) {
                UserReducer()
            })
        }
    }
}
