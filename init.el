(add-to-list 'load-path "~/.emacs.d/lisp")
(load "defaults.el")
(load "config-package.el")
(load custom-file) ;; set in defaults.el
(load "install-packages.el") ;; depends on config-package.el
(load "hydras.el")
(load "secret.el"
      :noerror t)
