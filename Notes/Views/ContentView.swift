//
//  ContentView.swift
//  Notes
//
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            NavigationLink {
                NoteListView()
                    .onTapGesture {
                        let auth = Auth.auth()
                        auth.signInAnonymously { result, error in
                            if let error = error {
                                print("error logging in anonymously because \(error.localizedDescription)")
                                return
                            }
                            print("Login successful.")
                        }
                    }
            } label: {
                Text("Tap here to view, create, and edit notes!")
            }
        }
    }
}

#Preview {
    ContentView()
}
