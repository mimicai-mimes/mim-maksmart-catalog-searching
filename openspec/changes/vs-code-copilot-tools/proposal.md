# Add Explicit VS Code Copilot Tool References to MIM Prompt

## Overview
Enhance the tools section in the MIM prompt to include explicit VS Code Copilot tool identifiers and method signatures. This will enable VS Code Copilot to automatically recognize and suggest the correct tool calls by their identifiers (e.g., #fetch_webpage).

## Problem Statement
The current tools section in the MIM prompt provides generic descriptions but doesn't include:
- **Explicit VS Code Copilot tool identifiers** (e.g., #fetch_webpage)
- **Specific method signatures** that VS Code Copilot can recognize
- **Direct tool references** that enable auto-completion and intelligent suggestions

## Goals
1. **Add explicit tool identifiers** for VS Code Copilot recognition
2. **Include specific method signatures** with parameter details
3. **Maintain existing tool documentation** while enhancing discoverability
4. **Enable intelligent tool suggestions** in VS Code Copilot chat
5. **Preserve prompt compactness** from previous optimization

## Proposed Solution
Update the tools section to include:
- `fetch_webpage` tool with explicit signature
- `mcp_playwright-mc_browser_*` methods for browser automation
- `update_mim_entry` for result saving
- Clear parameter documentation for each tool

## Success Criteria
- [ ] VS Code Copilot tool identifiers added to tools section
- [ ] Specific method signatures documented
- [ ] Tool parameter details included
- [ ] Existing functionality preserved
- [ ] Prompt remains optimized and concise

## Impact
- **Improved VS Code integration** with automatic tool recognition
- **Faster development** with intelligent tool suggestions
- **Better documentation** of available methods
- **Enhanced user experience** in VS Code Copilot