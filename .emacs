;; this is a .emacs file

;; note: if you want to comment something out then just use the semicolon character
;; note: the sequence C- means the control key, and M- means the meta key (alt)

;; this tells emacs where all of your .el files are, in this case, they are
;; in the directory ${HOME}/.emacsfiles
(setq load-path (cons "~/.emacsfiles" load-path))

;; (require 'tex-site) not required if installed via emacs itself
(require 'ess-site)

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(gnuserv-program (concat exec-directory "/gnuserv"))
 '(load-home-init-file t t)
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(font-lock-builtin-face ((((class color) (background light)) (:foreground "ForestGreen"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "Red"))))
 '(font-lock-function-name-face ((((class color) (background light)) (:foreground "Blue"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "Blue")))))

;; this sets up font-lock to put colours into your code
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; this stuff tells the various modes to use font-lock
(add-hook 'c-mode-hook           'turn-on-font-lock  t)
(add-hook 'c++-mode-hook         'turn-on-font-lock  t)
(add-hook 'python-mode-hook      'turn-on-font-lock  t)
(add-hook 'lisp-mode-hook        'turn-on-font-lock  t)
(add-hook 'emacs-lisp-mode-hook  'turn-on-font-lock  t)
(add-hook 'matlab-mode-hook      'turn-on-font-lock  t) 
(add-hook 'html32-mode-hook      'turn-on-font-lock  t)
(add-hook 'fortran-mode-hook     'turn-on-font-lock  t)
(add-hook 'info-mode-hook        'turn-on-font-lock   )
(add-hook 'dired-mode-hook       'turn-on-font-lock  t)
(add-hook 'shell-mode-hook       'turn-on-font-lock  t)
(add-hook 'makefile-mode-hook    'turn-on-font-lock  t)
(add-hook 'font-lock-mode-hook   'font-lock-after-fontify-buffer)

;; this remaps the delete key properly, so backspace deletes to the left
;; and delete deletes to the right (well, I found it handy)
(define-key function-key-map [delete] "\C-d")

;; this sets up the default font (change it, it might be too small)
;; "6x12" ("-misc-fixed-medium-r-semicondensed--12-110-75-75-c-60-*-1")           
;; "6x13" ("-misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-*-1")
;; "7x13" ("-misc-fixed-medium-r-normal--13-120-75-75-c-70-*-1")
;; "7x14" ("-misc-fixed-medium-r-normal--14-130-75-75-c-70-*-1")
;; "9x15" ("-misc-fixed-medium-r-normal--15-140-*-*-c-*-*-1")
(set-default-font "6x13")

;; use local html 
(autoload 'html-helper-mode "~/.emacsfiles/html-helper-mode" "Yay HTML" t)
;; and matlab modes
(add-to-list 'load-path "~/.emacsfiles/matlab-emacs-src")
(require 'matlab-load)

;; this is to load in the correct mode depending upon the filename extension
(setq auto-mode-alist (mapcar 'purecopy
			      '(("\\.text\\'" . text-mode)
				("\\.txt\\'" .  text-mode)
				;; html
				("\\.htm\\'" .  html-helper-mode)
				("\\.html\\'" .  html-helper-mode)
				;; programs
				("\\.c\\'" . c++-mode)
				("\\.H\\'" . c++-mode)
				("\\.h\\'" . c++-mode)
				("\\.cc\\'" .  c++-mode)
				("\\.cpp\\'" . c++-mode)
				("\\.cxx\\'" . c++-mode)
				("\\.f\\'" .   fortran-mode)
				("\\.for\\'" . fortran-mode)
				("\\.FOR\\'" . fortran-mode)	
				("\\.m\\'" . matlab-mode)
				("\\.py\\'" . python-mode)
				("\\.r\\'" . R-mode)
				("\\.R\\'" . R-mode)
				;; shell scripts
				("\\rc\\'" . shell-script-mode) 
				("\\.sh\\'" . shell-script-mode) 
				("\\.csh\\'" . shell-script-mode) 
				("\\.zsh\\'" . shell-script-mode) 
				("\\.tcl\\'" . tcl-mode)
				("\\.awk\\'" . awk-mode) 
				("\\Makefile\\'" . makefile-mode)
				("\\Makefile.am\\'" . makefile-mode)
				("\\Makefile.in\\'" . makefile-mode)
				;; latex
				("\\.tex\\'" . latex-mode)
				("\\.bib\\'" . bibtex-mode)
				;; lisp and emacs
				("\\.el\\'" . emacs-lisp-mode)
				("\\.lisp\\'" . lisp-mode)
				;; .emacs following a directory delimiter
				;; in either Unix or VMS syntax.
				("[]>:/]\\..*emacs\\'" . emacs-lisp-mode))
			      )
      )

;; display lines and columns
(setq line-number-mode t)
(setq column-number-mode t)
(setq default-abbrev-mode t)

;; TeX support
(setq-default TeX-master nil)
(setq LaTeX-mode-hook 'font-lock-mode)
(setq LaTeX-mode-hook 'auto-fill-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; make RefTeX work
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)

;; html support
(setq html-helper-do-write-file-hooks t)
(setq html-helper-build-new-buffer t)
(setq tempo-interactive t)

;; display date & time
(setq display-time-day-and-date t)

;; don't show the extra welcome buffer
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
