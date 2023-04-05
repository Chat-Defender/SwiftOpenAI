import Foundation

enum OpenAIEndpoints {
    case completions(model: OpenAIModelType,
                     optionalParameters: CompletionsOptionalParameters?)
    
    case chatCompletions(model: OpenAIModelType,
                         messages: [MessageChatGPT],
                         optionalParameters: ChatCompletionsOptionalParameters?)
    
    case edits(model: OpenAIModelType,
               input: String,
               instruction: String)
    
    case createImage(prompt: String,
                     numberOfImages: Int,
                     size: ImageSize)
    
    public var endpoint: Endpoint {
        switch self {
        case .completions(model: let model, optionalParameters: let optionalParameters):
            return CompletionsEndpoint(model: model,
                                       optionalParameters: optionalParameters)
        case .chatCompletions(let model, let messages, let optionalParameters):
            return ChatCompletionsEndpoint(model: model,
                                           messages: messages,
                                           optionalParameters: optionalParameters)
        case .edits(model: let model, input: let input, instruction: let instruction):
            return EditsEndpoint(model: model,
                                 input: input,
                                 instruction: instruction)
        case .createImage(prompt: let prompt, numberOfImages: let numberOfImages, size: let size):
            return CreateImageEndpoint(prompt: prompt,
                                       numberOfImages: numberOfImages,
                                       size: size)
        }
    }
}
