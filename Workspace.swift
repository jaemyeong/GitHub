import ProjectDescription

let workspace = Workspace(
    name: "GitHub",
    projects: [
        "App",
        "Modules/**",
    ],
    schemes: [],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    generationOptions: .options(
        enableAutomaticXcodeSchemes: false,
        autogeneratedWorkspaceSchemes: .disabled,
        lastXcodeUpgradeCheck: nil,
        renderMarkdownReadme: false
    )
)
