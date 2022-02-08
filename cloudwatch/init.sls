{%- from "cloudwatch/map.jinja" import cloudwatch_settings with context %}

include:
  - .install
  - .config
  - .service
