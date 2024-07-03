# Prompting with Mistral 7B Model

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

This guide provides insights on how to effectively prompt the Mistral 7B-Instruct model using structured tags for complex tasks and a more natural conversational style for simpler inquiries.

### Understanding Mistral's Prompt Structure

Mistral prompts are typically structured using the **[INST]** tags for complex instructions. However, for simpler or more conversational interactions, tags are not necessary.

- **[INST] and [/INST] Tags**:
   - **Purpose**: These tags are used to clearly define instructions within the prompt, indicating to the model the specific task to be performed.
   - **Usage**: Enclose your command or instruction within these tags for tasks that require specific outputs or structured data.

- **Special Tokens < s > and < /s >**:
   - **Purpose**: These tokens are used to mark the beginning and end of segments in multi-turn conversations.
   - **Usage**: Use these in scenarios involving multiple interactions to maintain context and coherence.

### Crafting Effective Prompts

#### Single-Turn Prompts with Tags

**Example**:

```
[INST] Generate a valid JSON object from the following data: name: John, lastname: Smith, address: #1 Samuel St. [/INST]
```
  
**Curl**:
  
```
curl -sSL -N -X POST http://localhost:11434/api/generate \
-H "Content-Type: application/json" \
-d '{
"model": "Mistral",
"prompt": "[INST] Generate a valid JSON object from the following data: name: John, lastname: Smith, address: #1 Samuel St. [/INST]"
}'
```
  
**Expected Output**:
  
```
{
    "name": "John",
    "lastname": "Smith",
    "address": "#1 Samuel St."
}
```

#### Multi-Turn Conversation Prompts with Tags

**Example**:

```
<s>[INST] What is your favorite condiment? [/INST] "I like mustard, for its sharpness." </s>  [INST] Why do you prefer it sharp? [/INST]
```
  
**Curl**:
  
```
curl -sSL -N -X POST http://localhost:11434/api/generate \
-H "Content-Type: application/json" \
-d '{
    "model": "person",
    "prompt": "<s> [INST] What is your favorite condiment? [/INST] \"I like mustard, for its sharpness.\" </s> [INST] Why do you prefer it sharp? [/INST]"
}'
```
  
**Expected Output**:
  
```
"The sharpness adds a delightful kick that enhances flavors beautifully."
```

### Flexibility in Prompting Mistral 7B-Instruct Model

When you're using the Mistral 7B-Instruct model, remember that adding special tags like **[INST]**, **< s >**, and **< /s >**, or using structured prompts, is completely up to you. These tools are there to help when you need precise answers or want to keep a conversation flowing over multiple exchanges. They can really sharpen the model's responses and make sure everything stays on track.

However, if your questions are straightforward or if you're just having a casual chat, feel free to talk to the model in plain, natural language. There's no need to dress up your words in any special format.

This flexibility means you can interact with the model in whatever way works best for you at the moment, whether you're diving into the details of a complex topic or just enjoying a simple, friendly conversation.

