from fastapi import FastAPI
from transformers import pipeline

# Create a new FastAPI app instance
app = FastAPI()

# Initialise text generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"Message":"Hello World :)"}

@app.get("/generate")
def generate(text:str):
    # Use pipeline to generate text from given input text
    output = pipe(text)

    # Return generated text in JSON response (Written according to the flan-t5-small model, changes should be made if another model is used)
    return {"Output":output[0]['generated_text']}
    