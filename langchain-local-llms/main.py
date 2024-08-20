import os

from fastapi import FastAPI
from langchain_community.llms import Ollama
from langchain.prompts import PromptTemplate
from langserve import add_routes
import uvicorn

OLLAMA_URL = os.environ.get("OLLAMA_SERVICE", "http://localhost:11434")
print(f"Ollama URL - {OLLAMA_URL}")

phi = Ollama(model="phi3:mini", base_url=OLLAMA_URL, verbose=True)
template = PromptTemplate.from_template("{question}")
phi_chain = template | phi 

gemma = Ollama(model="gemma2:2b", base_url=OLLAMA_URL, verbose=True)
gemma_chain = template | gemma 

app = FastAPI(title="Local LLMs using Ollama", version="1.0", description="Local LLMs using Ollama")
add_routes(app, phi_chain, path="/phi")
add_routes(app, gemma_chain, path="/gemma")

if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8000)