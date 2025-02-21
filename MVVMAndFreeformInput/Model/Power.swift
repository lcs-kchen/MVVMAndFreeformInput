//
//  Power.swift
//  MVVMAndFreeformInput
//
//  Created by Haowen Chen on 2025-02-20.
//

import Foundation

// MODEL
struct Power {
    
    // MARK: Stored properties
    
    // The base of the power can hold any numeric value
    var base: Double
    
    // The exponent of a power must be an integer
    var exponent: Int
    
    // MARK: Computed properties
    
    // A power is simply a shorter way of expressing
    // repeated multiplication.
    //
    // e.g.: 3^2
    //       = 3 * 3
    //       = 9
    //
    // The base, 3, mutiplied by itself twice, resulting in 9
    //
    // This could also be expressed as:
    //
    // e.g.: 3^2
    //       = 1 * 3 * 3
    //       = 9
    //
    // We will implement code that mimics this second example.
    
    var result: Double {
        if exponent == 0 {
            return 1.0
        } else  {
            var solution = 1.0
            
            for _ in 1...abs(exponent) {
                solution *= base
            }
            
            return solution
        }
    }
    
}
