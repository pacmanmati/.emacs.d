;;
;; -- install-packages.el --
;; package install/configs using use-package.
;;

(use-package markdown-mode)

(use-package svelte-mode)

(use-package vterm
  :config
  (setq vterm-always-compile-module t)
  :bind
  ("<C-return>" . vterm))

(use-package rainbow-mode
  :hook (js-mode . rainbow-mode))

(use-package ledger-mode)

(use-package web-mode)

(use-package sudo-edit)

(use-package magit)

(use-package rust-mode)

(use-package minions
  :init (minions-mode)
  :bind ("<S-down-mouse-3>" . minions-minor-modes-menu))

(use-package which-key
  :config
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 3)
  (which-key-mode 1))

(use-package dracula-theme)
(use-package hydra)

;; TODO FIXME KLUDGE THEM NEXT FAIL DONT DONE NOTE HACK XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;; TEMP PROG HOLD XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
(use-package hl-todo)

(use-package ivy
  :config
  (ivy-mode 1)
  :bind
  ("C-s" . 'swiper-isearch)
  ("C-r" . 'swiper-isearch-backward)
  ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  ("M-y" . 'counsel-yank-pop)
  ("C-x b" . 'ivy-switch-buffer))

;; TODO setup counsel-irony
(use-package counsel)
(use-package swiper)

;; TODO company-irony-c-headers
(use-package company
  :ensure company-irony
  :init (global-company-mode)
  :config
  ;; (add-hook 'after-init-hook #'global-company-mode)
  (setq company-idle-delay 0.3)
  :bind
  ("C-." . company-search-candidates))

;; glsl shaders
(use-package glsl-mode)

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
