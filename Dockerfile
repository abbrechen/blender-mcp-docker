FROM python:3.12-slim
RUN echo "BUILDING BLENDER MCP IMAGE"
RUN pip install uv
RUN uv tool install blender-mcp

ENV BLENDER_HOST=host.docker.internal
ENV BLENDER_PORT=9876
ENV NO_PROXY=*
ENV HTTP_PROXY=
ENV HTTPS_PROXY=

CMD ["uvx", "blender-mcp"]
