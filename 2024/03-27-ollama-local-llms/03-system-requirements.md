# Choosing the Right System for LLMs

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

Running Large Language Models (LLMs) on your computer requires a system that meets specific requirements. This guide will help you choose the right system for your LLM, with a focus on both CPU performance and the advantages of using a Mac with Apple Silicon.

## 1. Know Your Model

First, find out the size (number of parameters) of the LLM you want to use. For example:

- LLaMA 2 (7B parameters) requires at least 8GB of RAM.
- LLaMA 2 13B (13B parameters) requires at least 16GB of RAM.
- LLaMA 2 70B (70B parameters) requires at least 32GB of RAM.

## 2. Check the Model's Requirements

Each LLM has different requirements for RAM and storage:

- **RAM**: Ensure your system has enough memory to run the model. For smaller models (e.g., 7B parameters), aim for at least 8GB of RAM. For larger models (e.g., 70B parameters), you may need 32GB of RAM or more.
- **Storage**: Allocate enough space to store the model's weights and data. For example, LLaMA 2 7B requires 3.8GB of storage, while LLaMA 2 70B requires 39GB.

## 3. Consider Your CPU

The CPU is crucial for processing the model's calculations, especially if you're not using a GPU. Look for a CPU with multiple cores and high clock speeds to ensure faster response times and efficient multitasking.

## 4. The Advantages of Using a Mac with Apple Silicon

Macs with Apple Silicon (M1, M2 chips) are particularly well-suited for AI tasks like running LLMs:

- **Unified Memory Architecture**: Reduces data transfer time between the CPU, GPU, and other processors, making AI computations faster and more efficient.
- **Machine Learning Accelerators**: Dedicated neural engine blocks designed for machine learning tasks, providing faster AI-related computations.
- **Optimized Software**: Apple's machine learning frameworks are optimized for Apple Silicon, ensuring smooth and efficient AI task performance.
- **Energy Efficiency**: Apple Silicon is designed to be energy-efficient, allowing for sustained performance without excessive heat generation.

## 5. GPU Considerations

If your model supports GPU usage, having a powerful GPU with enough VRAM can significantly speed up computations. For Macs with Apple Silicon, the integrated GPU is already optimized for AI tasks.

## 6. Test Your Setup

Once you have your system, test it with your LLM to make sure everything works well. You might need to adjust some settings to get the best performance.
