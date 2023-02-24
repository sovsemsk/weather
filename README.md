# README

* Для работы sidekiq следует установть redis
* Для засеивания данных следует выполнить:
  * rake accuweather:get_fixtures
* Sidekiq запускает получение температуры 1 раз в час (shedule.rb)
* Для удобства запуск производить через Procfile.dev
