# Implementation Tasks

## Pre-Implementation
- [x] Review and approve proposal.md
- [x] Confirm scope and acceptance criteria

## Implementation

### 1. Remove fetch Tool
- [x] Remove `fetch` tool definition from tools section (lines ~176-186)
- [x] Remove any fetch examples from the tools section

### 2. Update Playwright MCP Configuration
- [x] Update `playwright_mcp.usage` to reflect all web interaction use cases
- [x] Expand `playwright_mcp.methods` documentation with detailed descriptions
- [x] Add examples for search page loading
- [x] Add examples for product page loading
- [x] Keep cleanup requirements clear and visible

### 3. Update Search Strategy
- [x] Modify `workflow.execution.google_search.action` to use Playwright instead of fetch
- [x] Update `workflow.execution.direct_search.action` to use Playwright instead of fetch
- [x] Ensure domain filtering logic remains intact
- [x] Keep stop rules unchanged

### 4. Update Automation Rules
- [x] Review automation_rules section for any fetch references
- [x] Ensure browser cleanup rule is still prominent
- [x] Verify no conflicting instructions exist

### 5. Update Examples Throughout
- [x] Replace any fetch usage examples with Playwright equivalents
- [x] Ensure examples show proper navigate → snapshot → evaluate pattern
- [x] Verify examples include browser_close before update_entry_fields

## Validation
- [x] Run `openspec validate remove-fetch-use-playwright-only --strict`
- [x] Fix any validation errors
- [x] Review all changes for completeness

## Documentation
- [x] Verify all tool references in prompt are accurate
- [x] Confirm workflow descriptions are clear
- [x] Ensure no outdated references to fetch remain

## Post-Implementation
- [ ] Test workflow with sample entry
- [ ] Verify prices are extracted correctly
- [ ] Confirm browser cleanup happens properly
- [x] Mark all tasks as [x] complete
