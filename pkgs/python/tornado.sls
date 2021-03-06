{% set min_tornado_version = '4.0' %}

include:
  - pkgs.python.pip

tornado:
  pip.installed:
    - name: 'tornado >= {{ min_tornado_version }}'
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pip: pip
