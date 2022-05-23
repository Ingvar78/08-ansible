# Домашнее задание к занятию "08.03 Использование Yandex Cloud"

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.

Apply complete! Resources: 3 added, 0 changed, 1 destroyed.

```bash

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

internal_ip = {
  "clickhouse" = tolist([
    "10.2.0.15",
  ])
  "lighthouse" = tolist([
    "10.2.0.29",
  ])
  "vector" = tolist([
    "10.2.0.33",
  ])
}
nat_ip = {
  "clickhouse" = tolist([
    "51.250.81.196",
  ])
  "lighthouse" = tolist([
    "51.250.92.217",
  ])
  "vector" = tolist([
    "51.250.91.178",
  ])
}
iva@c9:~/Documents/08-ansible/08-3/src/ansible  (08.3 *)$ yc compute instance list
+----------------------+---------------+---------------+---------+---------------+-------------+
|          ID          |     NAME      |    ZONE ID    | STATUS  |  EXTERNAL IP  | INTERNAL IP |
+----------------------+---------------+---------------+---------+---------------+-------------+
| fhmdefotau0ebqrpsnno | c8-vector     | ru-central1-a | RUNNING | 51.250.91.178 | 10.2.0.33   |
| fhmk82molcahius53o7r | c8-lighthouse | ru-central1-a | RUNNING | 51.250.92.217 | 10.2.0.29   |
| fhms00965i098mr4b4sg | c8-clickhouse | ru-central1-a | RUNNING | 51.250.81.196 | 10.2.0.15   |
+----------------------+---------------+---------------+---------+---------------+-------------+
```

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает lighthouse.
2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику lighthouse, установить nginx или любой другой webserver, настроить его конфиг для открытия lighthouse, запустить webserver.
4. Приготовьте свой собственный inventory файл `prod.yml`.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Порядок выполнения playbook

```bash
va@c9:~/Documents/08-ansible/08-3/src/ansible  (08.3 *)$ ansible-lint 
WARNING: PATH altered to include /usr/bin

```


---

