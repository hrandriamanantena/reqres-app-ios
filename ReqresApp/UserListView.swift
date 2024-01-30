//
//  UserListView.swift
//  ReqresApp
//
//  Created by r.n. hermann on 30/01/2024.
//

import SwiftUI
import ComposableArchitecture

struct UserListView: View {
    let store: StoreOf<UserReducer>
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    if store.isLoading {
                        ProgressView()
                    } else {
                        LazyVStack(alignment: .leading) {
                            ForEach(store.users, id: \.id) { user in
                                HStack {
                                    Text(String(user.firstName.first ?? "-"))
                                        .frame(width: 50, height: 50)
                                        .background(Color(.systemGray6))
                                        .foregroundColor(.black)
                                        .cornerRadius(25)
                                        .font(.headline)
                                    VStack(alignment: .leading) {
                                        Text("\(user.firstName) \(user.lastName)")
                                            .font(.headline)
                                        Text(user.email)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(20)
                            }
                        }
                    }
                }
                .navigationTitle("Users")
            }
        }
        .onAppear {
            store.send(.fetchUsers)
        }
    }
}
