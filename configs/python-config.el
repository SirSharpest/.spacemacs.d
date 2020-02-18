(setenv "WORKON_HOME" "~/anaconda3/envs")
(pyvenv-workon "playground") ;; Default working env that has my libs

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

(setq-default flycheck-disabled-checkers '(python-flake8))
(setq-default dotspacemacs-configuration-layers '(
                                                  (python :variables python-enable-yapf-format-on-save t)))
