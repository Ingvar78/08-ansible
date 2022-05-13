# Домашнее задание к занятию "08.03 Использование Yandex Cloud"

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.

Apply complete! Resources: 3 added, 0 changed, 1 destroyed.

```bash

yandex_vpc_subnet.vpcsubnet: Creation complete after 1s [id=e9b3bsugu0e62p21a76o]
yandex_compute_instance.vm["lighthouse"]: Creating...
yandex_compute_instance.vm["clickhouse"]: Creating...
yandex_compute_instance.vm["vector"]: Creating...
yandex_compute_instance.vm["lighthouse"]: Still creating... [10s elapsed]
yandex_compute_instance.vm["vector"]: Still creating... [10s elapsed]
yandex_compute_instance.vm["clickhouse"]: Still creating... [10s elapsed]
yandex_compute_instance.vm["clickhouse"]: Still creating... [20s elapsed]
yandex_compute_instance.vm["lighthouse"]: Still creating... [20s elapsed]
yandex_compute_instance.vm["vector"]: Still creating... [20s elapsed]
yandex_compute_instance.vm["vector"]: Creation complete after 21s [id=fhma74id6hk63tlu3n9j]
yandex_compute_instance.vm["clickhouse"]: Creation complete after 24s [id=fhm7ssj5svnbjadfmc9b]
yandex_compute_instance.vm["lighthouse"]: Creation complete after 24s [id=fhmkcb53t5l7ethjqac3]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

internal_ip = {
  "clickhouse" = tolist([
    "10.2.0.22",
  ])
  "lighthouse" = tolist([
    "10.2.0.21",
  ])
  "vector" = tolist([
    "10.2.0.33",
  ])
}
nat_ip = {
  "clickhouse" = tolist([
    "51.250.69.253",
  ])
  "lighthouse" = tolist([
    "51.250.88.183",
  ])
  "vector" = tolist([
    "51.250.64.213",
  ])
}
iva@c9:~/Documents/Terraform $ yc compute instance list
+----------------------+---------------+---------------+---------+---------------+-------------+
|          ID          |     NAME      |    ZONE ID    | STATUS  |  EXTERNAL IP  | INTERNAL IP |
+----------------------+---------------+---------------+---------+---------------+-------------+
| fhm7ssj5svnbjadfmc9b | c8-clickhouse | ru-central1-a | RUNNING | 51.250.69.253 | 10.2.0.22   |
| fhma74id6hk63tlu3n9j | c8-vector     | ru-central1-a | RUNNING | 51.250.64.213 | 10.2.0.33   |
| fhmkcb53t5l7ethjqac3 | c8-lighthouse | ru-central1-a | RUNNING | 51.250.88.183 | 10.2.0.21   |
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

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
