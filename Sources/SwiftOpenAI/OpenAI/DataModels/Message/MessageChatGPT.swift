import Foundation

public struct MessageChatGPT: Identifiable, Hashable {
    public var id: UUID
    public var cdContent: CDMessage
    public var role: MessageRoleType

    public init(role: MessageRoleType, cdContent: CDMessage) {
        self.id = UUID()
        self.cdContent = cdContent
        self.role = role
    }
}
