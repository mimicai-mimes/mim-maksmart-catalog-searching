# Remove fetch Tool and Use Only Playwright MCP

**Change ID:** `remove-fetch-use-playwright-only`  
**Type:** Architecture Change  
**Status:** Proposed  
**Created:** 2025-11-15  

## Why

The system currently uses two separate tools for web interactions (`fetch` and `playwright_mcp`), creating unnecessary complexity. Consolidating to Playwright MCP only simplifies the architecture while maintaining all functionality and providing better control over dynamic content.

## What Changes

- Remove `fetch` tool definition from `mim.lua` tools section
- Update `playwright_mcp` usage documentation to cover all web interaction scenarios
- Modify search strategy to use Playwright MCP for search pages and product pages
- Update workflow execution instructions to use only Playwright MCP methods
- Replace all fetch examples with Playwright MCP equivalents

## Impact

- **Affected specs**: mim-price-search capability
- **Affected code**: `mim.lua` (tools section, workflow section, examples)
- **Breaking**: No - agents will automatically adapt to new tool configuration
- **Migration**: None required - configuration change only

## Scope

### In Scope
- Remove `fetch` tool definition from `mim.lua`
- Update `playwright_mcp` tool documentation to reflect expanded usage
- Modify search strategy to use only Playwright MCP for all web interactions
- Update workflow execution instructions to use Playwright MCP methods
- Update examples to demonstrate Playwright MCP usage patterns

### Out of Scope
- Changes to approved domains list
- Changes to matching rules or validation logic
- Changes to data schema or column definitions
- Changes to source priority lists

## Requirements

### REMOVED Requirements

#### Requirement: fetch Tool for Web Page Loading
**ID:** `REQ-FETCH-001`  
**Priority:** N/A (Removed)  

The system previously provided a `fetch` tool for loading web pages.

##### Scenario: Loading Search Results with fetch
**Given** a user needs to check product prices  
**When** the system needs to load search result pages  
**Then** it previously used `fetch(urls, query)` to load pages  
**Impact:** This tool is being removed completely

##### Scenario: Loading Product Pages with fetch
**Given** direct product URLs are available  
**When** the system needs to extract pricing information  
**Then** it previously used `fetch` to load individual product pages  
**Impact:** This functionality will be replaced by Playwright MCP

### MODIFIED Requirements

#### Requirement: Playwright MCP for All Web Interactions
**ID:** `REQ-PLAYWRIGHT-001`  
**Priority:** Critical  

The system shall use Playwright MCP exclusively for all web page interactions, including Google search, search result pages, and product pages.

##### Scenario: Loading Search Pages with Playwright
**Given** the system needs to check product availability on a marketplace  
**When** navigating to search URLs from the approved sources list  
**Then** use `#browser_navigate` to load the page  
**And** use `#browser_snapshot` to capture page content  
**And** use `#browser_evaluate` to extract product data and prices  

##### Scenario: Loading Product Pages with Playwright
**Given** direct product URLs are identified from Google search  
**When** the system needs to validate prices and article numbers  
**Then** use `#browser_navigate` to load each product page  
**And** use `#browser_snapshot` to capture the page state  
**And** use `#browser_evaluate` to extract price, article, and characteristics  

##### Scenario: Google Search with Link Extraction
**Given** the system starts a price search workflow  
**When** performing Google search to find products  
**Then** use `#browser_navigate` to load Google search URL  
**And** use `#browser_snapshot` to view results  
**And** use `#browser_evaluate` to extract product links  
**And** filter links to only approved domains  
**And** use `#browser_navigate` again for each product page  

#### Requirement: Browser Cleanup Remains Mandatory
**ID:** `REQ-CLEANUP-001`  
**Priority:** Critical  

The system must close the browser before saving results (no change to this requirement).

##### Scenario: Browser Cleanup Before Save
**Given** the system has completed price searching  
**When** ready to call `update_entry_fields`  
**Then** must call `#browser_close` first  
**And** then call `update_entry_fields` with results  

## Technical Design

### Tool Configuration Changes

**Before:**
```lua
tools:
  fetch:
    usage: "Загрузка веб-страниц (поиск + товары)"
    ...
  playwright_mcp:
    usage: "ТОЛЬКО для Google поиска → извлечение ссылок → ОБЯЗАТЕЛЬНОЕ закрытие"
    ...
```

**After:**
```lua
tools:
  playwright_mcp:
    usage: "Все веб-взаимодействия: Google поиск, страницы результатов, страницы товаров"
    copilot_id: "#playwright-mcp"
    methods:
      navigate: "#browser_navigate - переход на URL"
      snapshot: "#browser_snapshot - захват состояния страницы"
      evaluate: "#browser_evaluate - извлечение данных со страницы"
      click: "#browser_click - взаимодействие с элементами"
      close: "#browser_close - ОБЯЗАТЕЛЬНОЕ закрытие перед сохранением"
    ...
```

### Workflow Execution Changes

**Before:**
```
Google поиск → отбор по доменам → проверка через fetch
```

**After:**
```
Google поиск → отбор по доменам → проверка через Playwright navigate+snapshot+evaluate
```

### Direct Search Changes

**Before:**
```
fetch прямых источников, ПРОПУСКАЯ уже проверенные через Google
```

**After:**
```
Playwright navigate для прямых источников, ПРОПУСКАЯ уже проверенные через Google
```

## Implementation Tasks

See `tasks.md` for detailed implementation checklist.

## Testing Strategy

### Manual Testing
1. Run workflow on test entry with multiple preferred sources
2. Verify Playwright is used for all web page loads
3. Confirm prices are extracted correctly from different marketplaces
4. Validate browser cleanup happens before save

### Validation Points
- No references to `fetch` tool remain in mim.lua
- All web interaction examples use Playwright MCP methods
- Search strategy documentation reflects Playwright-only approach
- Tool cleanup instructions remain clear and mandatory

## Migration Notes

This is a configuration-only change. No data migration needed.

Existing workflows will automatically use the new tool configuration on next execution.

## Acceptance Criteria

- [ ] `fetch` tool definition completely removed from mim.lua
- [ ] `playwright_mcp` usage description updated to include all web interactions
- [ ] Search strategy section updated to use Playwright MCP for all page loads
- [ ] Examples updated to demonstrate Playwright MCP methods
- [ ] Workflow execution instructions reference only Playwright MCP
- [ ] Browser cleanup requirement still clearly documented
- [ ] No validation errors from `openspec validate --strict`

## References

- Current implementation: `mim.lua` lines 176-186 (fetch tool definition)
- Playwright MCP documentation: `mim.lua` lines 188-200 (estimated)
- Search strategy: `mim.lua` workflow section
