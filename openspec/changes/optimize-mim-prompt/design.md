# Design: Optimized MIM Prompt Architecture

## Current State Analysis

### Structure Issues
- **Deep Nesting**: 5-6 levels of YAML hierarchy create cognitive overhead
- **Verbose Descriptions**: Tool descriptions repeated multiple times
- **Process Over-Documentation**: Step-by-step algorithms that could be principles
- **Examples Overload**: Too many examples for each concept

### Content Analysis (874 lines breakdown)
- **Tools Documentation**: ~200 lines (can reduce to ~50)
- **Workflow Details**: ~300 lines (can reduce to ~100) 
- **Validation Rules**: ~150 lines (can reduce to ~50)
- **Data Schema**: ~100 lines (can reduce to ~40)
- **Configuration**: ~124 lines (minimal reduction needed)

## Optimization Strategy

### 1. Flatten Structure
- Reduce nesting levels from 5-6 to maximum 3
- Use inline descriptions instead of separate sections
- Combine related concepts into single blocks

### 2. Consolidate Documentation
- **Tools**: Single compact description per tool with essential usage only
- **Workflow**: Focus on principles rather than step-by-step algorithms
- **Validation**: Core rules without extensive examples

### 3. Eliminate Redundancy
- Remove duplicate strategy descriptions
- Consolidate similar rules
- Use references for repeated concepts

### 4. Essential Information Only
Keep:
- Core automation rules
- Critical domain knowledge
- Essential tool signatures
- Key validation criteria
- Required data schema

Remove:
- Verbose explanations
- Detailed examples
- Implementation details
- Debugging information
- Process documentation

## Target Architecture

```yaml
# Core Configuration (100 lines)
role: # Concise role definition
automation_rules: # Essential rules only
approved_domains: &domains # Reference list

# Tools (50 lines) 
tools:
  fetch: # Compact signature + usage
  playwright: # Essential browser ops
  update_entry: # Save functionality

# Workflow (150 lines)
workflow:
  search_strategy: # High-level approach
  validation: # Core matching rules
  save_format: # Required schema

# Domain Rules (100 lines)
matching_criteria: # Compact validation rules
sources: # Essential source list
constraints: # Critical limitations
```

## Implementation Approach

### Phase 1: Structure Simplification
1. Flatten nested sections
2. Remove redundant headings
3. Consolidate related concepts

### Phase 2: Content Reduction
1. Trim verbose descriptions
2. Keep only essential examples  
3. Focus on actionable rules

### Phase 3: Validation
1. Ensure all critical functionality preserved
2. Test with existing use cases
3. Verify automation rules intact

## Risk Mitigation
- **Information Loss**: Careful review to preserve critical domain knowledge
- **Functionality Impact**: Staged reduction with validation at each step
- **Maintainability**: Clear structure for future modifications