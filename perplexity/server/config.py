from dotenv import load_dotenv
from pydantic_settings import BaseSettings
load_dotenv()
class settings (BaseSettings):
    TAVILY_API_KEY : str = ""
    GEMINI_API_KEY : str = ""