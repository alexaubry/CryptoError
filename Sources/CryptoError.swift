/*
 * ==---------------------------------------------------------------------------------==
 *
 *  File            :   CryptoError.swift
 *  Project         :   CryptoError
 *  Author          :   ALEXIS AUBRY RADANOVIC
 *
 *  License         :   The MIT License (MIT)
 *
 * ==---------------------------------------------------------------------------------==
 *
 *	The MIT License (MIT)
 *	Copyright (c) 2016 ALEXIS AUBRY RADANOVIC
 *
 *	Permission is hereby granted, free of charge, to any person obtaining a copy of
 *	this software and associated documentation files (the "Software"), to deal in
 *	the Software without restriction, including without limitation the rights to
 *	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 *	the Software, and to permit persons to whom the Software is furnished to do so,
 *	subject to the following conditions:
 *
 *	The above copyright notice and this permission notice shall be included in all
 *	copies or substantial portions of the Software.
 *
 *	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 *	FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 *	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 *	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 *	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * ==---------------------------------------------------------------------------------==
 */

import CLibreSSL

///
/// An error from the OpenSSL library.
///

public struct CryptoError: Error {

    // MARK: - Properties
    
    ///
    /// The code of the error.
    ///
    
    public let code: UInt
    
    ///
    /// The description of the error.
    ///
    
    public let localizedDescription: String
    
    // MARK: - Lifecycle
    
    ///
    /// Creates an error descriptor.
    ///
    /// - parameter code: The code of the error.
    /// - parameter localizedDescription: The description of the error.
    ///
    /// - note: This initializer has been made private to enforce the use of the `CryptoError.latest` static method.
    ///
    
    private init(code: UInt, localizedDescription: String) {
        self.code = code
        self.localizedDescription = localizedDescription
    }
    
    // MARK: - Getting the Latest Error
    
    ///
    /// Get the latest error in the OpenSSL library.
    ///
    /// - returns: The object describing the latest error.
    ///
    
    public static func latest() -> CryptoError {
        
        let code = ERR_get_error()
        
        var errorStringBuffer = Array<Int8>()
        ERR_error_string(code, &errorStringBuffer)
        
        let localizedDescription = String(cString: &errorStringBuffer)
        
        return CryptoError(code: code, localizedDescription: localizedDescription)
        
    }
    
}
