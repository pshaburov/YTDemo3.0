// To parse the JSON, add this file to your project and do:
//
//   let listOfPlaylistID = try ListOfPlaylistID(json)

import Foundation

struct ListOfPlaylistID: Codable {
    let kind, etag, nextPageToken: String?
    let pageInfo: PageInfo?
    let items: [Item]?
}

struct Item: Codable {
    let kind, etag, id: String?
    let snippet: Snippet?
    let contentDetails: ContentDetails?
    let statistics: Statistics?
}

struct ContentDetails: Codable {
    let relatedPlaylists: RelatedPlaylists?
}

struct RelatedPlaylists: Codable {
    let favorites, uploads, watchHistory, watchLater: String?
}

struct Snippet: Codable {
    let publishedAt, channelID, title, description: String?
    let thumbnails: Thumbnails?
    let channelTitle, playlistID: String?
    let position: Int?
    let resourceID: ResourceID?
    let customURL: String?
    let localized: Localized?
    let country: String?
    let tags: [String]?
    let categoryID, liveBroadcastContent, defaultAudioLanguage: String?
    
    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle
        case playlistID = "playlistId"
        case position
        case resourceID = "resourceId"
        case customURL = "customUrl"
        case localized, country, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, defaultAudioLanguage
    }
}

struct Localized: Codable {
    let title, description: String?
}

struct ResourceID: Codable {
    let kind, videoID: String?
    
    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default?
    let maxres: Default?
    
    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

struct Default: Codable {
    let url: String?
    let width, height: Int?
}

struct Statistics: Codable {
    let viewCount, likeCount, dislikeCount, favoriteCount: String?
}

struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int?
}

// MARK: Convenience initializers and mutators

extension ListOfPlaylistID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ListOfPlaylistID.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        kind: String?? = nil,
        etag: String?? = nil,
        nextPageToken: String?? = nil,
        pageInfo: PageInfo?? = nil,
        items: [Item]?? = nil
        ) -> ListOfPlaylistID {
        return ListOfPlaylistID(
            kind: kind ?? self.kind,
            etag: etag ?? self.etag,
            nextPageToken: nextPageToken ?? self.nextPageToken,
            pageInfo: pageInfo ?? self.pageInfo,
            items: items ?? self.items
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Item {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Item.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        kind: String?? = nil,
        etag: String?? = nil,
        id: String?? = nil,
        snippet: Snippet?? = nil,
        contentDetails: ContentDetails?? = nil,
        statistics: Statistics?? = nil
        ) -> Item {
        return Item(
            kind: kind ?? self.kind,
            etag: etag ?? self.etag,
            id: id ?? self.id,
            snippet: snippet ?? self.snippet,
            contentDetails: contentDetails ?? self.contentDetails,
            statistics: statistics ?? self.statistics
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension ContentDetails {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ContentDetails.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        relatedPlaylists: RelatedPlaylists?? = nil
        ) -> ContentDetails {
        return ContentDetails(
            relatedPlaylists: relatedPlaylists ?? self.relatedPlaylists
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RelatedPlaylists {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RelatedPlaylists.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        favorites: String?? = nil,
        uploads: String?? = nil,
        watchHistory: String?? = nil,
        watchLater: String?? = nil
        ) -> RelatedPlaylists {
        return RelatedPlaylists(
            favorites: favorites ?? self.favorites,
            uploads: uploads ?? self.uploads,
            watchHistory: watchHistory ?? self.watchHistory,
            watchLater: watchLater ?? self.watchLater
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Snippet {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Snippet.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        publishedAt: String?? = nil,
        channelID: String?? = nil,
        title: String?? = nil,
        description: String?? = nil,
        thumbnails: Thumbnails?? = nil,
        channelTitle: String?? = nil,
        playlistID: String?? = nil,
        position: Int?? = nil,
        resourceID: ResourceID?? = nil,
        customURL: String?? = nil,
        localized: Localized?? = nil,
        country: String?? = nil,
        tags: [String]?? = nil,
        categoryID: String?? = nil,
        liveBroadcastContent: String?? = nil,
        defaultAudioLanguage: String?? = nil
        ) -> Snippet {
        return Snippet(
            publishedAt: publishedAt ?? self.publishedAt,
            channelID: channelID ?? self.channelID,
            title: title ?? self.title,
            description: description ?? self.description,
            thumbnails: thumbnails ?? self.thumbnails,
            channelTitle: channelTitle ?? self.channelTitle,
            playlistID: playlistID ?? self.playlistID,
            position: position ?? self.position,
            resourceID: resourceID ?? self.resourceID,
            customURL: customURL ?? self.customURL,
            localized: localized ?? self.localized,
            country: country ?? self.country,
            tags: tags ?? self.tags,
            categoryID: categoryID ?? self.categoryID,
            liveBroadcastContent: liveBroadcastContent ?? self.liveBroadcastContent,
            defaultAudioLanguage: defaultAudioLanguage ?? self.defaultAudioLanguage
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Localized {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Localized.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        title: String?? = nil,
        description: String?? = nil
        ) -> Localized {
        return Localized(
            title: title ?? self.title,
            description: description ?? self.description
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension ResourceID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ResourceID.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        kind: String?? = nil,
        videoID: String?? = nil
        ) -> ResourceID {
        return ResourceID(
            kind: kind ?? self.kind,
            videoID: videoID ?? self.videoID
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Thumbnails {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Thumbnails.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        thumbnailsDefault: Default?? = nil,
        medium: Default?? = nil,
        high: Default?? = nil,
        standard: Default?? = nil,
        maxres: Default?? = nil
        ) -> Thumbnails {
        return Thumbnails(
            thumbnailsDefault: thumbnailsDefault ?? self.thumbnailsDefault,
            medium: medium ?? self.medium,
            high: high ?? self.high,
            standard: standard ?? self.standard,
            maxres: maxres ?? self.maxres
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Default {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Default.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        url: String?? = nil,
        width: Int?? = nil,
        height: Int?? = nil
        ) -> Default {
        return Default(
            url: url ?? self.url,
            width: width ?? self.width,
            height: height ?? self.height
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Statistics {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Statistics.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        viewCount: String?? = nil,
        likeCount: String?? = nil,
        dislikeCount: String?? = nil,
        favoriteCount: String?? = nil
        ) -> Statistics {
        return Statistics(
            viewCount: viewCount ?? self.viewCount,
            likeCount: likeCount ?? self.likeCount,
            dislikeCount: dislikeCount ?? self.dislikeCount,
            favoriteCount: favoriteCount ?? self.favoriteCount
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension PageInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PageInfo.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        totalResults: Int?? = nil,
        resultsPerPage: Int?? = nil
        ) -> PageInfo {
        return PageInfo(
            totalResults: totalResults ?? self.totalResults,
            resultsPerPage: resultsPerPage ?? self.resultsPerPage
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

fileprivate func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
