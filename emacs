; Hide the default splash screen
(setq inhibit-startup-message t)

; Winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

; Set sensible tab size
(setq tab-width 4)
;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;(defvaralias 'c-basic-offset 8)

; Use UTF-8 when possible
(prefer-coding-system 'utf-8)

; Ensure identical buffers get different names
(setq uniquify-buffer-name-style 'forward)

; Highlight selection and delete it when typing over
(transient-mark-mode 't)
(delete-selection-mode 't)

; Line and column number handling
(line-number-mode 't)
(column-number-mode 't)

; Automatically follow symlinks into VCS dirs
(setq vc-follow-symlinks 't)

; Show paren matching indicators
(show-paren-mode 't)

; Highlight region when selecting
(setq-default transient-mark-mode 't)

; Enable shift-selection
(pc-selection-mode)

; For purposes of paragraph filling
(setq fill-column 80)

; Scroll one line at a time when moving cursor off-screen,
; instead of half a page.
(setq scroll-step 1)

; Prominently show trailing whitespace at the end of lines when
; editing them.
(custom-set-variables '(show-trailing-whitespace t))