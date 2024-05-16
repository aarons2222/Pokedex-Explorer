//
//  ErrorHandler.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 16/05/2024.
//

import SwiftUI

class ErrorHandler: ObservableObject {
    @Published var currentError: String? = nil {
        didSet {
            if currentError != nil {
                showAlert = true
            }
        }
    }
    @Published var showAlert: Bool = false
    
    private var errorQueue: [String] = []
    
    static let shared = ErrorHandler()
    
    private init() {}
    
    func displayError(message: String) {
        errorQueue.append(message)
        showNextError()
    }
    
    private func showNextError() {
        if !showAlert, let nextError = errorQueue.first {
            currentError = nextError
            errorQueue.removeFirst()
        }
    }
    
    func alertDismissed() {
        showAlert = false
        currentError = nil
        showNextError()
    }
}
