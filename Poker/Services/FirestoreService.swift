//
//  FirestoreService.swift
//  Poker
//
//  Created by Kevin Tran on 9/5/24.
//

import Foundation
import FirebaseFirestore

class FirestoreService {
    let db = Firestore.firestore()

    func createDocument(collection: String, data: [String: Any]) {
        db.collection(collection).addDocument(data: data) { error in
            if let error = error {
                print("Error creating document: \(error)")
            } else {
                print("Document created successfully!")
            }
        }
    }
}
