{%- from "cloudwatch/map.jinja" import cloudwatch_settings with context %}

{{ cloudwatch_settings.package_name }}_service:
  service.running:
    - name: {{ cloudwatch_settings.service_name }}
    - enable: True
    - restart: True
    - required:
      - pkg: {{ cloudwatch_settings.package_name }}
      - file: {{ cloudwatch_settings.config_file }}
    - watch:
      - file: {{ cloudwatch_settings.config_file }}
