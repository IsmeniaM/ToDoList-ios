//
//  DataManager.swift
//  ToDoList ios
//
//  Created by Ismenia Brandao on 2023-01-04.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var activities: [Activity] = []
    
    init() {
        fetchActivities()
    }
    
    func fetchActivities() {
        activities.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Activities")
        ref.getDocuments { snapshot, error in guard error == nil else{
            print(error!.localizedDescription)
            return
          }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let activity = data["activity"] as? String ?? ""
                    
                    let item = Activity(id: id, activity: activity)
                    self.activities.append(item)
                }
            }
       }
    }
    
    func addActivity(activityName: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Activities").document(activityName)
        ref.setData(["activity": activityName, "id" : 10]) {error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
