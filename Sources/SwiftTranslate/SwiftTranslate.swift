import Foundation

public struct SwiftTranslate {
    public static func translateText(text: String, sourceLanguage: String, targetLanguage: String) throws -> String {
        let url = URL(string: "https://translate.argosopentech.com/translate")!
        let payload = [
            "q": text,
            "source": sourceLanguage,
            "target": targetLanguage
        ]
        let jsonData = try JSONSerialization.data(withJSONObject: payload, options: [])

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let semaphore = DispatchSemaphore(value: 0)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            defer {
                semaphore.signal()
            }

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("Empty response data")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let translatedText = json["translatedText"] as? String {
                    print(translatedText)
                }
            } catch {
                print("Error parsing response: \(error)")
            }
        }

        task.resume()
        semaphore.wait()
        return ""
    }
}
