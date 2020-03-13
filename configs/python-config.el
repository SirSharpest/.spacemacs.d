(setenv "WORKON_HOME" "~/anaconda3/envs")
(pyvenv-workon "playground") ;; Default working env that has my libs

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")


;; (defun my-python-mode-setup ()
;;   (py-autopep8-enable-on-save)
;;   )

;; (add-hook 'python-mode-hook 'my-python-mode-setup)


(setq-default flycheck-disabled-checkers '(python-flake8))
(setq-default dotspacemacs-configuration-layers '(
                                                  (python :variables python-enable-yapf-format-on-save t)))


(add-hook
 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(;; Syntax
           ("def" .      #x1D41F)
           ("in" .       #x2208)
           ("not in" .   #x2209)
           ("return" .   #x27fc)
           ("yield" .    #x27fb)
           ("for" .      #x2200)
           ;; Base Types
           ("int" .      #x2124)
           ("float" .    #x211d)
           ("str" .      #x1d54a)
           ("True" .     #x1d54b)
           ("False" .    #x1d53d)
           ;; Mypy
           ("Dict" .     #x1d507)
           ("List" .     #x2112)
           ("Tuple" .    #x2a02)
           ("Set" .      #x2126)
           ("Iterable" . #x1d50a)
           ("Union" .    #x22c3)))))
