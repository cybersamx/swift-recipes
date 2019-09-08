import Foundation

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

let sampleDict: [String: Any?] = [
    "name": "JohnX",
    "age": 30,
    "position": [
        "latitude": 1.289440,
        "longitude": 103.849983
    ]
]

func decodeJSON(json: String) -> [String: Any?]? {
    guard let data = json.data(using: .utf8) else {
        print("Error converting String to Data")
        return nil
    }

    let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

    return object as? [String: Any?]
}

func encodeJSON(dict: [String: Any?]) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: .sortedKeys) else {
        print("Error converting Dictionary to Data")
        return nil
    }

    return String(decoding: data, as: UTF8.self)
}

if let user = decodeJSON(json: sampleJSON) {
    print(user)
}

if let json = encodeJSON(dict: sampleDict) {
    print(json)
}
