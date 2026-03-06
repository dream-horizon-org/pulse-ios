import Foundation
import PulseKit
import OpenTelemetryApi

/// Exercises PulseKit's public API surface to validate framework compatibility.
/// A successful build of this target proves the xcframework is well-formed,
/// its Swift interfaces are intact, and all dependencies resolve correctly.
public enum PulseKitValidation {

    public static func validate() {
        let pulse = Pulse.shared

        pulse.initialize(
            endpointBaseUrl: "http://localhost:4318",
            projectId: "ci-validation",
            endpointHeaders: nil,
            globalAttributes: [
                "env": AttributeValue.string("ci"),
                "validation": AttributeValue.bool(true),
            ]
        )

        let timestamp = Date().timeIntervalSince1970 * 1000
        pulse.trackEvent(
            name: "validation_event",
            observedTimeStampInMs: timestamp,
            params: [
                "source": AttributeValue.string("ci"),
            ]
        )

        let _ = pulse.trackSpan(name: "validation_span", params: [:]) {
            return true
        }

        let span = pulse.startSpan(name: "validation_manual_span", params: [:])
        span.end()

        let _ = pulse.getOtelOrNull()
    }
}
