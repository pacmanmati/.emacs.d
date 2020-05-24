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