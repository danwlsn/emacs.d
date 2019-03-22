(global-display-line-numbers-mode)

;; the good old vim keybindings
(require-package 'evil)
(evil-mode 1)

;; Key chord for jk to exit inster mode
(require-package 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

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


;; font size
(set-face-attribute 'default nil :height 150)


;; alt as meta
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier nil)
(setq mac-option-modifier 'meta)

;; Allow hash to be entered
(define-key key-translation-map (kbd "M-3") (kbd "#"))

;; sets elpy to use pytest-runner
(setq elpy-test-runner 'elpy-test-pytest-runner)

;; remap M-. after elpy
(define-key evil-normal-state-map "\M-." 'elpy-goto-definition)
(define-key evil-normal-state-map "\M->" 'elpy-goto-definition-other-window)
(define-key evil-normal-state-map "\C-;" 'iedit-mode)


;; 80 width stuff
(setq-default fill-column 80)

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
