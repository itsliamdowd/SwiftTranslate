import Foundation

public struct SwiftTranslate {
    public enum TranslationError: Error {
        case invalidURL
        case emptyResponseData
        case parsingError
    }

    public static func translateText(text: String, sourceLanguage: String, targetLanguage: String) throws -> String {
        guard let url = URL(string: "https://translate.argosopentech.com/translate") else {
            throw TranslationError.invalidURL
        }

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
        var translatedText = ""

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
                   let translated = json["translatedText"] as? String {
                    translatedText = translated
                }
            } catch {
                print("Error parsing response: \(error)")
            }
        }

        task.resume()
        semaphore.wait()

        if translatedText.isEmpty {
            throw TranslationError.emptyResponseData
        }

        return translatedText
    }
}
