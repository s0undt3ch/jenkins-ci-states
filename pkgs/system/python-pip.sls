include:
  - pkgs.system.ca-certificates

{%- if grains['os'] == 'Arch' %}
  {% set pip = 'python2-pip' %}
{%- elif grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
  {% set pip = 'python26-pip' %}
{%- else %}
  {% set pip = 'python-pip' %}
{%- endif %}

python-pip:
  pkg.latest:
    - name: {{ pip }}
    - upgrade: true
    - reload_modules: true
    - require:
      - test: ca-certificates
