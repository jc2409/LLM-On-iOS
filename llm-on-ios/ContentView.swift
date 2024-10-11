import SwiftUI

struct ContentView: View {
    @EnvironmentObject var llmManager: LLMManager
    @State private var userPrompt: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("LLM Demo")
                .font(.title)
            
            TextField("Enter your prompt", text: $userPrompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Initialize LLM") {
                llmManager.initializeLLM()
            }
            .padding()
            .disabled(llmManager.isLoading)
            
            Button("Generate Response") {
                llmManager.generateResponse(for: userPrompt)
            }
            .padding()
            .disabled(llmManager.isLoading || userPrompt.isEmpty)
            
            if llmManager.isLoading {
                ProgressView()
            }
            
            ScrollView {
                Text(llmManager.llmResponse)
                    .padding()
            }
            .frame(minHeight: 100)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(LLMManager())
}
