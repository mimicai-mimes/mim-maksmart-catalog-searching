# Tasks: Улучшение извлечения цены с повторной проверкой

## 1. Implementation

- [x] Обновить секцию `tools.playwright_mcp.patterns.product_page` - добавить retry-стратегию
- [x] Обновить секцию `workflow.step_3_extract_details` - добавить алгоритм двойной проверки
- [x] Обновить секцию `error_handling.no_price` - уточнить логику повторных попыток
- [x] Обновить секцию `error_handling.screenshot_strategy` - включить retry-логику
- [x] Добавить пример retry в `tools.playwright_mcp.examples`

## 2. Validation

- [x] Проверить что промпт корректно парсится (синтаксис YAML/Markdown)
- [x] Проверить что новые инструкции не конфликтуют с существующими правилами
- [ ] Протестировать на реальных запросах к maksmart.ru

## 3. Documentation

- [x] Обновить описание в промпте о стратегии извлечения цены

## Dependencies

- Все задачи можно выполнять последовательно
- Задача 2 (Validation) зависит от завершения задачи 1 (Implementation)
