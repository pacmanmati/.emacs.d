;;
;; -- config-package.el --
;; set up package archives and use-package.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; refresh package contents at launch, asynchronously
;; should run approx. once per boot, emacsclient shouldn't re-run
(package-refresh-contents t)

;; define auto-install packages
(setq auto-install-list '(use-package))

;; UNTESTED
;; auto-install packages
(dolist (package auto-install-list)
  (unless (package-installed-p package)
    (package-install package)))

;; always ':ensure t'
(require 'use-package-ensure)
(setq use-package-always-ensure t)
