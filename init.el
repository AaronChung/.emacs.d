

;;=====load path=======
;; load melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line

;; load site-lisp path
(add-to-list 'load-path "~/.emacs.d/site-lisp")



;;=======default setting======

;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)

;; 语法高亮
(global-font-lock-mode t)

;;启动默认进入text模式
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)  

;;语法高亮
(global-font-lock-mode t)

;默认显示 80列就换行  
(setq default-fill-column 80)  

;让Emacs可以直接打开和显示图片
(setq auto-image-file-mode t)

;;在左边显示行号
(global-linum-mode 'linum-mode)

;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处
(show-paren-mode t);显示括号匹配  
(setq show-paren-style 'parenthesis)

;; 重新设置 mark set
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; start the emacsserver that listens to emacsclient
(server-start)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;;==========load plugins==========

;; load unicad
(require 'unicad)

;; tabbar-ruler
(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;(setq tabbar-ruler-global-ruler t) ; if you want a global ruler
;(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;(setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;(setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the scroll bar when your mouse is moving.
(require 'tabbar-ruler)

;; company
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'company-statistics-mode)
(company-quickhelp-mode 1)

;; ace-jump
(autoload
  'ace-jump-mode
  "ace-jump-mode" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-;") 'ace-jump-mode)
;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; ido
(require 'ido)
(ido-mode t)

;; open recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

