(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; if new install, re-fetch
(unless package-archive-contents
  (package-refresh-contents))

;; define auto-install packages
(setq auto-install-list '(use-package))

;; auto-install packages
(dolist (package auto-install-list)
  (unless (package-installed-p package)
    (package-install package)))

;; always ':ensure t'
(require 'use-package-ensure)
(setq use-package-always-ensure t)
