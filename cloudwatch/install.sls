{%- from "cloudwatch/map.jinja" import cloudwatch_settings with context %}

{{ cloudwatch_settings.package_name }}:
  pkg.installed:
{%- if grains['os'] == 'Windows' %}
    - name: {{ cloudwatch_settings.package_name }}
{%- else %}
    - sources:
      - {{ cloudwatch_settings.package_name }}: {{ cloudwatch_settings.package_url }}
{%- endif %}
