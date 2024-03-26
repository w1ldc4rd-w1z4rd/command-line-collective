# Guide to Running Large Language Models Locally with Ollama

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

Ollama is a streamlined tool for running open-source Large Language Models (LLMs) locally on your machine. It simplifies the process by bundling model weights, configurations, and datasets into a single package managed by a Modelfile.

### Key Features of Ollama:

- **Wide Range of Models**: Supports a variety of LLMs including LLaMA-2, CodeLLaMA, Mistral, Vicuna, and more.
- **Unified Package**: Bundles model weights, configuration, and data into a single package, defined by a Modelfile.
- **User-Friendly**: Simplifies the setup and configuration process, making it easier for users to run LLMs locally.

### Installation and Setup:

1. **Download Ollama**: Visit the [official Ollama website](https://ollama.ai) and download the tool for your operating system.
2. **Install Ollama**: For Linux, use the following command in the terminal:
   
   ```
   curl https://ollama.ai/install.sh | sh
   ```

3. **Run Ollama**: Once installed, Ollama creates an API to serve the model, allowing you to interact with it directly from your local machine.

### Running Models Using Ollama:

To run a model using Ollama, use the `ollama run` command in the terminal. For example, to run the LLaMA 2 model:

```
ollama run llama2
```

If the model is not already installed, Ollama will automatically download it before running.

To pipe information to Ollama or read files using it through the command line, you will typically use the standard input/output (stdin/stdout) streams or file redirection provided by your shell environment. Here's a general way of how you might use it:

### Shell Usage

1. **Pipe Content to Ollama**:

   If you want to send the contents of a file or the output of another command to Ollama, you can use a pipe (`|`). For example:
   
   ```bash
   cat input.txt | ollama run <model-name>
   ```
   
    Or, for output from another command:
   
   ```bash
   echo "This is a test." | ollama run <model-name>
   ```

3. **Read Content from a File**:
   
   If Ollama allows reading from a file directly, you would use it like this:
   
   ```bash
   ollama run <model-name> -f input.txt
   ```

   This command assumes that Ollama has a flag for file input (`-f`). Replace `-f` with the appropriate flag according to Ollama's documentation.

4. **Redirect Output to a File**:
   
   If you want to save the output of Ollama to a file, you can redirect the output:
   
   ```bash
   ollama run <model-name> > output.txt
   ```

5. **Combine Piping and Redirection**:

   You can combine piping and redirection to feed content into Ollama and save its output:
   
   ```bash
   cat input.txt | ollama run <model-name> > output.txt
   ```

6. **Using xargs for Multiple Arguments**:

   If you need to run Ollama with arguments that are generated from another command, you can use `xargs`:
   
   ```bash
   cat args.txt | xargs ollama run <model-name>
   ```

### System Requirements:

The system requirements for running models with Ollama vary depending on the model. Here are some examples:

| Model       | Parameters | Size  | RAM Required | Command                 |
| ----------- | ---------- | ----- | ------------ | ----------------------- |
| LLaMA 2     | 7B         | 3.8GB | 8GB          | `ollama run llama2`     |
| Mistral     | 7B         | 4.1GB | 8GB          | `ollama run mistral`    |
| Code LLaMA  | 7B         | 3.8GB | 8GB          | `ollama run codellama`  |
| LLaMA 2 13B | 13B        | 7.3GB | 16GB         | `ollama run llama2:13b` |
| LLaMA 2 70B | 70B        | 39GB  | 32GB         | `ollama run llama2:70b` |
| Orca Mini   | 3B         | 1.9GB | 8GB          | `ollama run orca-mini`  |
| Vicuna      | 7B         | 3.8GB | 8GB          | `ollama run vicuna`     |
| LLaVA       | 7B         | 4.5GB | 8GB          | `ollama run llava`      |
| Gemma (2B)  | 2B         | 1.4GB | 8GB          | `ollama run gemma:2b`   |
| Gemma (7B)  | 7B         | 4.8GB | 8GB          | `ollama run gemma:7b`   |

