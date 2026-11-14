# Contributing to mchs-swift

Contributions improve MCHSBind, the Swift package for MCHS contract interoperability. Its scope is transport envelopes and binding protocols; calculator formula logic belongs outside this package.

## Before you start

Read the [README](README.md), [Swift package manifest](Package.swift), and source definitions before proposing a change. Explain how changes affect the contract boundary, serialization, supported platforms, and downstream callers.

Search existing issues and pull requests to avoid duplicating work. Describe substantial proposals before implementation, and use repository issue or pull request templates when available. Small corrections can go directly into a focused pull request.

For bug reports, include the affected version or commit, environment, minimal reproduction, expected and actual behavior, and sanitized diagnostics. For feature requests, explain the use case and intended outcome.

## Development and validation

Use the Swift toolchain and deployment targets declared in `Package.swift`. The manifest currently specifies Swift tools 5.9, macOS 13 and iOS 16 targets, and the `StrictConcurrency` upcoming feature. Check the manifest when these requirements change.

Validate affected code with the package's supported toolchain and record the actual build command, platform, and result. The current manifest has a library target and no test target: do not claim a test suite ran merely because compilation succeeded. Behavioral additions should include suitable tests or an executable contract example. Use synthetic envelopes and cover malformed or incompatible input where relevant.

Update affected documentation and examples alongside behavior changes. Add a focused regression case for a bug fix where executable tests are appropriate. Record checks that were not run and the reason.

## Submitting a pull request

Create a focused branch from the current `main` branch and open a pull request back to it. Keep unrelated formatting, refactoring, and dependency changes separate.

Include:

- The problem, proposed change, and resulting behavior.
- Related issues or existing track references.
- Exact validation commands or inspection steps, results, and limitations.
- Compatibility implications and any data or dependency provenance.

Inspect the complete diff before submission. Required automated checks must pass before merge. Follow the existing repository and account policies; this guide does not introduce a second-person approval requirement or relax existing checks.

## Security and sensitive information

Follow the [account security policy](https://github.com/edithatogo/.github/blob/main/SECURITY.md). Report vulnerabilities privately through GitHub's **Report a vulnerability** option if available. Otherwise request a private reporting contact without disclosing the vulnerability publicly. Keep credentials, personal data, and unredacted logs out of commits, issues, and examples.

## Licensing and conduct

Respect the [existing license](LICENSE) and preserve third-party notices. Submit only material you are entitled to contribute, and document unclear permissions before adding third-party content. Follow the [account code of conduct](https://github.com/edithatogo/.github/blob/main/CODE_OF_CONDUCT.md). This guide adds no CLA, mandatory sign-off, or relicensing condition.

## Reference guidance

- [GitHub contributor guidelines](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors)
- [OpenSSF Best Practices criteria](https://www.bestpractices.dev/en/criteria)
