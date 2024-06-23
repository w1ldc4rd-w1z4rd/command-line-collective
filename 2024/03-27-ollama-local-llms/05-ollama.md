# Running LLMs Locally with Ollama

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

Ollama is a handy tool that helps you run Large Language Models (LLMs), on your own computer. To get an LLM up and running, you typically need:

- **Model Weights**: Think of these as the AI's brain. They're a set of numbers that the AI uses to make sense of language and generate text that sounds like it was written by a human.
- **Configurations**: These are like the AI's instruction manual. They tell the AI how it should act and what rules it should follow.
- **Datasets**: This is the AI's study material. It's a collection of text that the AI uses to learn about language and improve its skills.

Setting up an LLM with all these parts can be tricky. But Ollama makes it much simpler by putting everything together in one package. You just need to provide some directions in a file called the Modelfile, and Ollama takes care of the rest. With Ollama, you can start using the AI for tasks like writing, chatting, or answering questions without worrying about the complex setup process.

### Key Features of Ollama:

- **Wide Range of Models**: Supports a variety of LLMs including LLaMA-2, CodeLLaMA, Mistral, Vicuna, and more.
- **Unified Package**: Bundles model weights, configuration, and data into a single package, defined by a Modelfile.
- **User-Friendly**: Simplifies the setup and configuration process, making it easier for users to run LLMs locally.

### Installation and Setup:

- **Download Ollama**: Visit the [official Ollama website](https://ollama.ai) and download the tool for your operating system.
- **Install Ollama**: For Linux, use the following command in the terminal:
   
```
curl https://ollama.ai/install.sh | sh
```

**Run Ollama**: Once installed, Ollama creates an API to serve the model, allowing you to interact with it directly from your local machine.

### Running Models Using Ollama:

To run a model using Ollama, use the **ollama run** command in the terminal. For example, to run the LLaMA 2 model:

```
ollama run llama2
```

If the model is not already installed, Ollama will automatically download it before running. [Here is a list of models available](https://ollama.com/library).

### Shell Usage

To pipe information to Ollama or read files using it through the command line, you will typically use the standard input/output (stdin/stdout) streams or file redirection provided by your shell environment. Here's a general way of how you might use it:

**Pipe Content to Ollama**:

If you want to send the contents of a file or the output of another command to Ollama, you can use a pipe **(|)**. For example:
   
```
cat input.txt | ollama run <model-name>
```
   
Or, for output from another command:
   
```
echo "This is a test." | ollama run <model-name>
```

**Read Content from a File**:
   
If Ollama allows reading from a file directly, you would use it like this:
   
```
ollama run <model-name> -f input.txt
```

This command assumes that Ollama has a flag for file input **(-f)**. Replace **-f** with the appropriate flag according to Ollama's documentation.

**Redirect Output to a File**:
   
If you want to save the output of Ollama to a file, you can redirect the output:
   
```
ollama run <model-name> > output.txt
```

**Combine Piping and Redirection**:

You can combine piping and redirection to feed content into Ollama and save its output:
   
```
cat input.txt | ollama run <model-name> > output.txt
```
   
### Other Options

To list all the models available:

```
ollama list
```

To delete a model:

```
ollama rm <model name>
```

Connect remotely

```
ssh -t username@hostname '/usr/local/bin/ollama run <model name>'
```

### System Requirements:

The system requirements for running models with Ollama vary depending on the model. Here are some examples:

- LLaMA 2: 7B parameters
    - 3.8GB size
    - 8GB RAM required
    - command: **ollama run llama2**
- Mistral: 7B parameters
    - 4.1GB size
    - 8GB RAM required
    - command: **ollama run mistral**
- Code LLaMA: 7B parameters
    - 3.8GB size
    - 8GB RAM required
    - command: **ollama run codellama**
- LLaMA 2 13B: 13B parameters
    - 7.3GB size
    - 16GB RAM required
    - command: **ollama run llama2:13b**
- LLaMA 2 70B: 70B parameters
    - 39GB size
    - 32GB RAM required
    - command: **ollama run llama2:70b**
- Orca Mini: 3B parameters
    - 1.9GB size
    - 8GB RAM required
    - command: **ollama run orca-mini**
- Vicuna: 7B parameters
    - 3.8GB size
    - 8GB RAM required
    - command: **ollama run vicuna**
- LLaVA: 7B parameters
    - 4.5GB size
    - 8GB RAM required
    - command: **ollama run llava**
- Gemma (2B): 2B parameters
    - 1.4GB size
    - 8GB RAM required
    - command: **ollama run gemma:2b**
- Gemma (7B): 7B parameters
    - 4.8GB size
    - 8GB RAM required
    - command: **ollama run gemma:7b**
