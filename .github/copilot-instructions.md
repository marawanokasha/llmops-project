# Coding Style

- Use streamlit for the webapp. When using streamlit, try to make the code modular by putting pages into functions and not have a lot of directly executable code
- Use fastapi and fastapi-utils for the API.
- Make the code modular for easy testability
- Use features from python 3.12 and higher. No need to worry about 3.9 legacy stuff like "from typing import List"
- Use type annotations when possible
- try to make functions small and focused on a single task
- I am using uv for managing my dependencies, so use that if you want to add any dependencies
- Use ruff as the code formatter
