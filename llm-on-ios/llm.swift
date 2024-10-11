import Foundation
import MediaPipeTasksGenAI
import SwiftUI

class LLMManager: ObservableObject {
    @Published var llmResponse: String = ""
    @Published var isLoading: Bool = false
    private var llm: LlmInference?

    func initializeLLM() {
        isLoading = true
        llmResponse = "Initializing LLM..."
        
        print("Starting LLM initialization...")
        
        guard let modelPath = Bundle.main.path(forResource: "gemma-2b-it-cpu-int4", ofType: "bin") else {
            print("Model file not found")
            llmResponse = "Error: Model file not found"
            isLoading = false
            return
        }
        print("Model path: \(modelPath)")

        do {
            print("Creating LLM options...")
            let options = LlmInference.Options(modelPath: modelPath)
            options.maxTokens = 1000
            options.maxTopk = 40
            print("Options created successfully")

            print("Initializing LLM...")
            llm = try LlmInference(options: options)
            print("LLM initialized successfully")
            DispatchQueue.main.async {
                self.llmResponse = "LLM initialized successfully. Ready for input."
                self.isLoading = false
            }
        } catch {
            print("Error initializing LLM: \(error)")
            DispatchQueue.main.async {
                self.llmResponse = "Error: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }

    func generateResponse(for prompt: String) {
        guard let llm = llm else {
            llmResponse = "Error: LLM not initialized"
            return
        }

        isLoading = true
        llmResponse = "Generating response..."
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try llm.generateResponse(inputText: prompt)
                DispatchQueue.main.async {
                    self.llmResponse = "LLM Response: \(response)"
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.llmResponse = "Error: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
