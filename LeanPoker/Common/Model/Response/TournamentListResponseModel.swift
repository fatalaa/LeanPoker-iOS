//
//  TournamentListResponseModel.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 12. 30..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import Foundation
import ObjectMapper

struct TournamentListResponseModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
    }
}

struct TournamentResponseModel: Mappable {

    private static let JSONIDKey                = "id"
    private static let JSONStatusKey            = "status"
    private static let JSONTypeKey              = "type"
    private static let JSONHostKey              = "host"
    private static let JSONLatitudeKey          = "latitude"
    private static let JSONLongitudeKey         = "longitude"
    private static let JSONAddressKey           = "address"
    private static let JSONCityKey              = "city"
    private static let JSONCountryKey           = "country"
    private static let JSONDateKey              = "date"
    private static let JSONFormattedDateKey     = "formated-date"
    private static let JSONEventURLKey          = "event_url"
    private static let JSONConfirmationCodeKey  = "confirmation_code"
    private static let JSONImagesKey            = "images"
    private static let JSONTeamsKey             = "teams"
    
    var ID: String?
    var status: String?
    var type: String?
    var host: String?
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var city: String?
    var country: String?
    var date: Date?
    var formattedDate: String?
    var eventURL: URL?
    var confirmationCode: String?
    var images: [ImageModel]?
    var teams: [TeamResponseModel]?
    
    private static var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        ID                  <- map[TournamentResponseModel.JSONIDKey]
        status              <- map[TournamentResponseModel.JSONStatusKey]
        type                <- map[TournamentResponseModel.JSONTypeKey]
        host                <- map[TournamentResponseModel.JSONHostKey]
        latitude            <- (map[TournamentResponseModel.JSONLatitudeKey], StringToDoubleTransform())
        longitude           <- (map[TournamentResponseModel.JSONLongitudeKey], StringToDoubleTransform())
        address             <- map[TournamentResponseModel.JSONAddressKey]
        city                <- map[TournamentResponseModel.JSONCityKey]
        country             <- map[TournamentResponseModel.JSONCountryKey]
        date                <- (map[TournamentResponseModel.JSONDateKey], DateFormatterTransform(dateFormatter: TournamentResponseModel.dateformatter))
        formattedDate       <- map[TournamentResponseModel.JSONFormattedDateKey]
        eventURL            <- (map[TournamentResponseModel.JSONEventURLKey], URLTransform())
        confirmationCode    <- map[TournamentResponseModel.JSONConfirmationCodeKey]
        images              <- map[TournamentResponseModel.JSONImagesKey]
        teams               <- map[TournamentResponseModel.JSONTeamsKey]
    }
}

struct TeamResponseModel: Mappable {
    
    private static let JSONNameKey                  = "name"
    private static let JSONLanguageKey              = "language"
    private static let JSONLanguageIDKey            = "language_id"
    private static let JSONRepositoryProviderKey    = "repository_provider"
    private static let JSONDeploymentServiceKey     = "deployment_service"
    private static let JSONOwnerKey                 = "owner"
    private static let JSONRepositoryNameKey        = "repository_name"
    private static let JSONStatusKey                = "status"
    private static let JSONPointsKey                = "points"
    private static let JSONMembersKey               = "members"
    private static let JSONFakeTeamKey              = "fake_team"
    private static let JSONDeploySecretKey          = "deploy_secret"
    private static let JSONIDKey                    = "id"
    private static let JSONLastCommitIDKey          = "last_commit_id"
    private static let JSONDeploymentIDKey          = "deployment_id"
    private static let JSONLastVersionKey           = "last_version"
    private static let JSONURLKey                   = "url"
    private static let JSONCommitIDKey              = "commit_id"
    
    var name: String?
    var language: String?
    var languageID: String?
    var repositoryProvider: String?
    var deploymentService: String?
    var owner: String?
    var repositoryName: String?
    var status: String?
    var points: Int?
    var members: [String]?
    var fakeTeam: Bool?
    var deploySecret: String?
    var ID: String?
    var deploymentID: String?
    var URL: URL?
    var lastCommitID: String?
    var lastVersion: String?
    var commitID: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        name                <- map[TeamResponseModel.JSONNameKey]
        language            <- map[TeamResponseModel.JSONLanguageKey]
        languageID          <- map[TeamResponseModel.JSONLanguageIDKey]
        repositoryProvider  <- map[TeamResponseModel.JSONRepositoryProviderKey]
        deploymentService   <- map[TeamResponseModel.JSONDeploymentServiceKey]
        owner               <- map[TeamResponseModel.JSONOwnerKey]
        repositoryName      <- map[TeamResponseModel.JSONRepositoryNameKey]
        status              <- map[TeamResponseModel.JSONStatusKey]
        points              <- map[TeamResponseModel.JSONPointsKey]
        members             <- map[TeamResponseModel.JSONMembersKey]
        fakeTeam            <- map[TeamResponseModel.JSONFakeTeamKey]
        deploySecret        <- map[TeamResponseModel.JSONDeploySecretKey]
        ID                  <- map[TeamResponseModel.JSONIDKey]
        deploymentID        <- map[TeamResponseModel.JSONDeploymentIDKey]
        URL                 <- (map[TeamResponseModel.JSONURLKey], URLTransform())
        lastCommitID        <- map[TeamResponseModel.JSONLastCommitIDKey]
        lastVersion         <- map[TeamResponseModel.JSONLastVersionKey]
        commitID            <- map[TeamResponseModel.JSONCommitIDKey]
    }
}

struct ImageModel: Mappable {
    
    private static let JSONOwnerKey     = "owner"
    private static let JSONURLKey       = "url"
    private static let JSONUploadedKey  = "uploaded"
    
    private static var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
        return formatter
    }()
    
    var owner: String?
    var URL: URL?
    var uploaded: Date?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        owner    <- map[ImageModel.JSONOwnerKey]
        URL      <- (map[ImageModel.JSONURLKey], URLTransform())
        uploaded <- (map[ImageModel.JSONUploadedKey], DateFormatterTransform(dateFormatter: ImageModel.dateformatter))
    }
}
