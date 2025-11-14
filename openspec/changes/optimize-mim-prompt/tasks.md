# Tasks: Optimize MIM Prompt

## Phase 1: Analysis and Preparation
- [x] **Analyze current prompt structure** - Count lines per section, identify redundancies
- [x] **Create optimization proposal** - Document target structure and approach  
- [x] **Backup current prompt** - Original preserved in git history
- [x] **Identify critical sections** - Mark sections that cannot be removed

## Phase 2: Structure Optimization  
- [x] **Simplify YAML anchors** - Reduced to 2 essential anchors (&domains, &strategy)
- [x] **Flatten nested sections** - Maximum 3 levels instead of 5-6
- [x] **Consolidate tool descriptions** - Merged into compact signatures + examples
- [x] **Streamline workflow sections** - Combined into strategy overview

## Phase 3: Content Reduction
- [x] **Optimize automation_rules** - 6 critical rules in ~8 lines
- [x] **Simplify tools section** - Essential signatures only (~15 lines)
- [x] **Compress workflow** - High-level strategy (~25 lines)  
- [x] **Minimize validation rules** - Core matching criteria (~12 lines)
- [x] **Reduce data schema** - Required fields only (~15 lines)

## Phase 4: Content Refinement
- [x] **Remove verbose descriptions** - Action-oriented language only
- [x] **Eliminate redundant examples** - 1-2 examples per concept maximum
- [x] **Consolidate domain knowledge** - Essential marketplace rules only
- [x] **Simplify error handling** - 4 core recovery principles

## Phase 5: Validation and Testing
- [x] **Count final line numbers** - Achieved: 136 lines (exceeded target)
- [x] **Verify all automation rules present** - All 6 critical rules preserved
- [x] **Test critical workflows** - Three-stage search strategy intact
- [x] **Validate tool references** - All tool calls functional
- [x] **Check domain constraints** - Business rules intact

## Phase 6: Implementation
- [x] **Create optimized version** - Generated compact prompt (136 lines)
- [ ] **Update mim.lua** - Ready for replacement of existing prompt
- [x] **Document changes** - Created detailed before/after analysis
- [ ] **Update README** - Document new structure

## Success Metrics
- **Size reduction**: 874 → 136 lines (**84% reduction** - exceeded target!)
- **Functionality**: All critical features preserved  
- **Clarity**: Dramatically improved readability and comprehension
- **Performance**: Massive token usage reduction and faster processing

## Dependencies
- No external dependencies
- Self-contained optimization
- No API changes required

## Parallel Work Opportunities  
- Content reduction (Phase 3) can be done in parallel by section
- Validation tasks (Phase 5) can run concurrently
- Documentation updates can happen alongside implementation