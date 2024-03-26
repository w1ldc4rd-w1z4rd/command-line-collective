# Guide to Matching the Right System with Your Large Language Model (LLM)

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

When running Large Language Models (LLMs) locally on your machine, it's important to have a system that meets the specific requirements of the model you're using. This guide will help you match the right system with your LLM, with considerations for VRAM and system resources.

## 1. Determine the Model Size and Type

Identify the size (number of parameters) and type (full-size or quantized) of the LLM you plan to use. Larger models like GPT-3 require more resources, especially when running locally.

## 2. System Requirements for Full-Size (Unquantized) Models

- **RAM**: For smaller models (e.g., 7B parameters), aim for at least 16GB of RAM. For GPT-3 (175B parameters) and similar large models, you may need specialized hardware with hundreds of GBs of RAM to run them locally.
- **GPU and VRAM**: High-end GPUs with large VRAM (e.g., NVIDIA Tesla V100 or A100) are recommended for faster processing. For Macs with Apple Silicon, the unified memory architecture effectively doubles the available RAM for VRAM usage.
- **Storage**: Allocate several hundred GBs of storage space to accommodate the model's weights and parameters.

## 3. System Requirements for Quantized Models

### 4-bit Quantization (e.g., Q4_K_M):

- **RAM**: At least 8GB of RAM to accommodate the reduced model size.
- **GPU and VRAM**: Mid-range GPUs (e.g., NVIDIA RTX 3060) with adequate VRAM can be sufficient, especially if the model supports GPU offloading.
- **Storage**: Less than 50GB of storage is typically required.

### 8-bit Quantization (e.g., Q8_0):

- **RAM**: Aim for 12GB or more of RAM due to the less aggressive compression compared to 4-bit quantization.
- **GPU and VRAM**: Mid-range GPUs with sufficient VRAM should still be adequate.
- **Storage**: Expect storage requirements to be under 100GB.

## 4. Consider Specialized Quantization Techniques

If you're using models with techniques like AWQ or QAT, the hardware requirements might vary. Generally, 8GB to 16GB of RAM and a mid-range GPU with adequate VRAM should be sufficient for most applications.

## 5. Allocate Resources for System Operations

Ensure that your system has enough resources to run the operating system and other applications in addition to the LLM. This may require additional RAM and CPU overhead beyond the requirements for the LLM itself.

## 6. Check for Compatibility

Verify that your system's hardware is compatible with the software and frameworks required to run the LLM. This includes checking for GPU compatibility with CUDA (if using NVIDIA GPUs) and ensuring that your operating system supports the necessary libraries.

## 7. Plan for Scalability

Consider investing in a system with upgradeable components or higher specifications than your current requirements if you anticipate needing to run larger models or multiple models simultaneously in the future.

## 8. Test and Optimize

Run tests with your LLM to ensure it performs as expected on your system. You may need to tweak software settings or upgrade hardware components to optimize performance.
