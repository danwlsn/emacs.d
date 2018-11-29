(global-display-line-numbers-mode)

;; the good old vim keybindings
(require 'evil)
(evil-mode 1)

;; Key chord for jk to exit inster mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; Highglight current line
(global-hl-line-mode t)
(set-face-background hl-line-face "color-236")

;; elpy




(provide 'init-local)
