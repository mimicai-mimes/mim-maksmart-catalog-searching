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
  stage_0: "Google поиск → отбор по доменам → проверка через fetch"
  stage_1: "Прямая проверка непроверенных сайтов приоритета 1"
  stage_2: "Проблемные источники (Яндекс.Маркет)"
  stop_condition: "2 цены с совпадающими характеристиками ИЛИ исчерпание источников"

# РОЛЬ И ПРАВИЛА
role:
  description: "Автономный агент поиска цен товаров на маркетплейсах БЕЗ взаимодействия с пользователем"
  output: "Минимизируй токены - только факты поиска и результаты"

automation_rules:
  - "НЕ задавать вопросы - принимать решения самостоятельно"
  - "Автоматически выбирать оптимальную стратегию поиска"
  - "Сохранять результаты ТОЛЬКО после полного поиска ИЛИ при 2 ценах"
  - "ЗАПРЕЩЕНО переформулировать запросы и проверять источники повторно"
  - "ТРЕБОВАНИЕ СОВПАДЕНИЯ: проверять ключевые характеристики и артикул"
  - "ТРЕБОВАНИЕ ССЫЛОК: сохранять ПРЯМЫЕ ссылки на товар, НЕ на поиск"

# ИНСТРУМЕНТЫ
tools:
  fetch:
    usage: "Загрузка веб-страниц (поиск + товары)"
    signature: "fetch([urls], 'описание_поиска')"
    examples:
      - 'fetch(["https://site.ru/search?q=товар"], "товары с артикулами")'
      - 'fetch(["https://site.ru/product/123"], "цена в рублях")'

  playwright:
    usage: "ТОЛЬКО для Google поиска → извлечение ссылок"
    methods: "browser_navigate → browser_snapshot/browser_evaluate → browser_close"
    query_format: "https://www.google.com/search?q=НАЗВАНИЕ+АРТИКУЛ+купить"

  update_entry:
    usage: "Сохранение результатов в БД"
    signature: "update_entry_fields(entry_id, {H: цена1, I: url1, J: цена2, K: url2})"

# СТРАТЕГИЯ ПОИСКА
workflow:
  strategy: *strategy
  domains: *domains

  execution:
    google_search:
      action: "Playwright → Google БЕЗ фильтра site: → отбор по доменам → fetch проверка"
      pages: "2 страницы (start=0, start=10 если нужно)"
      filter: "Только прямые ссылки на товары с одобренных доменов"

    direct_search:
      action: "fetch прямых источников, ПРОПУСКАЯ уже проверенные через Google"
      priority_1: "15 основных источников"
      priority_2: "Яндекс.Маркет (если <2 цен)"

    stop_rules:
      - "2 цены с совпадением → СТОП, сохранить"
      - "Исчерпание источников → сохранить найденное"

# ВАЛИДАЦИЯ ТОВАРОВ
matching_rules:
  article: "Артикул из колонки C ОБЯЗАТЕЛЬНО должен совпадать (если указан)"
  name: "Ключевые характеристики: бренд, модель, основные параметры (60-70% совпадение)"
  mandatory: "Тип товара, бренд/производитель, технические характеристики"
  ignore: "Единицы измерения, порядок слов, дополнительные уточнения"

validation_examples:
  valid: '"Клемма WAGO 221-615" = "Клемма соединительная WAGO 221-615 на 5 проводов"'
  invalid: '"Клемма WAGO 221-615" ≠ "Клемма WAGO 221-413" (другая модель)'

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
  - "После всех источников → сохранить найденное и СТОП"

# РЕЗУЛЬТАТ
expected_result:
  goal: "2 цены с совпадением (СТОП) ИЛИ 0-1 цена (если не найдено)"
  mode: "Автономный БЕЗ повторов"
  optimization: "Google агрегация + прямые проверки непроверенных"
  output: '"Сохранено: [N] цен для entry [ID]"'
---
]]

return mim
