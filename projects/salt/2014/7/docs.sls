include:
  - latex
  - latex.xetex
  - pkgs.python.pip
  {%- if salt['config.get']('virtualenv_name', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.sphinx
  - pkgs.system.dejavu-sans-fonts
  - pkgs.system.dejavu-sans-mono-fonts
  - pkgs.system.dejavu-serif-fonts


{%- if salt['config.get']('virtualenv_name', None)  %}
noop:
  test.succeed_without_changes:
    - require:
      - virtualenv: create-virtualenv
{%- endif %}
