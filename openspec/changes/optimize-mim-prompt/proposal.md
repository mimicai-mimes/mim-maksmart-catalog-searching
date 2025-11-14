# Optimize MIM Prompt for Efficiency and Clarity

## Overview
Dramatically reduce the size and complexity of the MIM prompt from 874 lines to 300-500 lines (40-60% reduction) while maintaining all critical functionality. The current prompt is overly verbose and contains redundant information that reduces AI comprehension and increases processing overhead.

## Problem Statement
The current YAML prompt in `mim.lua` has several issues:
- **Excessive verbosity**: 874 lines with redundant explanations
- **Complex nesting**: Deep hierarchical structure that's hard to parse
- **Redundant documentation**: Multiple explanations of the same concepts
- **Tool over-documentation**: Extensive descriptions of basic operations
- **Algorithm over-specification**: Too much step-by-step detail

## Goals
1. **Reduce prompt size** to 300-500 lines (target: ~400 lines)
2. **Maintain all critical functionality** and business logic
3. **Improve AI comprehension** with clearer, more concise instructions
4. **Preserve automation rules** and validation requirements
5. **Keep essential domain knowledge** about price searching

## Success Criteria
- [ ] Prompt reduced to 300-500 lines
- [ ] All automation rules preserved
- [ ] Core workflow logic maintained  
- [ ] Tool usage instructions simplified but complete
- [ ] Validation rules clear and actionable
- [ ] Domain-specific knowledge retained

## Impact
- **Faster AI processing** due to reduced token consumption
- **Better comprehension** with cleaner structure
- **Easier maintenance** with less redundancy
- **Improved reliability** through focused instructions