from config import settings
from tavily import TavilyClient
import trafilatura
settings = settings()
tavily_client = TavilyClient(api_key = settings.TAVILY_API_KEY)

class SearchServices:
    def web_search(self,query:str):
        result = []
        response = tavily_client.search(query,max_results = 10)
        search_result = response.get("results",[])
        for result in search_result:
            downloaded = trafilatura.fetch_url(result.get("url"))
            content = trafilatura.extract(downloaded , include_comments=False)
            result.append(
                {
                "title" : result.get("title" , ""),
                "url" :  result.get("url"),
                "content" : content
            }
            )
        return result



