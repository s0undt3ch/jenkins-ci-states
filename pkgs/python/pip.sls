include:
  - pkgs.system.python-pip


{#- Ubuntu Lucid has way too old pip package, we'll need to upgrade "by hand", salt can't do it for us #}
{% if grains['os'] == 'Ubuntu' and grains['osrelease'].startswith('10.') %}
pip-cmd:
  cmd.run:
    - name: pip -U pip
    - reload_modules: true
    - require:
      - pkg: python-pip
{% endif %}

pip:
  pip.installed:
    {%- if salt['config.get']('virtualenv_name', None) %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - upgrade: true
    - reload_modules: true
    - require:
      - pkg: python-pip
      {%- if grains['os'] == 'Ubuntu' and grains['osrelease'].startswith('10.') %}
      - cmd: pip-cmd
      {%- endif %}
