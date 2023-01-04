//
//  NewActivityView.swift
//  ToDoList ios
//
//  Created by Ismenia Brandao on 2023-01-04.
//

import SwiftUI

struct NewActivityView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newActivity = ""
    
    var body: some View {
        VStack {
            TextField("Activity", text: $newActivity)
            
            Button {
                dataManager.addActivity(activityName: newActivity)
            } label: {
                Text("Save")
            }
        }
        .padding()
}

struct NewActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView()
    }
}

}
