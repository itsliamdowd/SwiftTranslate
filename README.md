# SwiftTranslate

It just works! Easy to use Swift Translation. No API Key required!

## Setup
 - Open your Xcode project
 - Click File > Add Packages
 - Paste in https://github.com/SkiingIsFun123/SwiftTranslate
 - Click the Add Package button on the bottom right side

## Example
```
import Foundation

// Example function that demonstrates the usage of SwiftTranslate struct
func translateExample() {
    let sourceText = "Hello world!"
    let sourceLanguage = "en"
    let targetLanguage = "fr"

    let translatedText = try SwiftTranslate.translateText(text: sourceText, sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)
    print("Source Text: \(sourceText)")
    print("Translated Text: \(translatedText)")
}

// Call the example function
translateExample()
```

## Languages Supported
Please note that translation provided may not be 100% accurate. Additionally, some languages may be better supported than others so use at your own risk.
- Arabic: ar
- Azerbaijani: az
- Chinese: zh
- Czech: cs
- Danish: da
- Dutch: nl
- English: en
- Esperanto: eo
- Finnish: fi
- French: fr
- German: de
- Greek: el
- Hebrew: he
- Hindi: hi
- Hungarian: hu
- Indonesian: id
- Irish: ga
- Italian: it
- Japanese: ja
- Kabyle: kab
- Korean: ko
- Occitan: oc
- Persian: fa
- Polish: pl
- Portuguese: pt
- Russian: ru
- Slovak: sk
- Spanish: es
- Swedish: sv
- Turkish: tr
- Ukrainian: uk
- Vietnamese: vi

## Acknowledgement
Swift Translate is based off of LibreTranslate. Thanks for making this package possible!
https://github.com/LibreTranslate/LibreTranslate
