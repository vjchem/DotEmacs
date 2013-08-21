; ======================================================================
; Vijay Chemburkar 
;
; stolen from Susan N. Shepard
;
; Original lifted from the widely available samples .emacs file and
; Will Robinson.
; Lines starting with ; are comments and do not add functionality.
; ====================================================================== 


; emacs server/client.
(server-start)

(require 'generic-x)


(setq uniquify-buffer-name-style 'post-forward)

;;; turn on auto-fill (emacs 19)
;; auto fill sucks.
;;(setq-default auto-fill-function 'do-auto-fill)
(setq-default auto-fill-mode 0)


;;; Allow extra space at the end of the line 
(setq-default fill-column 74)

;;; Example of setting a variable
;;; This particular example causes the current line number to be shown
;;; Remove the ; in front to turn this feature on.
; (setq-default line-number-mode t) 

;;; Example of binding a key
;;; This particular example binds "ESC =" to the "goto-line" function.
;;; Remove the ; in front to turn this feature on.
; (global-set-key "\M-="  'goto-line) 

;; Make lines wrap automatically in text mode.
(add-hook 'text-mode-hook
          '(lambda () (auto-fill-mode 0)))

;; append local elisp dir. to the load-path
(setq load-path (append load-path '("~/elisp"))) 
(setq load-path (append load-path '("~/emacs_libs")))

;; set tab width to 4 by default
(setq-default tab-width 2)

;(setq c-basic-offset 2)
;(setq c-tab-width 2)
;(setq c-indent-level 2) 
;(setq c-brace-offset -2)
;(setq c-brace-imaginary-offset 0)
;(setq c-argdecl-indent 2)
;(setq c-label-offset -2)
;(setq c-continued-statement-offset 2)
;(setq c-auto-newline t)
;(setq c-tab-always-indent nil) 

;; spaces instead of tabs by default...
(setq-default indent-tabs-mode nil)

;; Turn off the bell
(setq visible-bell t)

;;If at beginning of a line, don't make me C-k twice.
(setq kill-whole-line t) 

;; Don't let me add new lines to the bottom of a file with the downarrow
(setq-default next-line-add-newlines nil)

;; Don't let next-line add space to the bottom of your file.
(setq-default next-line-add-newlines nil) 

;; Set up hungry deleting for c and c++
;;(setq c-hungry-delete-key 1)


;Basic unit of spaces for each indentation level.  You can change
; the 2 if you need larger or smaller indents.

(add-hook 'c++-mode-hook '(lambda () 
    (setq c-basic-offset 4)))
(add-hook 'c-mode-hook '(lambda ()
    (setq c-basic-offset 4)))


; Use only spaces for indentation (default is tabs mixed with spaces)
; so that our files will always look the same regardless of the viewing 
; software.

(add-hook 'c++-mode-hook '(lambda ()
    (setq indent-tabs-mode nil)))
(add-hook 'c-mode-hook '(lambda ()
    (setq indent-tabs-mode nil)))


; Make Emacs display the column number in the status bar.  Versions 19 
; and 20 already display the line number by default.

(setq column-number-mode t)


; Make Emacs automatically hit return for you after left curly braces,
; right curly braces, and semi-colons.

;(setq c-auto-newline 1)



; Turn on auto-fill-mode (line wrapping like in a word processor).
; This is VERY nice for typing end-of-line comments, since Emacs will
; not only position you on the next line when you go beyond the 
; fill-column (set below), but it will line you up with the first
; slash on the previous line and then put two slashes and a space for
; you!  (In C mode it's a "/* */" pair with the cursor positioned 
; correctly in the middle.)

(add-hook 'c++-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook 'turn-on-auto-fill)

;; Make lines wrap automatically in c-mode.
;;(add-hook 'c-mode-hook '(lambda () (auto-fill-mode 1))) 


; Set the fill column (the column beyond which the line will "wrap")
; to 154.  Change the 154 to whatever column you like.

(add-hook 'c++-mode-hook '(lambda ()
    (setq fill-column 70))) 
(add-hook 'c-mode-hook '(lambda ()
    (setq fill-column 70)))


; Set the default comment column for end-of-line comments to 40.
; When you want to comment the end of a line of code, put the
; cursor anywhere on that line and hold down Alt and press the
; semi-colon key (';').  Emacs automatically goes to column 40, puts
; in the appropriate comment characters, and then lets you type your
; comment.  With the auto-fill feature turned on, this also allows you 
; to have your comment extend beyond the end of the line and still be
; lined up and enclosed with comment characters for you on the next
; line.

(add-hook 'c++-mode-hook '(lambda ()
    (setq comment-column 70))) 
(add-hook 'c-mode-hook '(lambda ()
    (setq comment-column 70)))


;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right 
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(global-set-key [(shift f1)] 'call-last-kbd-macro)

;; Set up mouse wheel
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly) 

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up)) 
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)


;; Turn on global font-locking
(global-font-lock-mode t)

;; Set default foreground and background colors
(set-foreground-color "Ivory")
(set-background-color "Black")
(set-cursor-color "IndianRed")
(set-mouse-color "Black") 
(set-border-color "Blue")


(cond ((fboundp 'global-font-lock-mode)
       ;; Customize face attributes
       (setq font-lock-face-attributes
             ;; Symbol-for-Face Foreground Background Bold Italic Underline 
             '((font-lock-comment-face       "DarkOrchid") ;MediumOrchid
               (font-lock-string-face        "Firebrick") ;IndianRed
               (font-lock-keyword-face       "Blue")      ;Magenta, MediumBlue 
               (font-lock-variable-name-face "OrangeRed")
               (font-lock-type-face          "Black")
;               (font-lock-reference-face     "greenyellow")    ;LimeGreen 
;               (font-lock-doc-string-face    "Goldenrod")
               ))
       (copy-face 'bold 'font-lock-function-name-face)
       ;; Load the font-lock package.
       (require 'font-lock) 
       ;; Maximum colors
       (setq font-lock-maximum-decoration t)
       ;; Turn on font-lock in all modes that support it
       (global-font-lock-mode t)))

; Faces that may be set with font-lock: 
; -------------------------------------
 font-lock-comment-face
 font-lock-string-face
 font-lock-keyword-face
 font-lock-builtin-face
 font-lock-function-name-face
 font-lock-variable-name-face
 font-lock-type-face 
 font-lock-constant-face
 font-lock-warning-face
(set-face-foreground 'font-lock-comment-face "Red")
(set-face-foreground 'font-lock-string-face "LimeGreen")
(set-face-foreground 'font-lock-keyword-face "Yellow") 
(set-face-foreground 'font-lock-builtin-face "Yellow")
(copy-face 'bold 'font-lock-function-name-face)
(set-face-foreground 'font-lock-variable-name-face "Cyan")
(set-face-foreground 'font-lock-type-face "Yellow") 
(set-face-foreground 'font-lock-constant-face "AquaMarine")
(set-face-background 'mode-line "blue")


;(cond (running-xemacs
;       (require 'font-lock)
;font-lock-face-list's value is (
;
;       (set-face-foreground 'font-lock-comment-face "Blue") 
;       )
;      (t (global-font-lock-mode t))
;)


;; Displays the name of the file being edited in the title bar.
(setq frame-title-format "%b")


;; Makes the screen scroll only one line when the cursor moves past the edge. 
(setq scroll-step 1)
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t) 
 '(current-language-environment "English")
 '(global-font-lock-mode t nil (font-lock))
 '(jde-javadoc-describe-field-template "\"* \" (jde-javadoc-field-type modifiers)
 \" \" (jde-javadoc-code name)") 
 '(jde-javadoc-param-tag-template "\"* @param \" name \" \"")
 '(show-paren-mode t nil (paren))
 '(standard-indent 2)
 '(text-mode-hook (quote (turn-on-auto-fill (lambda nil (auto-fill-mode 1)) text-mode-hook-identify)))) 
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

;; Susan customatizations (other than color) below here 

;; Turn off tool-bar
(if (fboundp 'tool-bar-mode)
            (tool-bar-mode 0))

;;turn off that annoying dropdown menu
(if (fboundp 'menu-bar-mode)
              (menu-bar-mode -1))

;;add amazon template generators to load path
;;(add-to-list 'load-path (expand-file-name "/opt/amazon/lib/emacs"))
;;   (progn
;;     (require 'amz-utils)
;;     (autoload 'add-template "amz-templates" nil t) 
;;     (autoload 'insert-functemp "amz-templates" nil t)
;;     (autoload 'insert-methodtemp "amz-templates" nil t)
;;     (autoload 'add-revision-history-entry "amz-templates" nil t) 
;;     (autoload 'insert-classtemp "amz-templates" nil t)
;;
;;     ;; key bindings
;;     (global-set-key [f1] 'add-template)
;;     (global-set-key [f2] 'insert-functemp)
;;     (global-set-key [f3] 'insert-methodtemp) 
;;     (global-set-key [f4] 'add-revision-history-entry)
;;     (global-set-key [f5] 'insert-classtemp))


;(add-to-list 'load-path (expand-file-name "~/emacs_addon/jde/lisp"))
;(add-to-list 'load-path (expand-file-name "~/emacs_addon/semantic")) 
;(add-to-list 'load-path (expand-file-name "~/emacs_addon/speedbar"))
;(add-to-list 'load-path (expand-file-name "~/emacs_addon/elib"))
;(add-to-list 'load-path (expand-file-name "~/emacs_addon/eieio")) 
;(require 'jde)

;; rename file and buffer, jacked from steve yegge.
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ") 
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name) 
          (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name)) 
         (filename (buffer-file-name))
         (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
         (newname (concat dir "/" name))) 

    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (progn
        (copy-file filename newname 1)
        (delete-file filename)
        (set-visited-file-name newname) 
        (set-buffer-modified-p nil)
        t))))


;; amazon mason mode.
;;(load-file "/opt/amazon/website/etc/US/production-defaults/.emacs")
;;(require 'amzmason)

(setq auto-mode-alist 
  (append
   ;; File name ends with .tab or .pop
   '(("\\.tab$" . sql-mode)
     ("\\.pop$" . sql-mode)
     ("\\.asdl$" . sgml-mode))
   auto-mode-alist))

;; p4 settings 
;;(load-library "p4")
;;(when (file-executable-p "/opt/third-party/bin/p4")
;; (load-library "p4")
;;  (p4-set-p4-executable "/opt/third-party/bin/p4"))


;; switch between a cpp file and corresponding h file. from ami fischman 
(defun switch-h-cpp ()
    "Switch to the other (header/implementation) file corresponding to current buffer"
    (interactive)
    (cond
     ((equal (replace-regexp-in-string "\\.h$" ".cpp" 
                                       (buffer-file-name))
             (buffer-file-name))
      (cond
       ((equal (replace-regexp-in-string "\\.cpp$" ".h"
                                         (buffer-file-name)) (buffer-file-name)) t) 
       (t (find-file (replace-regexp-in-string
                      "\\.cpp$" ".h"
                      (buffer-file-name))))))
     (t (find-file  (replace-regexp-in-string "\\.h$" ".cpp" 
                                              (buffer-file-name))))))


;; key bindings
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-r" 'toggle-read-only)
(global-set-key "\C-b" 'man) 
(global-set-key "\C-f" 'compile)
(global-set-key "\M-R" 'revert-buffer)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key [ (f9) ] 'bs-cycle-previous) 
(global-set-key [ (f10) ] 'bs-cycle-next)
(global-set-key "\C-n" 'switch-h-cpp)

; Make Emacs use "newline-and-indent" when you hit the Enter key so
; that you don't need to keep using TAB to align yourself when coding. 
; This is akin to setting autoindent in vi.

(global-set-key "\C-m" 'newline-and-indent)

(put 'narrow-to-region 'disabled nil)

(load "~/.emacs.d/uniquify.el")


(load "~/.emacs.d/js2.elc")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(put 'downcase-region 'disabled nil)


;; (add-to-list 'load-path "/Users/vj/private/emacs/scala-mode/emacs")
;; (require 'scala-mode-auto)
