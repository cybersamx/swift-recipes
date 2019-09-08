import Foundation

// The custom type must be a Codable
struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude  = "lat"
        case longitude = "long"
    }
}

struct User: Codable {
    var name: String
    var age: Int
    var position: Coordinate
}

let sampleJSON = """
{
    "name": "JohnX",
    "age": 30,
    "position": {
        "lat":  1.289440,
        "long": 103.849983
    }
}
"""

let sampleObject = User(name: "JohnX",
                        age: 30,
                        position: Coordinate(latitude: 1.289440,
                                             longitude: 103.849983))

func decodeJSON(json: String) -> User? {
    let decoder = JSONDecoder()

    guard let data = json.data(using: .utf8) else {
        print("Error converting String to Data")
        return nil
    }

    return try? decoder.decode(User.self, from: data)
}

func encodeJSON(user: User) -> String? {
    let encoder = JSONEncoder()

    guard let data = try? encoder.encode(user) else {
        print("Error converting User to Data")
        return nil
    }

    return String(decoding: data, as: UTF8.self)
}

if let user = decodeJSON(json: sampleJSON) {
    print(user)
}

if let json = encodeJSON(user: sampleObject) {
    print(json)
}
