import Foundation

public struct RepoSearchResultItem: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        
        case allowAutoMerge = "allow_auto_merge"

        case allowForking = "allow_forking"

        case allowMergeCommit = "allow_merge_commit"

        case allowRebaseMerge = "allow_rebase_merge"

        case allowSquashMerge = "allow_squash_merge"

        case archiveURL = "archive_url"

        case archived = "archived"

        case assigneesURL = "assignees_url"

        case blobsURL = "blobs_url"

        case branchesURL = "branches_url"

        case cloneURL = "clone_url"

        case collaboratorsURL = "collaborators_url"

        case commentsURL = "comments_url"

        case commitsURL = "commits_url"

        case compareURL = "compare_url"

        case contentsURL = "contents_url"

        case contributorsURL = "contributors_url"

        case createdAt = "created_at"

        case defaultBranch = "default_branch"

        case deleteBranchOnMerge = "delete_branch_on_merge"

        case deploymentsURL = "deployments_url"

        case description = "description"

        case disabled = "disabled"

        case downloadsURL = "downloads_url"

        case eventsURL = "events_url"

        case fork = "fork"

        case forks = "forks"

        case forksCount = "forks_count"

        case forksURL = "forks_url"

        case fullName = "full_name"

        case gitCommitsURL = "git_commits_url"

        case gitRefsURL = "git_refs_url"

        case gitTagsURL = "git_tags_url"

        case gitURL = "git_url"

        case hasDiscussions = "has_discussions"

        case hasDownloads = "has_downloads"

        case hasIssues = "has_issues"

        case hasPages = "has_pages"

        case hasProjects = "has_projects"

        case hasWiki = "has_wiki"

        case homepage = "homepage"

        case hooksURL = "hooks_url"

        case htmlURL = "html_url"

        case id = "id"

        case isTemplate = "is_template"

        case issueCommentURL = "issue_comment_url"

        case issueEventsURL = "issue_events_url"

        case issuesURL = "issues_url"

        case keysURL = "keys_url"

        case labelsURL = "labels_url"

        case language = "language"

        case languagesURL = "languages_url"

        case license = "license"

        case masterBranch = "master_branch"

        case mergesURL = "merges_url"

        case milestonesURL = "milestones_url"

        case mirrorURL = "mirror_url"

        case name = "name"

        case nodeID = "node_id"

        case notificationsURL = "notifications_url"

        case openIssues = "open_issues"

        case openIssuesCount = "open_issues_count"

        case owner = "owner"

        case permissions = "permissions"

        case repoSearchResultItemPrivate = "private"

        case pullsURL = "pulls_url"

        case pushedAt = "pushed_at"

        case releasesURL = "releases_url"

        case score = "score"

        case size = "size"

        case sshURL = "ssh_url"

        case stargazersCount = "stargazers_count"

        case stargazersURL = "stargazers_url"

        case statusesURL = "statuses_url"

        case subscribersURL = "subscribers_url"

        case subscriptionURL = "subscription_url"

        case svnURL = "svn_url"

        case tagsURL = "tags_url"

        case teamsURL = "teams_url"

        case tempCloneToken = "temp_clone_token"

        case textMatches = "text_matches"

        case topics = "topics"

        case treesURL = "trees_url"

        case updatedAt = "updated_at"

        case url = "url"

        case visibility = "visibility"

        case watchers = "watchers"

        case watchersCount = "watchers_count"

        case webCommitSignoffRequired = "web_commit_signoff_required"
    }
    
    public var allowAutoMerge: Bool?

    public var allowForking: Bool?

    public var allowMergeCommit: Bool?

    public var allowRebaseMerge: Bool?

    public var allowSquashMerge: Bool?

    public var archiveURL: String

    public var archived: Bool

    public var assigneesURL: String

    public var blobsURL: String

    public var branchesURL: String

    public var cloneURL: String

    public var collaboratorsURL: String

    public var commentsURL: String

    public var commitsURL: String

    public var compareURL: String

    public var contentsURL: String

    public var contributorsURL: String

    public var createdAt: Date

    public var defaultBranch: String

    public var deleteBranchOnMerge: Bool?

    public var deploymentsURL: String

    public var description: String?

    public var disabled: Bool

    public var downloadsURL: String

    public var eventsURL: String

    public var fork: Bool

    public var forks: Int

    public var forksCount: Int

    public var forksURL: String

    public var fullName: String

    public var gitCommitsURL: String

    public var gitRefsURL: String

    public var gitTagsURL: String

    public var gitURL: String

    public var hasDiscussions: Bool?

    public var hasDownloads: Bool

    public var hasIssues: Bool

    public var hasPages: Bool

    public var hasProjects: Bool

    public var hasWiki: Bool

    public var homepage: String?

    public var hooksURL: String

    public var htmlURL: String

    public var id: Int

    public var isTemplate: Bool?

    public var issueCommentURL: String

    public var issueEventsURL: String

    public var issuesURL: String

    public var keysURL: String

    public var labelsURL: String

    public var language: String?

    public var languagesURL: String

    public var license: LicenseSimple?

    public var masterBranch: String?

    public var mergesURL: String

    public var milestonesURL: String

    public var mirrorURL: String?

    public var name: String

    public var nodeID: String

    public var notificationsURL: String

    public var openIssues: Int

    public var openIssuesCount: Int

    public var owner: SimpleUser?

    public var permissions: Permissions?

    public var repoSearchResultItemPrivate: Bool

    public var pullsURL: String

    public var pushedAt: Date

    public var releasesURL: String

    public var score: Double

    public var size: Int

    public var sshURL: String

    public var stargazersCount: Int

    public var stargazersURL: String

    public var statusesURL: String

    public var subscribersURL: String

    public var subscriptionURL: String

    public var svnURL: String

    public var tagsURL: String

    public var teamsURL: String

    public var tempCloneToken: String?

    public var textMatches: [SearchResultTextMatch]?

    public var topics: [String]?

    public var treesURL: String

    public var updatedAt: Date

    public var url: String

    public var visibility: String?

    public var watchers: Int

    public var watchersCount: Int

    public var webCommitSignoffRequired: Bool?

    public init(
        allowAutoMerge: Bool?,
        allowForking: Bool?,
        allowMergeCommit: Bool?,
        allowRebaseMerge: Bool?,
        allowSquashMerge: Bool?,
        archiveURL: String,
        archived: Bool,
        assigneesURL: String,
        blobsURL: String,
        branchesURL: String,
        cloneURL: String,
        collaboratorsURL: String,
        commentsURL: String,
        commitsURL: String,
        compareURL: String,
        contentsURL: String,
        contributorsURL: String,
        createdAt: Date,
        defaultBranch: String,
        deleteBranchOnMerge: Bool?,
        deploymentsURL: String,
        description: String?,
        disabled: Bool,
        downloadsURL: String,
        eventsURL: String,
        fork: Bool,
        forks: Int,
        forksCount: Int,
        forksURL: String,
        fullName: String,
        gitCommitsURL: String,
        gitRefsURL: String,
        gitTagsURL: String,
        gitURL: String,
        hasDiscussions: Bool?,
        hasDownloads: Bool,
        hasIssues: Bool,
        hasPages: Bool,
        hasProjects: Bool,
        hasWiki: Bool,
        homepage: String?,
        hooksURL: String,
        htmlURL: String,
        id: Int,
        isTemplate: Bool?,
        issueCommentURL: String,
        issueEventsURL: String,
        issuesURL: String,
        keysURL: String,
        labelsURL: String,
        language: String?,
        languagesURL: String,
        license: LicenseSimple?,
        masterBranch: String?,
        mergesURL: String,
        milestonesURL: String,
        mirrorURL: String?,
        name: String,
        nodeID: String,
        notificationsURL: String,
        openIssues: Int,
        openIssuesCount: Int,
        owner: SimpleUser?,
        permissions: Permissions?,
        repoSearchResultItemPrivate: Bool,
        pullsURL: String,
        pushedAt: Date,
        releasesURL: String,
        score: Double,
        size: Int,
        sshURL: String,
        stargazersCount: Int,
        stargazersURL: String,
        statusesURL: String,
        subscribersURL: String,
        subscriptionURL: String,
        svnURL: String,
        tagsURL: String,
        teamsURL: String,
        tempCloneToken: String?,
        textMatches: [SearchResultTextMatch]?,
        topics: [String]?,
        treesURL: String,
        updatedAt: Date,
        url: String,
        visibility: String?,
        watchers: Int,
        watchersCount: Int,
        webCommitSignoffRequired: Bool?
    ) {
        self.allowAutoMerge = allowAutoMerge
        self.allowForking = allowForking
        self.allowMergeCommit = allowMergeCommit
        self.allowRebaseMerge = allowRebaseMerge
        self.allowSquashMerge = allowSquashMerge
        self.archiveURL = archiveURL
        self.archived = archived
        self.assigneesURL = assigneesURL
        self.blobsURL = blobsURL
        self.branchesURL = branchesURL
        self.cloneURL = cloneURL
        self.collaboratorsURL = collaboratorsURL
        self.commentsURL = commentsURL
        self.commitsURL = commitsURL
        self.compareURL = compareURL
        self.contentsURL = contentsURL
        self.contributorsURL = contributorsURL
        self.createdAt = createdAt
        self.defaultBranch = defaultBranch
        self.deleteBranchOnMerge = deleteBranchOnMerge
        self.deploymentsURL = deploymentsURL
        self.description = description
        self.disabled = disabled
        self.downloadsURL = downloadsURL
        self.eventsURL = eventsURL
        self.fork = fork
        self.forks = forks
        self.forksCount = forksCount
        self.forksURL = forksURL
        self.fullName = fullName
        self.gitCommitsURL = gitCommitsURL
        self.gitRefsURL = gitRefsURL
        self.gitTagsURL = gitTagsURL
        self.gitURL = gitURL
        self.hasDiscussions = hasDiscussions
        self.hasDownloads = hasDownloads
        self.hasIssues = hasIssues
        self.hasPages = hasPages
        self.hasProjects = hasProjects
        self.hasWiki = hasWiki
        self.homepage = homepage
        self.hooksURL = hooksURL
        self.htmlURL = htmlURL
        self.id = id
        self.isTemplate = isTemplate
        self.issueCommentURL = issueCommentURL
        self.issueEventsURL = issueEventsURL
        self.issuesURL = issuesURL
        self.keysURL = keysURL
        self.labelsURL = labelsURL
        self.language = language
        self.languagesURL = languagesURL
        self.license = license
        self.masterBranch = masterBranch
        self.mergesURL = mergesURL
        self.milestonesURL = milestonesURL
        self.mirrorURL = mirrorURL
        self.name = name
        self.nodeID = nodeID
        self.notificationsURL = notificationsURL
        self.openIssues = openIssues
        self.openIssuesCount = openIssuesCount
        self.owner = owner
        self.permissions = permissions
        self.repoSearchResultItemPrivate = repoSearchResultItemPrivate
        self.pullsURL = pullsURL
        self.pushedAt = pushedAt
        self.releasesURL = releasesURL
        self.score = score
        self.size = size
        self.sshURL = sshURL
        self.stargazersCount = stargazersCount
        self.stargazersURL = stargazersURL
        self.statusesURL = statusesURL
        self.subscribersURL = subscribersURL
        self.subscriptionURL = subscriptionURL
        self.svnURL = svnURL
        self.tagsURL = tagsURL
        self.teamsURL = teamsURL
        self.tempCloneToken = tempCloneToken
        self.textMatches = textMatches
        self.topics = topics
        self.treesURL = treesURL
        self.updatedAt = updatedAt
        self.url = url
        self.visibility = visibility
        self.watchers = watchers
        self.watchersCount = watchersCount
        self.webCommitSignoffRequired = webCommitSignoffRequired
    }
}
