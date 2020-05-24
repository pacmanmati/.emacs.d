;;
;; -- install-packages.el --
;; package install/configs using use-package.
;;

(use-package vterm
  :bind
  ("<C-return>" . vterm-other-window))

(use-package minions
  :config (minions-mode)
  :bind ("<S-down-mouse-3>" . minions-minor-modes-menu))

(use-package which-key
  :config
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 1)
  (which-key-mode 1))

(use-package dracula-theme)
(use-package hydra)

(use-package ivy
  :config
  (ivy-mode 1)
  :bind
  ("C-s" . 'swiper-isearch)
  ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  ("M-y" . 'counsel-yank-pop)
  ("C-x b" . 'ivy-switch-buffer))

(use-package counsel)
(use-package swiper)

;; TODO company-irony-c-headers
(use-package company
  :ensure company-irony
  :config
  (add-hook 'after-init-hook #'global-company-mode)
  (setq company-idle-delay 0.5)
  :bind
  ("C-." . company-search-candidates))

;; mostly c++ stuff

(use-package irony
  :hook ((c-mode c++-mode) . irony-mode)
  :hook (irony-mode . irony-cdb-autosetup-compile-options))

;; (use-package irony-eldoc
;;   :hook irony-mode)

(use-package flycheck-irony
  :ensure flycheck-inline
  :hook irony
  :hook (after-init-hook . global-flycheck-mode))

;; setup lsp-mode with some frontend (company?) - auto-correct
;; maybe a linter
;; syntax checker (flymake?)
;; cpp-mode, haskell-mode, whatever else sounds useful
;; a nice theme
