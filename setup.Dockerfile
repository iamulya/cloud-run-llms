FROM ollama/ollama:0.2.0

ENV OLLAMA_HOST 0.0.0.0:8080
ENV HOME /root
ENV OLLAMA_MODELS /models
ENV OLLAMA_DEBUG false

RUN apt-get update && apt-get install netcat -y

COPY download-models.sh /
RUN ./download-models.sh

CMD ["serve"]
