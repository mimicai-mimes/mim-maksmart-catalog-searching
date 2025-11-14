# MIM Price Search - Capability Spec Delta

## REMOVED Requirements

### Requirement: Fetch Tool for Web Page Loading
**ID:** `REQ-FETCH-TOOL`  
**Priority:** N/A (Removed)

The system previously provided a dedicated `fetch` tool for loading web pages to extract product information and prices.

#### Scenario: Load Search Results with Fetch
**Given** the system needs to check prices from marketplace search pages  
**When** URLs from approved sources are provided  
**Then** the `fetch` tool was called with array of URLs and query description  
**And** page content was returned for price extraction  

**Rationale for Removal:** Playwright MCP provides superior capabilities for all web interactions, including dynamic content handling and JavaScript execution.

#### Scenario: Load Product Pages with Fetch  
**Given** direct product URLs are identified from Google search  
**When** the system needs to extract detailed price information  
**Then** the `fetch` tool was called for each product URL  
**And** product page HTML was returned  

**Rationale for Removal:** Consolidating to a single tool (Playwright MCP) simplifies the architecture and provides better control.

## MODIFIED Requirements

### Requirement: Playwright MCP for All Web Interactions

The system SHALL use Playwright MCP exclusively for all web interactions, including Google search, marketplace search pages, and product detail pages.

**ID:** `REQ-PLAYWRIGHT-UNIFIED`  
**Priority:** Critical

**Previous State:** Playwright MCP was used only for Google search and link extraction.

**New State:** Playwright MCP SHALL be used for all web page access throughout the workflow.

#### Scenario: Load Marketplace Search Pages
**Given** the system needs to search for products on an approved marketplace  
**When** constructing search URLs from the sources list  
**Then** use `#browser_navigate` to load the search page URL  
**And** use `#browser_snapshot` to capture the current page state  
**And** use `#browser_evaluate` to extract product links, prices, and details  
**And** filter results to match article numbers and product characteristics  

#### Scenario: Load Product Detail Pages
**Given** product URLs are collected from Google search or marketplace listings  
**When** the system needs to extract detailed pricing information  
**Then** use `#browser_navigate` to load each product page  
**And** use `#browser_snapshot` to view the page structure  
**And** use `#browser_evaluate` to extract price, article number, and specifications  
**And** validate article match before recording price  

#### Scenario: Execute Google Search for Product Discovery
**Given** the workflow starts with a product name and article  
**When** initiating the Google search phase  
**Then** use `#browser_navigate` to load Google search URL with product query  
**And** use `#browser_snapshot` to capture search results  
**And** use `#browser_evaluate` to extract only links from approved domains  
**And** iterate through approved links using `#browser_navigate` for each  
**And** extract prices using `#browser_evaluate` on each product page  

#### Scenario: Close Browser Before Saving Results
**Given** the system has completed price collection (2 prices found or sources exhausted)  
**When** ready to save results to database  
**Then** MUST call `#browser_close` to cleanup browser session  
**And** only after browser is closed, call `update_entry_fields` with collected data  

### Requirement: Tool Configuration Documentation

The MIM configuration MUST clearly document available tools and their usage patterns for AI agents.

**ID:** `REQ-TOOL-CONFIG`  
**Priority:** High

**Previous State:** Documented both `fetch` and `playwright_mcp` tools with separate use cases.

**New State:** MUST document only `playwright_mcp` with comprehensive usage for all web scenarios.

#### Scenario: AI Agent Discovers Available Tools
**Given** an AI agent starts processing a MIM entry  
**When** reading the tool configuration section  
**Then** sees only `playwright_mcp` tool definition  
**And** sees usage description covering search, product pages, and extraction  
**And** sees all available methods: navigate, snapshot, evaluate, click, close  
**And** sees clear cleanup requirement before saving  

#### Scenario: AI Agent Finds Usage Examples
**Given** an AI agent needs to understand how to use Playwright MCP  
**When** reviewing the tool configuration  
**Then** finds examples for navigating to search URLs  
**And** finds examples for evaluating page content  
**And** finds examples for proper browser cleanup sequence  

## ADDED Requirements

### Requirement: Consistent Web Interaction Pattern

The system SHALL follow a consistent pattern for all web page interactions: navigate → snapshot → evaluate.

**ID:** `REQ-WEB-PATTERN`  
**Priority:** Medium

#### Scenario: Standard Page Load Pattern
**Given** the system needs to access any web page for price information  
**When** performing the web interaction  
**Then** first call `#browser_navigate(url)` to load the page  
**And** then call `#browser_snapshot()` to capture page state  
**And** then call `#browser_evaluate(function)` to extract data  
**And** process extracted data before moving to next page  

#### Scenario: Multiple Pages in Sequence
**Given** the system has multiple product URLs to check  
**When** iterating through the list  
**Then** for each URL, apply the navigate → snapshot → evaluate pattern  
**And** track which domains have been checked to avoid duplicates  
**And** stop early if 2 matching prices are found  
**And** close browser after all pages processed or early stop triggered  

## Test Scenarios

### Test: Remove All Fetch References
**Given** the mim.lua file is updated  
**When** searching for "fetch" in the tools section  
**Then** no tool named "fetch" should be defined  
**And** no examples should reference the fetch tool  

### Test: Playwright MCP Covers All Use Cases
**Given** the updated Playwright MCP configuration  
**When** reviewing the usage and methods documentation  
**Then** search page loading should be covered  
**And** product page loading should be covered  
**And** data extraction should be covered  
**And** browser cleanup should be covered  

### Test: Workflow Uses Only Playwright
**Given** the workflow execution section  
**When** reviewing google_search and direct_search actions  
**Then** all references should use Playwright MCP methods  
**And** no references to fetch should exist  

### Test: Examples Are Accurate
**Given** the updated tool examples  
**When** an AI agent follows the examples  
**Then** all examples should use valid Playwright MCP method names  
**And** all examples should show proper sequence (navigate before evaluate)  
**And** all examples should demonstrate browser_close before save  
