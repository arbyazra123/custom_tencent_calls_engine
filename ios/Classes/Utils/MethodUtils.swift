//
//  MethodUtils.swift
//  Pods
//
//  Created by aby on 2022/11/1.
//

import Foundation

/// Flutter method value function
public class MethodUtils {
    public static func getMethodParams<T: Any>(call: FlutterMethodCall, key: String, resultType: T.Type) -> T? {
        guard let arguments = call.arguments as? [String: Any] else { return nil }
        guard let value = arguments[key] else { return nil }
        return value as? T
    }
}

/// Flutter-Result
public class FlutterResultUtils {
    
    enum FlutterCode: Int {
        case ok = 0
        /// The wrong code that has not yet classified
        case unknown = -1
        /// The parameters were not found
        case paramNotFound = -1_001
        /// Parameter type error
        case paramTypeError = -1_002
        /// Get Value as empty
        case valueIsNull = -1_004
    }
    
    /// Process Method-Result
    /// - Parameters:
    ///   - code: error code
    ///   - methodName: Interface name
    ///   - paramKey: Parameter key
    ///   - result: Flutter callback
    static func handleMethod(code: FlutterCode = .unknown,
                             methodName: String,
                             paramKey: String,
                             result: FlutterResult? = nil) {
        switch code {
            case .paramNotFound:
                handle(code: code, msg: "\(methodName) Can not find param by key: \(paramKey)", details: nil, result: result)
            case .paramTypeError:
                handle(code: code, msg: "\(methodName) param type error key: \(paramKey)", details: nil, result: result)
            default:
                handle(code: code, result: result)
        }
    }
    
    /// Process Result
    static func handle(code: FlutterCode = .unknown,
                       msg: String = "unknown msg",
                       details: Any? = nil,
                       result: FlutterResult? = nil) {
//        Logger.error(content: "flutter error: \(msg)")
        let error = FlutterError(code: "\(code.rawValue)", message: msg, details: details)
        result?(error)
    }
}
