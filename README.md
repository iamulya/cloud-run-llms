## LLM Playground

![image](https://github.com/user-attachments/assets/f23fb40b-6c5e-4b8f-b9bd-7bcd5b1edf2c)

An example LLM Playground using LangChain, LangServe and Ollama. The repo uses Dockerfiles so the same code can be easily deployed on Compute / Serverless services like Cloud Run.

### Running Locally

Start the Ollama server and pull the models we defined LLM Chains for in the LangServe Frontend. Next, start the LangServe endpoint.

```bash
# Ollama Backend
ollama serve
ollama pull gemma2:2b
ollama pull phi3:mini

# LangServe Frontend
cd langchain-local-llms/
make serve
```
