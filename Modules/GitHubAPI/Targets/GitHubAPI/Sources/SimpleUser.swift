import Foundation

public struct SimpleUser: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        
        case avatarURL = "avatar_url"

        case email = "email"

        case eventsURL = "events_url"

        case followersURL = "followers_url"

        case followingURL = "following_url"

        case gistsURL = "gists_url"

        case gravatarID = "gravatar_id"

        case htmlURL = "html_url"

        case id = "id"

        case login = "login"

        case name = "name"

        case nodeID = "node_id"

        case organizationsURL = "organizations_url"

        case receivedEventsURL = "received_events_url"

        case reposURL = "repos_url"

        case siteAdmin = "site_admin"

        case starredAt = "starred_at"

        case starredURL = "starred_url"

        case subscriptionsURL = "subscriptions_url"

        case type = "type"

        case url = "url"
    }
    
    public var avatarURL: String

    public var email: String?

    public var eventsURL: String

    public var followersURL: String

    public var followingURL: String

    public var gistsURL: String

    public var gravatarID: String?

    public var htmlURL: String

    public var id: Int

    public var login: String

    public var name: String?

    public var nodeID: String

    public var organizationsURL: String

    public var receivedEventsURL: String

    public var reposURL: String

    public var siteAdmin: Bool

    public var starredAt: String?

    public var starredURL: String

    public var subscriptionsURL: String

    public var type: String

    public var url: String

    public init(
        avatarURL: String,
        email: String?,
        eventsURL: String,
        followersURL: String,
        followingURL: String,
        gistsURL: String,
        gravatarID: String?,
        htmlURL: String,
        id: Int,
        login: String,
        name: String?,
        nodeID: String,
        organizationsURL: String,
        receivedEventsURL: String,
        reposURL: String,
        siteAdmin: Bool,
        starredAt: String?,
        starredURL: String,
        subscriptionsURL: String,
        type: String,
        url: String
    ) {
        self.avatarURL = avatarURL
        self.email = email
        self.eventsURL = eventsURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.gravatarID = gravatarID
        self.htmlURL = htmlURL
        self.id = id
        self.login = login
        self.name = name
        self.nodeID = nodeID
        self.organizationsURL = organizationsURL
        self.receivedEventsURL = receivedEventsURL
        self.reposURL = reposURL
        self.siteAdmin = siteAdmin
        self.starredAt = starredAt
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.type = type
        self.url = url
    }
}
