{%- from "cloudwatch/map.jinja" import cloudwatch_settings with context %}

{{ cloudwatch_settings.config_file }}:
  file.serialize:
    - dataset: {{ cloudwatch_settings.config }}
    - serializer: json

{{ cloudwatch_settings.package_name }}:
  pkg.installed:
{%- if grains['os'] == 'Windows' %}
{# install from the formula winrepo definition #}
    - name: {{ cloudwatch_settings.package_name }}
    - extra_install_flags: {{ cloudwatch_settings.install_options }}
{%- else %}
    - sources:
      - {{ cloudwatch_settings.package_name }}: {{ cloudwatch_settings.package_url }}
{%- endif %}
  service.running:
    - name: {{ cloudwatch_settings.service_name }}
    - enable: True
    - restart: True
    - required:
      - pkg: {{ cloudwatch_settings.package_name }}
    - watch:
      - file: {{ cloudwatch_settings.config_file }}
