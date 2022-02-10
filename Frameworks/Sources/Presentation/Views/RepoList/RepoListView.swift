//
//  RepoListView.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/01/01.
//  Copyright © 2022 yuoku. All rights reserved.
//

import Application
import SwiftUI
import CoreMedia

public struct RepoListView: View {
  @ObservedObject private var store: RepoListStore

  @Injected(\.repoListActionCreatorProvider)
  private var actionCreator: RepoListActionCreatorProviding

  @State
  private var isShown = false
  
  public init(store: RepoListStore = .shared) {
    self.store = store
  }

  public var body: some View {
    List {
      ForEach([$store.inputText.wrappedValue], id: \.self) { text in
        Button(text) {
          isShown = true
        }
      }
    }.alert(isPresented: $isShown) { () -> Alert in
      Alert(title: Text("alert"), message: Text("message"))
    }
  }
}

#if DEBUG
  struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
      RepoListView(store: .mock)
    }
  }
#endif
