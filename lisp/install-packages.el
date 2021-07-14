;;
;; -- install-packages.el --
;; package install/configs using use-package.
;;

(use-package markdown-mode)

(use-package svelte-mode)

(use-package racket-mode)

(use-package rust-mode)

;; TODO consider switching to eshell, it's way faster and might have nicer emacs compat
;; (use-package vterm
;;   :config
;;   (setq vterm-always-compile-module t)
;;   :bind
;; ("<C-return>" . vterm))

;; TODO opening files within emacs using vterm
;; apparently this breaks with remote systems
(defun vterm-directory-sync ()
  "Synchronize current working directory."
  (interactive)
  (ignore-errors ;; ignore error when no vterm exists
    (when vterm--process
    (let* ((pid (process-id vterm--process))
           (dir (file-truename (format "/proc/%d/cwd/" pid))))
      (setq default-directory dir)))))

(advice-add #'counsel-find-file :before #'vterm-directory-sync)

(use-package ledger-mode)

(use-package sudo-edit)

(use-package magit)

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
(use-package hl-todo
  :hook (after-init-hook . global-hl-todo-mode))

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

(use-package counsel)
(use-package swiper)
