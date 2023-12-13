//
//  Notes.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import Foundation

struct Notes: Codable {
    
    let likes: Likes?
    let invites: Invites?
    
    init(data: Data) throws {
        self = try JSONDecoder().decode(Notes.self, from: data)
    }
}

// MARK: - Invites
struct Invites: Codable {
    let pendingInvitationsCount: Int?
    let totalPages: Int?
    var profiles: [Profile]?

    enum CodingKeys: String, CodingKey {
        case pendingInvitationsCount = "pending_invitations_count"
        case totalPages, profiles
    }
}

// MARK: - Profile
struct Profile: Codable {
    let work: Work?
    let verificationStatus: String?
    let showConciergeBadge: Bool?
    let profileDataList: [ProfileDataList]?
    let meetup: JSONNull?
    let preferences: [ProfilePreference]?
    let onlineCode: Int?
    let disapprovedTime: Double?
    let lastSeenWindow: String?
    let lng: Double?
    let instagramImages: JSONNull?
    let story: JSONNull?
    let icebreakers: JSONNull?
    let userInterests: [JSONAny]?
    let lastSeen: JSONNull?
    let hasActiveSubscription: Bool?
    let approvedTime: Double?
    let generalInformation: GeneralInformation?
    let photos: [Photo]?
    let lat: Double?
    let isFacebookDataFetched: Bool?

    enum CodingKeys: String, CodingKey {
        case work
        case verificationStatus = "verification_status"
        case showConciergeBadge = "show_concierge_badge"
        case profileDataList = "profile_data_list"
        case meetup, preferences
        case onlineCode = "online_code"
        case disapprovedTime = "disapproved_time"
        case lastSeenWindow = "last_seen_window"
        case lng
        case instagramImages = "instagram_images"
        case story, icebreakers
        case userInterests = "user_interests"
        case lastSeen = "last_seen"
        case hasActiveSubscription = "has_active_subscription"
        case approvedTime = "approved_time"
        case generalInformation = "general_information"
        case photos, lat
        case isFacebookDataFetched = "is_facebook_data_fetched"
    }
}

// MARK: - GeneralInformation
struct GeneralInformation: Codable {
    let location: Location?
    let maritalStatusV1: MaritalStatusV1Class?
    let kid: JSONNull?
    let motherTongue: Faith?
    let settle: JSONNull?
    let dateOfBirth: String?
    let smokingV1: DrinkingV1Class?
    let mbti: JSONNull?
    let refID: String?
    let cast: JSONNull?
    let drinkingV1: DrinkingV1Class?
    let gender: String?
    let faith: Faith?
    let pet: JSONNull?
    let height: Int?
    let sunSignV1: Faith?
    let diet, politics: JSONNull?
    let dateOfBirthV1: String?
    let age: Int?
    let firstName: String?

    enum CodingKeys: String, CodingKey {
        case location
        case maritalStatusV1 = "marital_status_v1"
        case kid
        case motherTongue = "mother_tongue"
        case settle
        case dateOfBirth = "date_of_birth"
        case smokingV1 = "smoking_v1"
        case mbti
        case refID = "ref_id"
        case cast
        case drinkingV1 = "drinking_v1"
        case gender, faith, pet, height
        case sunSignV1 = "sun_sign_v1"
        case diet, politics
        case dateOfBirthV1 = "date_of_birth_v1"
        case age
        case firstName = "first_name"
    }
}

// MARK: - DrinkingV1Class
struct DrinkingV1Class: Codable {
    let id: Int?
    let name: String?
    let nameAlias: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameAlias = "name_alias"
    }
}

// MARK: - Faith
struct Faith: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Location
struct Location: Codable {
    let summary: String?
    let full: String?
}

// MARK: - MaritalStatusV1Class
struct MaritalStatusV1Class: Codable {
    let id: Int?
    let name: String?
    let preferenceOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case preferenceOnly = "preference_only"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let photoID: Int?
    let status: String?
    let selected: Bool?
    let photo: String?

    enum CodingKeys: String, CodingKey {
        case photoID = "photo_id"
        case status, selected, photo
    }
}

// MARK: - ProfilePreference
struct ProfilePreference: Codable {
    let preferenceQuestion: PreferenceQuestion?
    let id, value, answerID: Int?

    enum CodingKeys: String, CodingKey {
        case preferenceQuestion = "preference_question"
        case id, value
        case answerID = "answer_id"
    }
}

// MARK: - PreferenceQuestion
struct PreferenceQuestion: Codable {
    let firstChoice, secondChoice: String?

    enum CodingKeys: String, CodingKey {
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
}

// MARK: - ProfileDataList
struct ProfileDataList: Codable {
    let invitationType, question: String?
    let preferences: [ProfileDataListPreference]?

    enum CodingKeys: String, CodingKey {
        case invitationType = "invitation_type"
        case question, preferences
    }
}

// MARK: - ProfileDataListPreference
struct ProfileDataListPreference: Codable {
    let answer: String?
    let answerID: Int?
    let firstChoice, secondChoice: String

    enum CodingKeys: String, CodingKey {
        case answer
        case answerID = "answer_id"
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
}

// MARK: - Work
struct Work: Codable {
    let fieldOfStudyV1: Faith?
    let industryV1, highestQualificationV1: MaritalStatusV1Class?
    let experienceV1: DrinkingV1Class?
    let monthlyIncomeV1: JSONNull?

    enum CodingKeys: String, CodingKey {
        case fieldOfStudyV1 = "field_of_study_v1"
        case industryV1 = "industry_v1"
        case highestQualificationV1 = "highest_qualification_v1"
        case experienceV1 = "experience_v1"
        case monthlyIncomeV1 = "monthly_income_v1"
    }
}

// MARK: - Likes
struct Likes: Codable {
    let likesReceivedCount: Int?
    let canSeeProfile: Bool?
    let profiles: [IntrestedProfile]

    enum CodingKeys: String, CodingKey {
        case likesReceivedCount = "likes_received_count"
        case canSeeProfile = "can_see_profile"
        case profiles
    }
}

// MARK: - IntrestedProfile
struct IntrestedProfile: Codable {
    let avatar: String?
    let firstName: String?

    enum CodingKeys: String, CodingKey {
        case avatar
        case firstName = "first_name"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
