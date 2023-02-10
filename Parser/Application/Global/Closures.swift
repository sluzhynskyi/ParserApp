//
//  Closures.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import Foundation

typealias EmptyClosure = () -> Void

typealias DefaultResult<Value> = Result<Value, Error>
typealias EmptyResult = DefaultResult<()>

typealias ResultCallback<Value, Error: Swift.Error> = (Result<Value, Error>) -> Void
typealias DefaultResultCallback<Value> = ResultCallback<Value, Error>
typealias EmptyResultCallback = DefaultResultCallback<()>
