# Text Completions with Mistral 

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

### Curl? 

**curl** is a command-line tool used for transferring data with URLs. It supports various protocols including HTTP, HTTPS, FTP, and more. **curl** is widely used for testing, sending, and receiving data, including files and API interactions. It's known for its versatility and is available on most Unix-based systems, Windows, and macOS.

### Breakdown

- **Endpoint**: /api/generate
- **HTTP Method**: POST
- **Description**: Generates a text completion based on a provided prompt using the "Mistral" model.

**Request Example using curl (stream mode)**:

```
curl -sSL -N -X POST http://localhost:11434/api/generate \
-H "Content-Type: application/json" \
-d '{"model": "Mistral", "prompt": "Once upon a time"}'
```

This request sends a prompt to the API, which then uses the "Mistral" model to generate a continuation of the text "Once upon a time".

### General Notes on Sending Requests

- **-s**: Silent mode; suppresses progress meter and messages.
- **-S**: Shows errors, even in silent mode.
- **-L**: Follows HTTP redirects automatically.
- **-N:**  This option disables buffering of the output stream. Normally, **curl** buffers the output for performance reasons, but with streaming data, you usually want to see the data immediately.
- **-X POST**: Specifies that a POST request is being made.
- **-H "Content-Type: application/json"**: Sets the header to indicate that the content type of the request is JSON.
- **-d**: Provides the JSON data payload for the request, including the model name ("Mistral") and the necessary input data **(prompt)**.

### Parameters

- **Model Name** (required): This is the specific tool or "brain" you choose for your task. Each model has different capabilities, so you pick one based on what you need, like understanding text or analyzing images.
- **Prompt**: This is the question or task you give the model. You describe what you want it to do, like answering a question or recognizing objects in a picture.
- **Images** (optional): If your task involves pictures, you can include them here. They need to be in a format called base64, which is just a way of encoding them so they can be easily sent over the internet.

#### Advanced options for those who want more control:

- **Format**: This determines how you receive your answer. Right now, it can only send back in JSON format, which is a common format used by APIs to send and receive data.
- **Options**: These are extra settings you can adjust to change how the model thinks about your task. For example, you can make it think more creatively.
- **System Message**: Sometimes you want to give the model specific instructions or corrections; this parameter lets you do that.
- **Template**: If you have a specific format or structure you want the response to follow, you can set that here.
- **Context**: If you're having a back-and-forth conversation with the model, this helps it remember what was previously said so that it can make more sense in its responses.
- **Stream**: This decides if you want the response all at once or bit by bit. Usually, it’s simpler to get it all at once.
- **Raw**: Use this if you’re sending a fully formed request and don’t need the system to format it.
- **Keep Alive**: This tells the system how long to remember the model after your request. The default is five minutes, which means if you ask another question soon after, it can respond faster since it doesn’t have to load everything again.
