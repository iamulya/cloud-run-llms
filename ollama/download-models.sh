# Ollama is intended to be run as a local development server.
# To download gemma:2b and store it in the container image, 
# this script starts the ollama server and sends a pull command to it. 

# Function to check if ollama serve is listening on port 8080
wait_for_ollama() {
  while ! nc -z localhost 8080; do 
    sleep 1  # Wait 1 second before checking again
  done
}

# Start ollama serve in the background
ollama serve & 

# Wait for ollama serve to start listening
wait_for_ollama
echo "ollama serve is now listening on port 8080"

# Run ollama pull
ollama pull gemma2:9b
ollama pull phi3:mini
ollama pull llama3.1:8b

# Indicate successful completion
echo "Local LLMs downloaded!"