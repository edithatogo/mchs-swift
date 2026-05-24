import Foundation

// MARK: - Request envelope

/// Versioned Swift request envelope that mirrors the public calculator contract
/// and adds only transport metadata.
public struct SwiftBindingRequest: Codable, Sendable {
    public var schemaVersion: String
    public var calculatorId: String
    public var pricingYear: String
    public var inputSchemaVersion: String
    public var outputSchemaVersion: String
    public var mode: String
    public var inputPath: String?
    public var outputPath: String?
    public var serviceURL: String?
    public var correlationId: String?
    public var metadata: [String: String]?
    public var fixtureGate: String

    public init(
        schemaVersion: String = "1.0",
        calculatorId: String,
        pricingYear: String,
        inputSchemaVersion: String,
        outputSchemaVersion: String,
        mode: String,
        inputPath: String? = nil,
        outputPath: String? = nil,
        serviceURL: String? = nil,
        correlationId: String? = nil,
        metadata: [String: String]? = nil,
        fixtureGate: String
    ) {
        self.schemaVersion = schemaVersion
        self.calculatorId = calculatorId
        self.pricingYear = pricingYear
        self.inputSchemaVersion = inputSchemaVersion
        self.outputSchemaVersion = outputSchemaVersion
        self.mode = mode
        self.inputPath = inputPath
        self.outputPath = outputPath
        self.serviceURL = serviceURL
        self.correlationId = correlationId
        self.metadata = metadata
        self.fixtureGate = fixtureGate
    }

    enum CodingKeys: String, CodingKey {
        case schemaVersion = "schema_version"
        case calculatorId = "calculator_id"
        case pricingYear = "pricing_year"
        case inputSchemaVersion = "input_schema_version"
        case outputSchemaVersion = "output_schema_version"
        case mode
        case inputPath = "input_path"
        case outputPath = "output_path"
        case serviceURL = "service_url"
        case correlationId = "correlation_id"
        case metadata
        case fixtureGate = "fixture_gate"
    }
}

// MARK: - Response envelope

/// Versioned Swift response envelope that captures success, diagnostics,
/// provenance, and transport-specific outputs.
public struct SwiftBindingResponse: Codable, Sendable {
    public var schemaVersion: String
    public var calculatorId: String
    public var pricingYear: String
    public var mode: String
    public var success: Bool
    public var status: String
    public var message: String
    public var warnings: [String]?
    public var errors: [SwiftBindingError]?
    public var diagnostics: Diagnostics
    public var provenance: Provenance
    public var serviceURL: String?
    public var outputPath: String?
    public var fixtureGateState: String
    public var moduleReadinessState: String

    enum CodingKeys: String, CodingKey {
        case schemaVersion = "schema_version"
        case calculatorId = "calculator_id"
        case pricingYear = "pricing_year"
        case mode
        case success
        case status
        case message
        case warnings
        case errors
        case diagnostics
        case provenance
        case serviceURL = "service_url"
        case outputPath = "output_path"
        case fixtureGateState = "fixture_gate_state"
        case moduleReadinessState = "module_readiness_state"
    }
}

// MARK: - Supporting types

public struct Diagnostics: Codable, Sendable {
    public var status: String
    public var checks: [DiagnosticCheck]
    public var summary: DiagnosticSummary
    public var notes: String?
}

public struct DiagnosticCheck: Codable, Sendable {
    public var id: String
    public var status: String
    public var message: String
}

public struct DiagnosticSummary: Codable, Sendable {
    public var passed: Int
    public var failed: Int
    public var blocked: Int
}

public struct Provenance: Codable, Sendable {
    public var command: String
    public var bindingBundleId: String
    public var sourceManifestPath: String
    public var sourceURL: String
    public var retrievedOn: String
    public var sha256: String
    public var bytes: Int
    public var checksumAlgorithm: String

    enum CodingKeys: String, CodingKey {
        case command
        case bindingBundleId = "binding_bundle_id"
        case sourceManifestPath = "source_manifest_path"
        case sourceURL = "source_url"
        case retrievedOn = "retrieved_on"
        case sha256
        case bytes
        case checksumAlgorithm = "checksum_algorithm"
    }
}

public struct SwiftBindingError: Codable, Sendable {
    public var code: String
    public var severity: String
    public var retryable: Bool
    public var condition: String
    public var message: String?
}

// MARK: - Transport adapter protocol

/// Adapter defines the interop boundary used by file-exchange, CLI, service,
/// or future C ABI integration.
public protocol BindingAdapter: Sendable {
    func execute(request: SwiftBindingRequest) async throws -> SwiftBindingResponse
}
