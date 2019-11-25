(global-display-line-numbers-mode)

;; the good old vim keybindings
(require-package 'evil)
(evil-mode 1)

;; Key chord for jk to exit inster mode
(require-package 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; remap M-. after elpy
(define-key evil-normal-state-map "\M-." 'elpy-goto-definition)
(define-key evil-normal-state-map "\M->" 'elpy-goto-definition-other-window)

;; Highglight current line
(global-hl-line-mode t)
(set-face-background hl-line-face "color-236")

;; Search
(require-package 'elpy)

;; ag
(package-initialize)
(require-package 'elpy)
(elpy-enable)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; shell
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)



;; Font size
(set-face-attribute 'default nil :font "Inconsolata")
(set-face-attribute 'default nil :height 140)

;; Allow hash to be entered
(define-key key-translation-map (kbd "M-3") (kbd "#"))


;; utf8 stuff
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; go go gadget emacs
(setq-default initial-scratch-message ";; Go Go Gadget Emacs")

;; terms stuff
(setq term-ansi-default-program "/bin/zsh")

;; frame size
(when window-system (set-frame-size (selected-frame) 172 60))

(provide 'init-local)
