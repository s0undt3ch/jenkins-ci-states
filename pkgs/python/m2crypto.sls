include:
  - pkgs.system.gcc
  - pkgs.python.pip
  - pkgs.system.swig
  - pkgs.system.openssl-dev

m2crypto:
  pip.installed:
    {%- if grains['os_family'] in ('RedHat', 'Suse') %}
    - name: git+https://github.com/martinpaljak/M2Crypto.git#egg=M2Crypto
    {%- else %}
    - name: M2Crypto
    {%- endif %}
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pip: pip
      - pkg: gcc
      - pkg: swig
      - pkg: openssl-dev
