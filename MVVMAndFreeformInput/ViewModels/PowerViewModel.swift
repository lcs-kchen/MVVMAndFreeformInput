//
//  PowerViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Haowen Chen on 2025-02-20.
//

import Foundation
// VIEW MODEL
@Observable
class PowerViewModel {
    
    // MARK: Stored properties
    // Holds the list of previously computed and evaluated powers
    var resultHistory: [Power] = []
    
    // Holds whatever the user has typed in the text fields
    var providedBase: String = ""
    var providedExponent: String
    
    // Holds an appropriate error message, if there was a
    // problem with input provided by the user
    var recoverySuggestion: String
    
    // MARK: Computed properties
    // Holds the evaluated power, when the input provided is valid
    var power: Power? {
        
        // First check that the string in providedBase can
        // be converted into a number, then check that the
        // value is more than 0
        guard let base = Double(providedBase) else {
            recoverySuggestion = "Please provide a number."
            
            return nil
        }
        
        // Now check that the string in providedExponent can be
        // converted into an integer, and that the value is
        // more than or equal to 1
        guard let exponent = Int(providedExponent) else {
            recoverySuggestion = "Please provide a number."
            
            return nil
        }
        
        // Now that we know the base and exponent have valid values, return the evaluated power
        recoverySuggestion = "" // No error message
        return Power(base: base, exponent: exponent)
        
    }
    
    //Mark: Initializer(s)
    init(
        providedBase: String = "",
        providedExponent: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedBase = providedBase
        self.providedExponent = providedExponent
        self.recoverySuggestion = recoverySuggestion
    }
    // MARK: Function(s)
    func saveResult() {
        
        // When there is a valid power based on user input...
        if let power = self.power {
            
            // ... save that evaluated power at the top of the history of
            // results
            //
            // NOTE: By inserting the newly evaluated power at the top of
            //       the array, we ensure the user sees
            //       the most recent result first.
            self.resultHistory.insert(power, at: 0)
        }
        
    }
    
    
}

//Create an instance of the view model
var viewModel = PowerViewModel()

