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
- **`TEMPLATE`**: Is a structured format used to organize the input and output for a language model. It defines how the interaction between the user and the model should be formatted, including placeholders for various parts of the conversation, such as system messages, user prompts, and model responses. The template helps ensure that the model receives and generates information in a consistent and structured manner. For more information on how to define and customize templates in Ollama, you can refer to the [official documentation on the TEMPLATE parameter](https://github.com/ollama/ollama/blob/main/docs/modelfile.md#template).
- **`SYSTEM`**: Specifies a system message that can be used to guide the behavior of the chat assistant.
- **`ADAPTER`**: Specifies any [LoRA (Low-Rank Adaptation)](https://github.com/ollama/ollama/blob/main/docs/modelfile.md#adapter) adapters that should be used to adjust the model for specific tasks. This approach helps in refining the model's performance without needing to update all its parameters.
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

### Other Options

- To list all the models available:

   ```
   ollama list
   ```

- To delete a model:

   ```
   ollama rm <model name>
   ```
   
## Understanding Ollama Model File Parameters

In Ollama's `Modelfile`, you use the **PARAMETER** instruction to set up various options that control how the model behaves. Here's a simple guide to what each parameter does, including their minimum and maximum values:

### **mirostat**

- **What It Does**: Helps control the variety in the text the model generates.
- **Possible Values**:
  - *0*: Turned off
  - *1*: Basic Mirostat
  - *2*: Advanced Mirostat (Mirostat 2.0)
- **Min/Max**: 0 to 2
- **Example**: *PARAMETER mirostat 1*

### **mirostat_eta**

- **What It Does**: Adjusts how quickly the model reacts to the text it's generating.
- **Default Value**: *0.1*
- **Min/Max**: Typically, 0.01 to 1.0 (but can vary based on model needs)
- **Example**: *PARAMETER mirostat_eta 0.1*

### **mirostat_tau**

- **What It Does**: Balances how consistent vs. how varied the text is.
- **Default Value**: *5.0*
- **Min/Max**: Typically, 1 to 10 (but can vary based on model needs)
- **Example**: *PARAMETER mirostat_tau 5.0*

### **num_ctx**

- **What It Does**: Sets how much text the model looks at when coming up with the next word.
- **Default Value**: *2048* (words)
- **Min/Max**: Depends on the model's capabilities, but typically ranges from 512 to 4096 or more.
- **Example**: *PARAMETER num_ctx 4096*

### **num_gqa**

- **What It Does**: Specifies the number of groups in a certain part of the model. Needed for some models.
- **Min/Max**: Depends on the specific model architecture.
- **Example**: *PARAMETER num_gqa 8*

### **num_gpu**

- **What It Does**: Tells how many parts of the model to run on the graphics card (GPU).
- **Default Value**: *1* on Mac for Metal support, *0* to turn off.
- **Min/Max**: 0 to the number of available GPUs
- **Example**: *PARAMETER num_gpu 50*

### **num_thread**

- **What It Does**: Sets how many processing threads to use.
- **Default Value**: Automatically set for best performance.
- **Min/Max**: 1 to the number of available CPU threads
- **Example**: *PARAMETER num_thread 8*

### **repeat_last_n**

- **What It Does**: Controls how far back the model checks to avoid repeating itself.
- **Default Value**: *64*
- **Min/Max**: 0 to the value of `num_ctx`
- **Possible Values**:
  - *0*: Don't check for repeats
  - *-1*: Check the entire text
- **Example**: *PARAMETER repeat_last_n 64*

### **repeat_penalty**

- **What It Does**: Sets how harshly to penalize repeating words.
- **Default Value**: *1.1*
- **Min/Max**: Typically, 1.0 to 2.0 (but can vary based on model needs)
- **Example**: *PARAMETER repeat_penalty 1.1*

### **temperature**

- **What It Does**: Controls how "creative" the responses are. Higher = more creative.
- **Default Value**: *0.8*
- **Min/Max**: 0.1 to 2.0 (lower values are more deterministic, higher values are more random)
- **Example**: *PARAMETER temperature 0.7*

### **seed**

- **What It Does**: Sets a starting point for random generation. Useful for getting the same results each time.
- **Default Value**: *0*
- **Min/Max**: 0 to the maximum integer value (typically 2^31 - 1)
- **Example**: *PARAMETER seed 42*

### **stop**

- **What It Does**: Tells the model to stop generating text when it hits certain words or phrases.
- **Example**: *PARAMETER stop "AI assistant:"*

### **tfs_z**

- **What It Does**: Reduces the chance of picking less likely words. Higher = less chance.
- **Default Value**: *1*
- **Min/Max**: Typically, 0.5 to 2.0 (but can vary based on model needs)
- **Example**: *PARAMETER tfs_z 1*

### **num_predict**

- **What It Does**: Sets the maximum number of words the model will generate.
- **Default Value**: *128*
- **Min/Max**: 1 to the maximum integer value (typically 2^31 - 1), with special values:
  - *-1*: Keep generating forever
  - *-2*: Fill up the text window
- **Example**: *PARAMETER num_predict 42*

### **top_k**

- **What It Does**: Limits the model to considering only the top 'k' words, reducing the chance of nonsense.
- **Default Value**: *40*
- **Min/Max**: 1 to the size of the model's vocabulary (typically in the thousands)
- **Example**: *PARAMETER top_k 40*

### **top_p**

- **What It Does**: Works with top-k to control how varied the text is. Higher = more variety.
- **Default Value**: *0.9*
- **Min/Max**: 0 to 1 (0 = most focused, 1 = most varied)
- **Example**: *PARAMETER top_p 0.9*

## Using Parameters in a Modelfile

To use these parameters in a `Modelfile`, just write **PARAMETER** followed by the name of the parameter and the value you want to set. For example:

- *PARAMETER temperature 0.7* (Sets the creativity level)
- *PARAMETER num_ctx 4096* (Sets how much text to consider)
- *PARAMETER top_k 50* (Limits to the top 50 words)
