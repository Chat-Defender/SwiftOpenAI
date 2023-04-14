
# [Chat Defender Drop-in](https://chatdefender.com/)
# OpenAI API Client Library in Swift

This is a drop-in replacement for the "SwiftOpenAI", as maintained by SwiftBeta
https://github.com/SwiftBeta/SwiftOpenAI

It includes minimal changes to make it compatible with Chat Defender.

[Chat Defender](https://chatdefender.com/) allows you to use the same API, but without exposing your OpenAPI key or prompts.

It also allows you to modify your prompts on the fly.

## Installation 💻

### Swift Package Manager (Preferred)

You can use Swift Package Manager to integrate the library by adding the following dependency in the `Package.swift` file or by adding it directly within Xcode.

`.Package(url: "https://github.com/Chat-Defender/SwiftOpenAI.git", majorVersion: 0.7.0)`



## 💻 Usage

For the most part, follow the instructions in the original project
https://github.com/SwiftBeta/SwiftOpenAI

Read the documentation at Chat Defender to move your prompts & key to Chat Defender

You can then use the slightly modified API below

### [Streaming Chat](https://platform.openai.com/docs/api-reference/chat)

(Non streaming chat is also supported. See the original documentation)

```swift
        let openAI = SwiftOpenAI(apiKey: "CHAT_DEFENDER_TOKEN")
        
        //'substitute_joke' is the key for a message with the prompt "Limit Prose: Please tell me a joke about ##subject##!"
        //'subject' is the subject for your new joke
        
        let messages: [MessageChatGPT] = [
          MessageChatGPT(role: .user,
                         cdContent: CDMessage(key: "substitute_joke",
                                              variables: ["subject" : subject])
                        )
        ]
        
        //Note you must set streaming to true here if you're using createChatCompletionsStream
        let optionalParameters = ChatCompletionsOptionalParameters(stream: true)

        do {
            let stream = try await openAI.createChatCompletionsStream(model: .gpt4(.base), messages: messages, optionalParameters: optionalParameters)
            
            for try await response in stream {
                if let delta = response.choices.first?.delta?.content {
                    //prints next segment
                    print(delta)
                }
            }
        } catch {
            print("Error: \(error)")
        }

```

## 📝 License
MIT License

Copyright 2023 SwiftBeta

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



