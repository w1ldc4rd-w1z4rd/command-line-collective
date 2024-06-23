# Starting Ollama Server

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

Ollama is an efficient platform that enables you to download and utilize open-source models locally, automatically sourcing these models from the most optimal providers. The platform is designed to enhance performance by automatically enabling GPU acceleration if your system has a dedicated GPU, requiring no manual configuration for this feature.

To start the Ollama service on your machine, use the following command:

```
OLLAMA_HOST=0.0.0.0 ollama serve
```

This command sets the **OLLAMA_HOST** environment variable to **0.0.0.0**, allowing Ollama to listen on all network interfaces of your computer. This setup makes the service accessible from any device connected to your local network.

Once started, the Ollama service is typically accessible through the default URL:

```
http://localhost:11434/api/generate
```

This URL serves as the endpoint for interacting with the Ollama service, where you can send requests to generate outputs based on the models it has downloaded and configured.
