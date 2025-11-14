# Spec: Prompt Optimization

## MODIFIED Requirements

### Requirement: Prompt Size Reduction
The MIM prompt MUST be reduced from 874 lines to 300-500 lines while preserving all critical functionality.

#### Scenario: Measuring prompt efficiency
**Given** the current MIM prompt has 874 lines  
**When** optimization is applied  
**Then** the resulting prompt SHALL be between 300-500 lines  
**And** all automation rules SHALL be preserved  
**And** all tool functionality SHALL remain intact

### Requirement: Content Consolidation  
Redundant and verbose content MUST be eliminated while maintaining essential information.

#### Scenario: Tool documentation simplification
**Given** tools section currently uses ~200 lines  
**When** documentation is optimized  
**Then** tools section SHALL use ~50 lines  
**And** all tool signatures MUST be preserved  
**And** essential usage patterns SHALL be documented

#### Scenario: Workflow streamlining
**Given** workflow section currently uses ~300 lines  
**When** workflow is streamlined  
**Then** workflow section SHALL use ~150 lines  
**And** core search strategy MUST be preserved  
**And** automation rules SHALL remain functional

### Requirement: Structure Simplification
YAML structure MUST be flattened to improve readability and processing efficiency.

#### Scenario: Hierarchy reduction
**Given** current YAML has 5-6 nesting levels  
**When** structure is optimized  
**Then** maximum nesting SHALL be 3 levels  
**And** logical grouping MUST be maintained  
**And** YAML anchor usage SHOULD be minimized

### Requirement: Validation Rules Preservation
Core matching and validation logic MUST remain intact despite content reduction.

#### Scenario: Critical rule preservation  
**Given** current validation rules ensure proper product matching  
**When** content is reduced  
**Then** all critical matching criteria MUST be preserved  
**And** domain validation SHALL remain functional  
**And** price source validation MUST be intact

## ADDED Requirements

### Requirement: Performance Optimization
The optimized prompt MUST improve AI processing efficiency.

#### Scenario: Token usage reduction
**Given** current prompt consumes significant tokens  
**When** optimized prompt is used  
**Then** token consumption SHALL be reduced by 40-60%  
**And** processing speed SHOULD improve  
**And** comprehension quality MUST be maintained or improved