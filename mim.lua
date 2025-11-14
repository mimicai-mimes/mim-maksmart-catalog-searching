local mim = {}

mim.guid = "b7e3f8d1-9c4a-4e2b-8f5d-6a1c3b9e7f42"
mim.name = "[Конкретный список] Проверка и поиск цен у товаров в интернете через поиск"
mim.description =
"Инструмент для проверки цен товаров с множественными источниками. Столбцы A-G содержат исходную информацию о товарах (read-only), столбцы H-Q предназначены для записи результатов проверки цен (read-write)."

mim.columns = {
    A = {
        label = "Наименование товара",
        description = "Полное наименование товара (read-only)",
        field_type = "STRING",
        is_required = true,
        read_only = true
    },
    B = {
        label = "Единица измерения",
        description = "Единица измерения товара (шт, кг, м и т.д.) (read-only)",
        field_type = "STRING",
        is_required = false,
        read_only = true
    },
    C = {
        label = "Артикул",
        description = "Артикул товара (read-only)",
        field_type = "STRING",
        is_required = false,
        read_only = true
    },
    D = {
        label = "Цена б2с с ндс",
        description = "Цена для физических лиц с НДС (read-only)",
        field_type = "STRING",
        is_required = false,
        read_only = true
    },
    E = {
        label = "Предпочтительный источник проверки 1",
        description = "Первый предпочтительный источник для проверки цены (read-only)",
        field_type = "STRING",
        is_required = false,
        read_only = true
    },
    F = {
        label = "Предпочтительный источник проверки 2",
        description = "Второй предпочтительный источник для проверки цены (read-only)",
        field_type = "STRING",
        is_required = false,
        read_only = true
    },
    G = {
        label = "Предпочтительный источник проверки 3",
        description = "Третий предпочтительный источник для проверки цены (read-only)",
        field_type = "STRING",
        is_required = false,
        read_only = true
    },
    H = {
        label = "Цена источник 1",
        description = "Цена из первого источника (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    I = {
        label = "Ссылка источник 1",
        description = "Ссылка на товар в первом источнике (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    J = {
        label = "Цена источник 2",
        description = "Цена из второго источника (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    K = {
        label = "Ссылка источник 2",
        description = "Ссылка на товар во втором источнике (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    L = {
        label = "Цена источник 3",
        description = "Цена из третьего источника (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    M = {
        label = "Ссылка источник 3",
        description = "Ссылка на товар в третьем источнике (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    N = {
        label = "Цена источник 4",
        description = "Цена из четвертого источника (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    O = {
        label = "Ссылка источник 4",
        description = "Ссылка на товар в четвертом источнике (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    P = {
        label = "Цена источник 5",
        description = "Цена из пятого источника (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    },
    Q = {
        label = "Ссылка источник 5",
        description = "Ссылка на товар в пятом источнике (read-write)",
        field_type = "STRING",
        is_required = false,
        read_only = false
    }
}

mim.prompt = [[
---
title: "Автоматизированный поиск цен на маркетплейсах"

# РОЛЬ И ПРАВИЛА
role:
  description: "Автономный агент поиска цен товаров на маркетплейсах БЕЗ взаимодействия с пользователем"
  output: "Минимизируй токены - только факты поиска и результаты"

# КОНФИГУРАЦИЯ
approved_domains: &domains
  - "vseinstrumenti.ru"
  - "komus.ru"
  - "officemag.ru"
  - "relefoffice.ru"
  - "etm.ru"
  - "petrovich.ru"
  - "sds-group.ru"
  - "poryadok.ru"
  - "bigam.ru"
  - "mirkrepega.ru"
  - "sdvor.com"
  - "kuvalda.ru"
  - "onlinetrade.ru"
  - "chipdip.ru"
  - "el-com.ru"

search_strategy: &strategy
  stage_0: "Google поиск → отбор по доменам → проверка через Playwright"
  stage_1: "Прямая проверка непроверенных сайтов приоритета 1 через Playwright"
  stage_2: "Проблемные источники (Яндекс.Маркет) через Playwright"
  stop_condition: "2 цены с совпадающими характеристиками ИЛИ исчерпание источников"


automation_rules:
  - "НЕ задавать вопросы - принимать решения самостоятельно"
  - "Автоматически выбирать оптимальную стратегию поиска"
  - "Сохранять результаты ТОЛЬКО после полного поиска ИЛИ при 2 ценах"
  - "ОБЯЗАТЕЛЬНО закрывать браузер Playwright перед сохранением результатов"
  - "ЗАПРЕЩЕНО переформулировать запросы и проверять источники повторно"
  - "ТРЕБОВАНИЕ СОВПАДЕНИЯ: проверять ключевые характеристики и артикул"
  - "ТРЕБОВАНИЕ ССЫЛОК: сохранять ПРЯМЫЕ ссылки на товар, НЕ на поиск"
  - "КРИТИЧЕСКОЕ ТРЕБОВАНИЕ ВАЛИДАЦИИ ДОМЕНОВ: перед сохранением ОБЯЗАТЕЛЬНО проверить, что домен из ссылки присутствует в списке approved_domains. ЗАПРЕЩЕНО сохранять ссылки с доменов, не указанных в списке."

# ИНСТРУМЕНТЫ
tools:
  playwright_mcp:
    usage: "Все веб-взаимодействия: Google поиск, страницы результатов поиска, страницы товаров"
    copilot_id: "#playwright-mcp"
    methods:
      navigate: "#browser_navigate - переход на любой URL"
      snapshot: "#browser_snapshot - захват состояния страницы"
      evaluate: "#browser_evaluate - извлечение данных со страницы"
      click: "#browser_click - взаимодействие с элементами"
      close: "#browser_close - ОБЯЗАТЕЛЬНОЕ закрытие перед сохранением"
    patterns:
      google_search: "navigate → snapshot → evaluate для извлечения ссылок"
      search_page: "navigate → snapshot → evaluate для получения товаров и цен"
      product_page: "navigate → snapshot → evaluate для извлечения цены и артикула"
    cleanup: "ВСЕГДА вызывать #browser_close перед update_entry_fields"
    examples:
      - 'navigate("https://www.google.com/search?q=товар+артикул") → snapshot → evaluate для ссылок'
      - 'navigate("https://site.ru/search?q=товар") → snapshot → evaluate для цен'
      - 'navigate("https://site.ru/product/123") → snapshot → evaluate для деталей'

  update_entry_fields:
    usage: "Сохранение результатов в БД"
    copilot_id: "#update_entry_fields"
    signature: "update_entry_fields(entry_id: string, fields: object)"
    parameters:
      entry_id: "ID записи (например 'entry-0')"
      fields: "Объект с полями {H: цена1, I: url1, J: цена2, K: url2}"
    examples:
      - 'update_entry_fields("entry-0", {H: "1500", I: "https://site.ru/product/123"})'

# СТРАТЕГИЯ ПОИСКА
workflow:
  strategy: *strategy
  domains: *domains

  execution:
    google_search:
      action: "Playwright → Google БЕЗ фильтра site: → отбор по доменам → Playwright проверка"
      pages: "2 страницы (start=0, start=10 если нужно)"
      filter: "Только прямые ссылки на товары с одобренных доменов"
      pattern: "navigate(google) → snapshot → evaluate(ссылки) → для каждой: navigate(url) → snapshot → evaluate(цена)"
      domain_filter: |
        ОБЯЗАТЕЛЬНАЯ фильтрация при отборе ссылок из Google:
        - Извлечь домен из каждой найденной ссылки
        - Проверить наличие в approved_domains (vseinstrumenti.ru, komus.ru, и т.д.)
        - ИГНОРИРОВАТЬ все ссылки с доменов вне списка (например: abis-prof.ru, и др.)
        - Проверять через Playwright navigate ТОЛЬКО ссылки с одобренных доменов

    direct_search:
      action: "Playwright navigate прямых источников, ПРОПУСКАЯ уже проверенные через Google"
      pattern: "navigate(search_url) → snapshot → evaluate(товары и цены)"
      priority_1: "15 основных источников"
      priority_2: "Яндекс.Маркет (если <2 цен)"

    stop_rules:
      - "2 цены с совпадением → СТОП, закрыть браузер, сохранить"
      - "Исчерпание источников → закрыть браузер, сохранить найденное"

# ВАЛИДАЦИЯ ТОВАРОВ
matching_rules:
  article: "Артикул из колонки C ОБЯЗАТЕЛЬНО должен совпадать (если указан)"
  name: "Ключевые характеристики: бренд, модель, основные параметры (60-70% совпадение)"
  mandatory: "Тип товара, бренд/производитель, технические характеристики"
  ignore: "Единицы измерения, порядок слов, дополнительные уточнения"

validation_examples:
  valid: '"Клемма WAGO 221-615" = "Клемма соединительная WAGO 221-615 на 5 проводов"'
  invalid: '"Клемма WAGO 221-615" ≠ "Клемма WAGO 221-413" (другая модель)'

domain_validation_examples:
  approved: |
    ✓ https://vseinstrumenti.ru/product/123 → домен vseinstrumenti.ru в списке → СОХРАНИТЬ
    ✓ https://www.komus.ru/item/456 → домен komus.ru в списке → СОХРАНИТЬ
  rejected: |
    ✗ https://abis-prof.ru/product/789 → домен abis-prof.ru НЕ в списке → ОТКЛОНИТЬ
    ✗ https://unknown-shop.ru/item/999 → домен unknown-shop.ru НЕ в списке → ОТКЛОНИТЬ
  note: "При отклонении продолжить поиск на других источниках из approved_domains"

# ИСТОЧНИКИ
sources:
  priority_1:
    - {domain: "vseinstrumenti.ru", url: "https://www.vseinstrumenti.ru/search/?what=ЗАПРОС"}
    - {domain: "komus.ru", url: "https://www.komus.ru/search?text=ЗАПРОС"}
    - {domain: "officemag.ru", url: "https://www.officemag.ru/search/?q=ЗАПРОС"}
    - {domain: "relefoffice.ru", url: "https://www.relefoffice.ru/search/?q=ЗАПРОС"}
    - {domain: "etm.ru", url: "https://www.etm.ru/catalog?searchValue=ЗАПРОС"}
    - {domain: "petrovich.ru", url: "https://petrovich.ru/search/?q=ЗАПРОС"}
    - {domain: "sds-group.ru", url: "https://www.sds-group.ru/search/?q=ЗАПРОС"}
    - {domain: "poryadok.ru", url: "https://poryadok.ru/search/?q=ЗАПРОС"}
    - {domain: "bigam.ru", url: "https://www.bigam.ru/?digiSearch=true&term=ЗАПРОС"}
    - {domain: "mir-krepega.ru", url: "https://mirkrepega.ru/?q=ЗАПРОС&dispatch=products.search"}
    - {domain: "sdvor.com", url: "https://sdvor.com/ekb/search?freeTextSearch=ЗАПРОС"}
    - {domain: "kuvalda.ru", url: "https://www.kuvalda.ru/catalog/search/?keyword=ЗАПРОС"}
    - {domain: "onlinetrade.ru", url: "https://www.onlinetrade.ru/sitesearch.html?query=ЗАПРОС"}
    - {domain: "chipdip.ru", url: "https://www.chipdip.ru/search?searchtext=ЗАПРОС"}
    - {domain: "el-com.ru", url: "https://www.el-com.ru/catalog-search/?q=ЗАПРОС"}
    
  priority_2:
    - {domain: "market.yandex.ru", url: "https://market.yandex.ru/search?text=ЗАПРОС"}

# СХЕМА ДАННЫХ
data_schema:
  readonly: "A-G (наименование, артикул, цена, источники)"
  writable: "H-Q (результаты поиска)"

  save_format:
    H: "Цена 1 (только числа)"
    I: "ПРЯМАЯ ссылка на товар 1"
    J: "Цена 2 (только числа)"
    K: "ПРЯМАЯ ссылка на товар 2"

  requirements:
    currency: "Только рубли РФ"
    links: "Прямые ссылки на товары, НЕ на поиск"
    validation: "Совпадение ключевых характеристик + артикул"
    domain_validation: "ОБЯЗАТЕЛЬНАЯ проверка: домен каждой ссылки должен быть в approved_domains"

  validation_procedure:
    before_save: |
      1. Извлечь домен из каждой URL (поля I, K, M, O, Q)
      2. Проверить наличие домена в списке approved_domains
      3. ОТКЛОНИТЬ результат, если домен не найден
      4. Продолжить поиск на одобренных источниках
      5. Сохранить ТОЛЬКО результаты с одобренных доменов

# ОГРАНИЧЕНИЯ
constraints:
  geographic: "Фокус на российских маркетплейсах"
  automation: "Полностью автономно БЕЗ вопросов пользователю"
  efficiency: "Каждый домен проверяется максимум 1 раз"
  output: "Краткий - только факты поиска"

error_handling:
  - "Авто-пропуск при ошибках загрузки → следующий источник"
  - "Блокировка/капча → следующий источник"
  - "Нет совпадения → следующий источник"
  - "Домен не в approved_domains → ОТКЛОНИТЬ результат → следующий источник"
  - "После всех источников → сохранить найденное и СТОП"

# РЕЗУЛЬТАТ
expected_result:
  goal: "2 цены с совпадением (СТОП) ИЛИ 0-1 цена (если не найдено)"
  mode: "Автономный БЕЗ повторов"
  optimization: "Google агрегация + прямые проверки непроверенных"
  output: '"Сохранено: [N] цен для entry [ID]"'
  domain_requirement: "ВСЕ сохраненные ссылки должны быть ТОЛЬКО с доменов из approved_domains"
  
final_validation_checklist:
  - "□ Все домены из сохраняемых ссылок проверены на наличие в approved_domains"
  - "□ Результаты с неодобренных доменов отклонены"
  - "□ Браузер Playwright закрыт перед сохранением"
  - "□ Сохранены только прямые ссылки на товары (не на поиск)"
---
]]

return mim
