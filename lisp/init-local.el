(global-display-line-numbers-mode)

;; the good old vim keybindings
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map "M-." 'elpy-goto-definition)

;; Key chord for jk to exit inster mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; Highglight current line
(global-hl-line-mode t)
(set-face-background hl-line-face "color-236")

;; elpy
(package-initialize)
(elpy-enable)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; font size
(set-face-attribute 'default nil :height 150)


;; alt as meta
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier nil)
(setq mac-option-modifier 'meta)

;; Allow hash to be entered
(define-key key-translation-map (kbd "M-3") (kbd "#"))


;; 80 width stuff
(setq-default fill-column 80)

;; utf8 stuff
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; go go gadget emacs
(setq-default initial-scratch-message ";; Go Go Gadget Emacs")



(provide 'init-local)
