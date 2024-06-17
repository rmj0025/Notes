//
//  NoteListView.swift
//  Notes
//
//  Created by Marion Jury on 6/16/24.
//

import SwiftUI

struct NoteListView: View {
    @ObservedObject var noteApp = NoteViewModel()
        @State var note = NoteModel(title: "", notesdata: "")
        
        var body: some View {
            NavigationStack {
                List {
                    ForEach($noteApp.notes) { $note in
                        NavigationLink {
                            NoteDetail(note: $note)
                        } label: {
                            Text(note.title)
                        }
                    }
                    Section {
                        NavigationLink {
                            NoteDetail(note: $note)
                        } label: {
                            Text("New note")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 15))
                        }
                    }
                }
                
            }
            .onAppear {
                noteApp.fetchData()
            }
            .refreshable {
                noteApp.fetchData()
            }
            
        }
}

#Preview {
    NoteListView()
}
