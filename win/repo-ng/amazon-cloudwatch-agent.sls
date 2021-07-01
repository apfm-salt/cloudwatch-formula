{%- from "cloudwatch/map.jinja" import cloudwatch_settings %}

{{ cloudwatch_settings.package_name }}:
  latest:
    full_name: 'CloudWatch Agent'
    installer: '{{ cloudwatch_settings.package_url }}'
    uninstaller: '{{ cloudwatch_settings.package_url }}'
    msiexec: True
    locale: en_US
    reboot: False
