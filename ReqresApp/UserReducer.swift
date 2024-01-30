//
//  UserFeature.swift
//  ReqresApp
//
//  Created by r.n. hermann on 30/01/2024.
//

import ComposableArchitecture
import Combine
import Foundation

@ObservableState
struct UserState {
    var users: [User] = []
    var isLoading: Bool = false
}

enum UserAction {
    case fetchUsers
    case usersResponse([User])
}

@Reducer
struct UserReducer {
    var body: some Reducer<UserState, UserAction> {
        Reduce { state, action in
            switch action {
            case .fetchUsers:
                return .run { send in
                    let url = URL(string: "https://reqres.in/api/users?per_page=100")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let users = try decoder.decode(UsersResponse.self, from: data)
                    await send(.usersResponse(users.data))
                }
                
            case .usersResponse(let users):
                state.users = users
                return .none
            }
        }
    }
}
