;;
;; -- defaults.el --
;; loose config commands that have no place elsewhere.
;;

;; font
(set-frame-font "Fira Code 13" nil t)

;; sometimes emacs sets a default through use
;; put such defaults in here
(defadvice en/disable-command (around put-in-custom-file activate)
      "Put declarations in `custom-file'."
      (let ((user-init-file custom-file))
        ad-do-it))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode)
(blink-cursor-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(put 'dired-find-alternate-file 'disabled nil)
(setq
 save-interprogram-paste-before-kill t          ;; preserves OS clipboard in kill ring when cutting in emacs
 select-enable-clipboard t			;; makes x and emacs clipboard work the same both ways 
 custom-file "custom.el"
 backup-directory-alist `(("." . "~/.saves"))	;; dedicated dir to prevent backup file clutter
 apropos-do-all t				;; C-h a searches more extensively
 mouse-yank-at-point t				;; middle click paste at cursor (not mouse)
 uniquify-buffer-name-style 'forward		;; nicer duplicate buffer names
 load-prefer-newer t
 inhibit-startup-message t
 )

;; reopen files on past line number
(save-place-mode 1)

;; typing deletes selection
(delete-selection-mode 1)

;; open header files in cpp mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
