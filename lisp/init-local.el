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


;; font size
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

;; shell stuff

(defun preamble-regexp-alternatives (regexps)
  "Return the alternation of a list of regexps."
  (mapconcat (lambda (regexp)
               (concat "\\(?:" regexp "\\)"))
             regexps "\\|"))

(defvar non-sgr-control-sequence-regexp nil
  "Regexp that matches non-SGR control sequences.")

(defun regexp-alternatives (regexps)
  (mapconcat (lambda (regexp) (concat “\\(” regexp “\\)”)) regexps “\\|”))

(setq non-sgr-control-sequence-regexp
(regexp-alternatives
 '(;; icon name escape sequences
   "\033\\][0-2];.*?\007"
   ;; non-SGR CSI escape sequences
   "\033\\[\\??[0-9;]*[^0-9;m]"
   ;; noop
   "\012\033\\[2K\033\\[1F"
   )))

(defun filter-non-sgr-control-sequences-in-region (begin end)
  (save-excursion
    (goto-char begin)
    (while (re-search-forward
            non-sgr-control-sequence-regexp end t)
      (replace-match ""))))

(defun filter-non-sgr-control-sequences-in-output (ignored)
  (let ((start-marker
         (or comint-last-output-start
             (point-min-marker)))
        (end-marker
         (process-mark
          (get-buffer-process (current-buffer)))))
    (filter-non-sgr-control-sequences-in-region
     start-marker
     end-marker)))

(add-hook 'comint-output-filter-functions
          'filter-non-sgr-control-sequences-in-output)

(provide 'init-local)
