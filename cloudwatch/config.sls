{%- from "cloudwatch/map.jinja" import cloudwatch_settings with context %}

{{ cloudwatch_settings.config_file }}:
  file.serialize:
    - dataset: {{ cloudwatch_settings.config }}
    - serializer: json
    - required:
      - pkg: {{ cloudwatch_settings.package_name }}
