# --- BUILDER ---
#FROM python:3.12-slim AS builder
#WORKDIR /app

#RUN mkdir -p /opt/tools /tmp/uv-cache
#RUN pip install --no-cache-dir uv
#ENV UV_TOOL_DIR=/opt/tools
#RUN uv tool install blender-mcp

# --- RUNTIME ---
#FROM gcr.io/distroless/python3-debian12
FROM python:3.12-slim
#WORKDIR /app

#COPY --from=builder /usr/local/bin/uv /usr/local/bin/uv
#COPY --from=builder /opt/tools /opt/tools
#COPY --from=builder /tmp/uv-cache /tmp/uv-cache

RUN pip install --no-cache-dir uv
RUN uv tool install blender-mcp

ENV UV_CACHE_DIR=/tmp/uv-cache
#ENV UV_TOOL_DIR=/opt/tools
#ENV PATH="/opt/tools/blender-mcp/bin:/usr/local/bin:$PATH"

ENV BLENDER_HOST=host.docker.internal
ENV BLENDER_PORT=9876
ENV NO_PROXY=*
ENV HTTP_PROXY=
ENV HTTPS_PROXY=
ENV DISABLE_TELEMETRY=true

CMD ["uvx", "blender-mcp"]



# OG SETUP
#FROM python:3.12-slim
#FROM python:3.12-alpine
#RUN echo "BUILDING BLENDER MCP IMAGE"
#RUN pip install uv
#RUN uv tool install blender-mcp

#ENV BLENDER_HOST=host.docker.internal
#ENV BLENDER_PORT=9876
#ENV NO_PROXY=*
#ENV HTTP_PROXY=
#ENV HTTPS_PROXY=
#ENV DISABLE_TELEMETRY=true

#CMD ["uvx", "blender-mcp"]
