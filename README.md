This Docker container is a wrapper of an existing Blender MCP server and has the goal to provide a more hardened image.

The tested setup is the following:
| Layer | Source |
| --- | ----------- |
| Client | https://opencode.ai/ |
| Wrapped Server | https://github.com/ahujasid/blender-mcp / https://pypi.org/project/blender-mcp/ |
| Blender Bridge Add-on | https://github.com/ahujasid/blender-mcp |