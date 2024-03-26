# Expanded Large Language Model (LLM) Terminology Guide

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

- **LLM (Large Language Model)**: AI models that process and generate human-like text. Used for tasks like translation, summarization, and chatbots.
- **Transformer**: Architecture used in LLMs, relying on self-attention mechanisms to process sequential data, such as text.
- **LLaMA (Large Language Model Architecture)**: A series of scalable and efficient transformer-based LLMs for understanding and generating text.
- **`llama.cpp`**: A C++ library for efficient inference of LLaMA models, designed for high performance across various hardware platforms.
- **GGML (Georgi Gerganov's Machine Learning library)**: A C library that provides foundational elements for machine learning and supports efficient inference of LLMs.
- **Ollama**: A tool that simplifies running open-source LLMs locally by bundling model weights, configurations, and datasets.
- **AVX (Advanced Vector Extensions)**: Instructions in x86 processors that enhance performance by allowing parallel processing of multiple data elements.
- **ARM NEON**: Technology in ARM processors providing SIMD (Single Instruction, Multiple Data) capabilities for accelerated multimedia and signal processing.
- **Quantization**: Reducing the precision of a model's weights to decrease memory usage and speed up inference.
- **CUDA (Compute Unified Device Architecture)**: NVIDIA's parallel computing platform and API that allows for GPU acceleration in computing tasks.
- **HIP (Heterogeneous-Compute Interface for Portability)**: AMD's runtime API and programming model enabling code to run on different GPU architectures.
- **Vulkan**: A low-level graphics and compute API providing high-efficiency access to modern GPUs.
- **SYCL**: A high-level programming model for heterogeneous computing that builds on the OpenCL framework.
- **OpenCL (Open Computing Language)**: An open standard for parallel programming of heterogeneous systems, including CPUs and GPUs.
- **Hybrid Inference**: Combining CPU and GPU processing to accelerate inference of models larger than the total VRAM capacity.
- **RAG (Retrieval-Augmented Generation)**: A technique that enhances LLMs by retrieving relevant information from a database to augment the model's input, improving its ability to generate contextually rich and accurate responses.
- **Fine-tuning**: The process of adjusting an already trained LLM on a specific dataset or for a specific task to improve its performance or adapt it to a new domain.
- **LoRA (Low-Rank Adaptation)**: A technique used in fine-tuning LLMs that updates only a small subset of the model's parameters, reducing the computational cost and preserving the model's original structure.
- **QLoRA**: An extension of LoRA that applies to quantized LLMs, enabling efficient fine-tuning of models with reduced precision.
- **Orchestrator**: A component or system that manages and coordinates the interaction between different LLMs, APIs, and services in a complex workflow.
- **LangChain**: A popular framework for building and orchestrating LLM-based applications, providing tools for integrating various LLMs and services.
- **Deployment**: The process of setting up and making an LLM available for use, typically through an API, in a production environment.
