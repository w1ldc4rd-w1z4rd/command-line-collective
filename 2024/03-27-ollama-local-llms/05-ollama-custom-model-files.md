# What is a Model File?

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

A model file, specifically in the context of Ollama, is a blueprint that defines how to create and share models. It contains instructions and parameters that Ollama uses to set up and run a Large Language Model (LLM).

## Format of a Model File

A model file, known as a `Modelfile` in Ollama, follows this format:

```modelfile
# Comment
INSTRUCTION arguments
```

Each line in the `Modelfile` starts with an instruction followed by its arguments. Comments can be added using the `#` symbol.

## Key Instructions in a Modelfile

- **`FROM` (Required)**: Specifies the base model to use. For example, `FROM llama2` indicates that the model is based on LLaMA-2.
- **`PARAMETER`**: Sets various parameters for running the model, such as temperature, context window size, and more.
- **`TEMPLATE`**: Defines the full prompt template to be sent to the model, which can include system messages, user prompts, and model responses.
- **`SYSTEM`**: Specifies a system message that can be used to guide the behavior of the chat assistant.
- **`ADAPTER`**: Defines any LoRA adapters to apply to the model for fine-tuning.
- **`LICENSE`**: Indicates the legal license under which the model is shared or distributed.
- **`MESSAGE`**: Used to specify message history for the model to consider when responding.

## Creating a Basic Modelfile

Here's an example of a simple `Modelfile`:

```modelfile
FROM mistral
PARAMETER temperature 1
PARAMETER num_ctx 4096
SYSTEM You are a naturopathic functional medicine doctor. Your role is to listen to symptoms described by patients and prescribe natural treatments based on your expertise in holistic and integrative medicine. You should provide advice on dietary changes, herbal supplements, and lifestyle modifications that can help improve the patient's overall health and well-being. Your responses should be informative, empathetic, and focused on natural healing methods.
```

## Using the Modelfile with Ollama

1. Save the `Modelfile` content to a file, for example, named `NaturalModelfile`.
2. Use the Ollama CLI to create a model based on this file:
   
   ```
   ollama create natural-doctor -f NaturalModelfile
   ```
   
3. Run the model:

   ```
   ollama run natural-doctor
   ```
   
4. Interact with the model as you would with a chatbot.

## Understanding Ollama Model File Parameters

In a `Modelfile` for Ollama, the **PARAMETER** instruction is used to set various parameters that control how the model will run. Here's a breakdown of the valid parameters and their values:

### **mirostat**

- **Description**: Enables Mirostat sampling for controlling perplexity.
- **Value Type**: int
- **Values**: 
  - *0*: Disabled
  - *1*: Mirostat
  - *2*: Mirostat 2.0
- **Example**: *PARAMETER mirostat 1*

### **mirostat_eta**

- **Description**: Influences how quickly the algorithm responds to feedback from the generated text.
- **Value Type**: float
- **Default**: *0.1*
- **Example**: *PARAMETER mirostat_eta 0.1*

### **mirostat_tau**

- **Description**: Controls the balance between coherence and diversity of the output.
- **Value Type**: float
- **Default**: *5.0*
- **Example**: *PARAMETER mirostat_tau 5.0*

### **num_ctx**

- **Description**: Sets the size of the context window used to generate the next token.
- **Value Type**: int
- **Default**: *2048*
- **Example**: *PARAMETER num_ctx 4096*

### **num_gqa**

- **Description**: The number of GQA groups in the transformer layer. Required for some models.
- **Value Type**: int
- **Example**: *PARAMETER num_gqa 8*

### **num_gpu**

- **Description**: The number of layers to send to the GPU(s).
- **Value Type**: int
- **Default**: *1* on macOS to enable Metal support, *0* to disable.
- **Example**: *PARAMETER num_gpu 50*

### **num_thread**

- **Description**: Sets the number of threads to use during computation.
- **Value Type**: int
- **Default**: Detected for optimal performance.
- **Example**: *PARAMETER num_thread 8*

### **repeat_last_n**

- **Description**: Sets how far back the model looks to prevent repetition.
- **Value Type**: int
- **Default**: *64*
- **Values**:
  - *0*: Disabled
  - *-1*: num_ctx
- **Example**: *PARAMETER repeat_last_n 64*

### **repeat_penalty**

- **Description**: Sets how strongly to penalize repetitions.
- **Value Type**: float
- **Default**: *1.1*
- **Example**: *PARAMETER repeat_penalty 1.1*

### **temperature**

- **Description**: The temperature of the model. Higher values lead to more creative responses.
- **Value Type**: float
- **Default**: *0.8*
- **Example**: *PARAMETER temperature 0.7*

### **seed**

- **Description**: Sets the random number seed for generation. Ensures reproducibility.
- **Value Type**: int
- **Default**: *0*
- **Example**: *PARAMETER seed 42*

### **stop**

- **Description**: Sets the stop sequences. When encountered, the model stops generating text.
- **Value Type**: string
- **Example**: *PARAMETER stop "AI assistant:"*

### **tfs_z**

- **Description**: Tail Free Sampling reduces the impact of less probable tokens. Higher values reduce the impact more.
- **Value Type**: float
- **Default**: *1*
- **Example**: *PARAMETER tfs_z 1*

### **num_predict**

- **Description**: Maximum number of tokens to predict when generating text.
- **Value Type**: int
- **Default**: *128*
- **Values**:
  - *-1*: Infinite generation
  - *-2*: Fill context
- **Example**: **PARAMETER num_predict 42**

### **top_k**

- **Description**: Reduces the probability of generating nonsense. Higher values give more diverse answers.
- **Value Type**: int
- **Default**: *40*
- **Example**: *PARAMETER top_k 40*

### **top_p**

- **Description**: Works with top-k. Higher values lead to more diverse text, lower values generate more focused text.
- **Value Type**: float
- **Default**: *0.9*
- **Example**: *PARAMETER top_p 0.9*

## Using Parameters in a Modelfile

To set these parameters in a `Modelfile`, you can use the **PARAMETER** instruction followed by the parameter name and its value. For example:

- *PARAMETER temperature 0.7*
- *PARAMETER num_ctx 4096*
- *PARAMETER top_k 50*
