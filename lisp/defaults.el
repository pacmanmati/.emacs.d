;;
;; -- defaults.el --
;; loose config commands that have no place elsewhere.
;;

;; font
;; (set-frame-font "Fira Code 13" nil t)
;; this way works with emacsclient, the above does not
;; (add-to-list 'default-frame-alist '(font . "Fira Code 13"))
(add-to-list 'default-frame-alist '(font . "Gohu GohuFont 13"))

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
 save-interprogram-paste-before-kill t  ;; preserves OS clipboard in kill ring when cutting in emacs
 select-enable-clipboard t		;; makes x and emacs clipboard work the same both ways 
 custom-file "custom.el"
 auto-save-default nil			;; yeet the backup files
 make-backup-files nil
 apropos-do-all t			;; C-h a searches more extensively
 mouse-yank-at-point t			;; middle click paste at cursor (not mouse)
 uniquify-buffer-name-style 'forward	;; nicer duplicate buffer names
 load-prefer-newer t
 inhibit-startup-message t
 display-time-default-load-average nil
 create-lockfiles nil			;; don't create '.#{FILENAME}' files in current directory
 scroll-conservatively 101		;; sane cursor scrolling that doesn't disorient you - i dont know how i lived without this for so long
					;; i also have no idea why i couldn't find this under any search term on the internet
					;; instead i had to 'C-h v' my way down the rabbit hole and find out the desireable behaviour is achieved by setting this var >100
 truncate-lines nil
 confirm-kill-emacs 'yes-or-no-p
 )

;; reopen files on past line number
(save-place-mode 1)

;; typing deletes selection
(delete-selection-mode 1)

;; display (row,col) on modeline
(column-number-mode 1)

;; display time on modeline
(display-time-mode 1)

;; open .h/c in cpp mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))

;; sane mouse wheel scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; bind ;; ("<C-return>" . eshell))
(global-set-key (kbd "<C-return>") 'eshell)
