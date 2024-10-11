# LLM-on-iOS

This project demonstrates how to integrate and run the **Gemma 2B** language model on iOS devices using **MediaPipe Tasks GenAI**. It showcases on-device natural language processing (NLP) and generation, providing efficient, customizable LLM inference.

## Demo Video
(https://github.com/jc2409/LLM-On-iOS/blob/main/llm-on-ios%20demo.mp4))

## Project Overview

LLM-on-iOS is an iOS application that integrates the **Gemma 2B** model to perform on-device natural language processing and generation tasks. The application utilises **MediaPipe Tasks GenAI** for efficient inference, enabling NLP functionalities directly on iOS devices without the need for cloud-based services.

## Key Features

- On-device language model inference using **Gemma 2B**.
- Customizable inference options (e.g., max tokens, temperature).
- Seamless integration with the iOS UI for a smooth user experience.

## Requirements

To build and run this project, ensure you have the following:

- Xcode 15.0 or later
- iOS 16.0 or later
- CocoaPods

## Installation

To get started, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/llm-on-ios.git
    cd llm-on-ios
    ```

2. Install the dependencies using CocoaPods:
    ```bash
    pod install
    ```

3. Open the `llm-on-ios.xcworkspace` file in Xcode.

4. Download the **Gemma 2B** model file (`gemma-2b-it-cpu-int4.bin`) and add it to your Xcode project:
    - Drag the file into your Xcode project navigator.
    - Ensure "Copy items if needed" is checked.
    - Add the file to your main target.

## Usage

To use the model in your project, the `LLMManager` class handles the initialization and interaction with **Gemma 2B**. Here's an example of how to use it:

```swift
let llmManager = LLMManager()
llmManager.initializeLLM()
```
## Customization Options

- **Max tokens**: Control the maximum number of tokens generated.
- **Temperature**: Adjust the randomness of the output for more or less creative responses.

## Performance Considerations

- The **Gemma 2B** model is large, so ensure the iOS device has sufficient storage.
- The first inference may take longer, especially on older devices.
- For optimal performance, always test on real devices rather than simulators.
