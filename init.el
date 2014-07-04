(require 'cl)

(setq inhibit-startup-screen t)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)

(prefer-coding-system 'utf-8-unix)
(set-language-environment "Japanese")
;(set-locale-environment "us.EN.UTF-8") ; "ja_JP.UTF-8"
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)

(setq default-file-name-coding-system 'utf-8-unix)

;(setq undo-outer-limit 300000000)

;(require 'ls-lisp)
;(defadvice insert-directory
;  (around reset-locale activate compile)
;    (let ((system-time-locale "C"))
;        ad-do-it))


; powerline, syncronize with solarized
;(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
;(require 'powerline)
;(setq powerline-color1 "#657b83")
;(setq powerline-color2 "#839496")

;(set-face-attribute 'mode-line nil
;                    :foreground "#fdf6e3"
;                    :background "#859900"
;                    :box nil)
;(set-face-attribute 'mode-line-inactive nil
;                    :box nil)

(setq save-place-file "~/.emacs.d/.emacs-places")

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xl" 'goto-line)

(define-key global-map [f12] nil)
;;====================
;; Eshell
;;====================
;;
(add-hook 'after-init-hook  (lambda() (eshell)))

(add-hook 'after-init-hook
          (lambda()
            (eshell)
            (switch-to-buffer "*scratch*")))

(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(global-set-key "\C-x\C-b" 'buffer-menu)

(global-set-key "\M-n" 'linum-mode)
(global-linum-mode t)     


; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/lisp/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; compatibility


;Mozc
(require 'mozc)
(setq default-input-method "japanese-mozc")
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
(add-hook 'input-method-activate-hook
	  (lambda()(set-cursor-color"blue")))
(add-hook 'input-method-inactivate-hook
	  (lambda()(set-cursor-color"white")))
(setq mozc-candidate-style 'overlay)

;; ibus-mode
;(require 'ibus)
;; Turn on ibus-mode automatically after loading .emacs
;(add-hook 'after-init-hook 'ibus-mode-on)

;; Change cursor color depending on IBus status
;(setq ibus-cursor-color "red")

;(require 'anything-startup)
(setq fci-rule-color "#eee8d5")

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(ansi-color-names-vector [solarized-bg red green yellow blue magenta cyan solarized-fg])
; '(custom-safe-themes (quote ("d24e10524bb50385f7631400950ba488fa45560afcadd21e6e03c2f5d0fad194" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "82926f759bc96ae4abb7ec58c3cc0d92f9031f24709e4b83dbf9dcb47f7c7970" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
;)
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(default ((t (:background "nil")))))

;; Ricty {{{2 (http://save.sys.t.u-tokyo.ac.jp/~yusa/fonts/ricty.html)
(set-face-attribute 'default nil
                   :family "Ricty"
                   :height 160)
;(set-fontset-font
; nil 'japanese-jisx0208
; (font-spec :family "Ricty"))

(require 'twittering-mode)
(setq twittering-use-master-password t)

(show-paren-mode 1)
 
(menu-bar-mode -1)

(tool-bar-mode -1)

(blink-cursor-mode 0)

(global-hl-line-mode)

(column-number-mode t)
(line-number-mode t)

(require 'saveplace)
(setq-default save-place t)

;(add-to-list 'default-frame-alist '(foreground-color . "white"))
;(add-to-list 'default-frame-alist '(background-color . "black"))
;(add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
;; windows size

;; tramp
(require 'tramp)
(setq tramp-default-method "sshx")

;; ;;aspell
;; (setq-default ispell-program-name "aspell")
;; ;; aspell with japanese english mixture
;; (eval-after-load "ispell"
;; '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
;; YaTeX+flyspell-mode
;(add-hook 'yatex-mode-hook 'flyspell-mode)
;(custom-set-variables 
;'(flyspell-auto-correct-binding [(control ?\:)]))
;(add-hook 'yatex-mode-hook
;    '(lambda()
;       (flyspell-mode)
;       (local-set-key [(control .)] 'flyspell-auto-correct-word)))

;;; YaTeX
;; yatex-mode
(setq auto-mode-alist 
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; 0: no-converion
;; 1: Shift JIS (windows & dos default)
;; 2: ISO-2022-JP (other default)
;; 3: EUC
;; 4: UTF-8
;(setq YaTeX-kanji-code 4)

; Tex template
(setq YaTeX-template-file "~/.emacs.d/lisp/yatex/template.tex")

; YaTex + RefTeX
(add-hook 'yatex-mode-hook 'turn-on-reftex)

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
;(load-theme 'solarized-light t t) 
(load-theme 'solarized-dark t t)
(enable-theme 'solarized-dark)

; ignore Capital Case
(setq read-file-name-completion-ignore-case t)

; auto-complete
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-completing-map "\C-h" 'ac-stop)

;; auto-complete latex mode
(setq load-path
      (append '("~/.emacs.d/auto-complete-latex")
              load-path))
(require 'auto-complete-latex)
  (setq ac-l-dict-directory "~/.emacs.d/auto-complete-latex/ac-l-dict/")
  (add-to-list 'ac-modes 'latex-mode)
  (add-hook 'latex-mode-hook 'ac-l-setup)
    ;; for YaTeX
(when (require 'auto-complete-latex nil t)
  (setq ac-l-dict-directory "~/.emacs.d/auto-complete-latex/ac-l-dict/")
  (add-to-list 'ac-modes 'yatex-mode)
  (add-hook 'yatex-mode-hook 'ac-l-setup))

;; auto-complete f90 mode



;; org-mode

;(require 'remember)
;(require 'org-remember)
;; org-modeの初期化
(require 'org-install)
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;(define-key global-map "\C-cr" 'org-remember)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/Dropbox/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;(org-remember-insinuate)
(setq org-directory "~/Dropbox/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
;; (setq org-remember-templates
;;       '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
;;         ("Bug" ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
;;         ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")
;;         ))


(setq indent-line-function 'indent-relative-maybe)
; return で 改行 + auto indent
(global-set-key "\C-m" 'newline-and-indent)

;; magit
(global-set-key "\C-cm" 'magit-status)

;; GC
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

; fortran
(setq fortran-mode-hook
      '(lambda ()
	 (define-key fortran-mode-map "\C-j" 'fortran-indent-new-line)
	 (define-key fortran-mode-map "\C-cc" 'compile)
))
; f90
(setq f90-mode-hook
      '(lambda ()
	 (define-key f90-mode-map "\C-j" 'f90-indent-new-line)
	 (define-key f90-mode-map "\C-cc" 'compile)))
(add-hook 'f90-mode-hook
	  '(lambda ()
	     (flymake-mode t)))

;; flymake
(require 'flymake)

(defun flymake-f90-init ()
  (let* (( temp-file (flymake-init-create-temp-buffer-copy
		      'flymake-create-temp-inplace))
	 (local-dir (file-name-directory buffer-file-name))
	 (local-file (file-relative-name
		      temp-file
		      local-dir)))
    (list "ifort" (list "-syntax-only" "-check all" local-file))))
(push '(".+\\f90$" flymake-f90-init) flymake-allowed-file-name-masks)

(add-hook 'f90-mode-hook
	  '(lambda ()
	     (flymake-mode t)))
(defun flymake-F77-init ()
  (let* (( temp-file (flymake-init-create-temp-buffer-copy
		      'flymake-create-temp-inplace))
	 (local-dir (file-name-directory buffer-file-name))
	 (local-file (file-relative-name
		      temp-file
		      local-dir)))
    (list "ifort" (list "-syntax-only" "-check all" local-file))))
(push '(".+\\f$" flymake-F77-init) flymake-allowed-file-name-masks)

(add-hook 'fortran-mode-hook
	  '(lambda ()
	     (flymake-mode t)))

;; ;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; ;;; Makefile doesn't exist
;; (defun my:flymake-simple-generic-init (cmd &optional opts)
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		     'flymake-create-temp-inplace))
;; 	 (local-file (file-relative-name
;; 		      temp-file
;; 		      (file-name-directory buffer-file-name))))
;;     (list cmd (append opts (list local-file)))))
;; Makefile exist
;; (defun my:flymake-simple-make-or-generic-init (cmd &optional opts)
;;   (if (file-exists-p "Makefile")
;;       (flymake-simple-make-init)
;;     (my:flymake-simple-generic-init cmd opts)))
;;; fortran90 or 95
;(defun my:flymake-gfortran-init ()
;    (my:flymake-simple-make-or-generic-init
;        "gfortran" '("-O2" "-Wall" "-Wextra" "-fsyntax-only")))
;(defun my:flymake-g95-init ()
;    (my:flymake-simple-make-or-generic-init
;        "g95" '("-O2" "-Wall" "-Wextra" "-fsyntax-only")))

;; minimal, non-make g95 setup
;; (defun flymake-g95-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		            'flymake-create-temp-inplace))
;; 	    (local-file (file-relative-name
;; 			       temp-file
;; 			             (file-name-directory buffer-file-name))))
;;           (list "/usr/bin/gfortran" (list "-c" local-file))))

;; (setq flymake-allowed-file-name-masks
;;             (cons '(".+\\.[fF]90$"
;; 		          flymake-g95-init
;; 			        flymake-simple-cleanup
;; 				      flymake-get-real-file-name)
;; 		      flymake-allowed-file-name-masks))

;; (push '("^In file \\(.+\\):\\([0-9]+\\)" 1 2) flymake-err-line-patterns)

; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

; undohist
(require 'undohist)
(undohist-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(quack-programs (quote ("mzscheme" "gauche" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 ; gnuplot-mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

; CEDET
(load-library "cedet") (global-ede-mode 1) (semantic-mode 1)

; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

; direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

; direx with popwin
(push '(direx:direx-mode :position left :width 25 :dedicated t)
            popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

; ctxmenu
(require 'ctxmenu)
(require 'ctxmenu-config)
(define-key global-map (kbd "M-@") 'ctxmenu:show)
(ctxmenu-config:setup)

(require 'inertial-scroll)
(setq inertias-global-minor-mode-map
      (inertias-define-keymap
       '(
	 ("<next>"  . inertias-up)
	 ("<prior>" . inertias-down)
	 ("C-v"     . inertias-up)
	 ("M-v"     . inertias-down)
	 ) inertias-prefix-key))
(inertias-global-minor-mode 1)

; Scheme (gosh)
(require 'quack)

(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "/usr/bin/gosh -i")

; scheme indentation
(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)
(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'match 'scheme-indent-function 1)
(put 'match-lambda 'scheme-indent-function 1)
(put 'match-let 'scheme-indent-fucntion 1)
(put 'match-let* 'scheme-indent-fucntion 1)
(put 'match-letrec 'scheme-indent-fucntion 1)
(put 'match-let1 'scheme-indent-function 2)
(put 'match-define 'scheme-indent-fucntion 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if  'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)

; tumblsocks
(require 'tumblesocks)

; helm
(require 'helm-config)
(helm-mode 1)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; Disable helm in some functions
  (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))

  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
	   (input-pattern (file-name-nondirectory pattern))
	   (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
	    (concat dirname
		    (if (string-match "^\\^" input-pattern)
			;; '^' is a pattern for basename
			;; and not required because the directory name is prepended
			(substring input-pattern 1)
		      (concat ".*" input-pattern)))))))
(shell-command-on-region (point-min) (point-max)
    (concat "grep -n ^ " buffer-file-name)
    (get-buffer-create "*tmp-linum*") nil t)
