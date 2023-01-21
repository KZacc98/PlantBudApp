//
//  Network.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {

        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["x-hasura-admin-secret":  "hGPkaPYTLADVyk5321vPGm0OoDJN29671se35wuoLki3cIxZ1W2tozNc0fioOasl"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        
        let url = URL(string: "https://divine-leech-84.hasura.app/v1/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    /// A utility function that fetches data from a GraphQL API using a specified query.
    ///
    /// - Warning: The returned string is not localized.
    ///
    /// Usage:
    ///
    ///     // Fetch data from the GraphQL API using the specified query
    ///     Network.fetchData(query: SomeQuery()) { result in
    ///         // Handle the result of the fetch operation
    ///         switch result {
    ///         case .success(let data):
    ///             // Map the data to an object
    ///             let object = mapDataToObject(data)
    ///             // Use the object
    ///         case .failure(let error):
    ///             Logger.error("ERROR: \(error)")
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///     - query: A GraphQL query object.
    ///     - completion:  A completion handler that is called when the fetch operation is complete.
    ///       The completion handler takes a `Result` object as its parameter, which contains either the
    ///       data returned by the query or an error that occurred during the fetch operation.
    ///
    /// - Returns: Void.
    public static func fetchData<T: GraphQLQuery>(query: T, completion: @escaping (Result<T.Data, Error>) -> Void) {
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let GQLResult):
                if let data = GQLResult.data {
                    completion(.success(data))
                } else {
                    completion(.failure(ApplicationError.unknownError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// A utility function that performs a GraphQL mutation using a specified mutation object.
    ///
    /// Usage:
    ///
    ///     // Perform a mutation using the specified mutation object
    ///     Network.performMutation(mutation: SomeMutation()) { result in
    ///         // Handle the result of the mutation operation
    ///         switch result {
    ///         case .success(let data):
    ///             // Use the `data` object to access the results of the mutation
    ///         case .failure(let error):
    ///             // Handle the error
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///     - mutation: A GraphQL mutation object.
    ///     - completion:  A completion handler that is called when the mutation operation is complete.
    ///       The completion handler takes a `Result` object as its parameter, which contains either the
    ///       data returned by the mutation or an error that occurred during the mutation operation.
    ///
    /// - Returns: Void.
    public static func performMutation<Mutation: GraphQLMutation>(mutation: Mutation, completion: @escaping (Result<Mutation.Data, Error>) -> Void) {
        Network.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    Logger.error(errors.debugDescription)
                    completion(.failure(ApplicationError.unknownError))
                }
                if let data = graphQLResult.data {
                    completion(.success(data))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public static func getTimestamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let timestamp = dateFormatter.string(from: Date())
        
        return timestamp
    }
    
    
    
    @MainActor
    public static func fetchData<T: GraphQLQuery>(query: T) async throws -> T.Data {
        try await withCheckedThrowingContinuation { continuation in
            Network.shared.apollo.fetch(query: query) { result in
                switch result {
                case .success(let GQLResult):
                    if let data = GQLResult.data {
                        continuation.resume(returning: data)
                    } else {
                        continuation.resume(throwing: ApplicationError.unknownError)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        //interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}
