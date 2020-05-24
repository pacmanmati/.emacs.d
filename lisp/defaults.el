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
 custom-file "custom.el"
 backup-directory-alist `(("." . "~/.saves"))	;; dedicated dir to prevent backup file clutter
 apropos-do-all t				;; C-h a searches more extensively
 mouse-yank-at-point t				;; middle click paste at cursor (not mouse)
 uniquify-buffer-name-style 'forward		;; nicer duplicate buffer names
 load-prefer-newer t
 )

(save-place-mode 1)
