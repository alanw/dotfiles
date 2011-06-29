; Hide the default splash screen
(setq inhibit-startup-message t)

; Winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

; Prevent Extraneous Tabs
;(setq-default indent-tabs-mode nil)

; Set sensible tab size
;(setq tab-width 4)
;(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)

(setq-default tab-width 4) ; or any other preferred value
    (setq cua-auto-tabify-rectangles nil)
    (defadvice align (around smart-tabs activate)
      (let ((indent-tabs-mode nil)) ad-do-it))
    (defadvice align-regexp (around smart-tabs activate)
      (let ((indent-tabs-mode nil)) ad-do-it))
    (defadvice indent-relative (around smart-tabs activate)
      (let ((indent-tabs-mode nil)) ad-do-it))
    (defadvice indent-according-to-mode (around smart-tabs activate)
      (let ((indent-tabs-mode indent-tabs-mode))
        (if (memq indent-line-function
                  '(indent-relative
                    indent-relative-maybe))
            (setq indent-tabs-mode nil))
        ad-do-it))
    (defmacro smart-tabs-advice (function offset)
      `(progn
         (defvaralias ',offset 'tab-width)
         (defadvice ,function (around smart-tabs activate)
           (cond
            (indent-tabs-mode
             (save-excursion
               (beginning-of-line)
               (while (looking-at "\t*\\( +\\)\t+")
                 (replace-match "" nil nil nil 1)))
             (setq tab-width tab-width)
             (let ((tab-width fill-column)
                   (,offset fill-column)
                   (wstart (window-start)))
               (unwind-protect
                   (progn ad-do-it)
                 (set-window-start (selected-window) wstart))))
            (t
             ad-do-it)))))
    (smart-tabs-advice c-indent-line c-basic-offset)
    (smart-tabs-advice c-indent-region c-basic-offset)

(defun recentf-open-files-compl ()
    (interactive)
    (let* ((tocpl (mapcar (lambda (x) (cons (file-name-nondirectory x) x))
                          recentf-list))
           (fname (completing-read "File name: " tocpl nil nil)))
      (when fname
        (find-file (cdr (assoc-string fname tocpl))))))
              
(global-set-key "\C-x\C-r" 'recentf-open-files-compl)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'cl)

(defun file-in-directory-list-p (file dirlist)
  "Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
  (let ((dirs (mapcar 'expand-file-name dirlist))
        (filedir (expand-file-name (file-name-directory file))))
    (and
     (file-directory-p filedir)
     (member-if (lambda (x) ; Check directory prefix matches
                  (string-match (substring x 0 (min(length filedir) (length x))) filedir))
                dirs))))

; this solves the problem of std header files (no extension) to
; be formatted properly
(defun buffer-standard-include-p ()
  "Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
  (and (getenv "INCLUDE")
       (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

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
;(custom-set-variables '(show-trailing-whitespace t))
